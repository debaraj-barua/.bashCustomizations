## SOURCE:
## https://gist.github.com/StefanFabian/17fa715e783cd2be6a32cd5bbb98acd9#file-anaconda_with_ros_wrapper-bash

### This script wraps all executables in the anaconda bin folder so that they can be used without adding Anaconda
### to the path which would break some functionality of ROS (Robot Operating System)
###
### The commands e.g. jupyter notebook will cause the script to add anaconda to the path, start jupyter notebook
### and after jupyter notebook terminated remove anaconda from the path again
###
### Notable commands:
### * release-the-snake       Adds conda to the path and removes all aliases defined by this script
###                           Conda will stay in the PATH until the end of the session (terminal is closed) or
###                           until "cage-the-snake" is called
### * cage-the-snake          Removes conda from the path and redefines all aliases for anaconda executables
### * source activate [env]   Works just like with anaconda in the PATH, will activate the environment or (root) and
###                           Anaconda will stay in the PATH for the remaining session or until "source deactivate" is run
### * source deactivate       Deactivates the environment and if Anaconda wasn't released manually using release-the-snake
###                           Anaconda will be removed from the PATH again.


if [ -z ${_ROS_CONDA_ADDED+x} ]
then
  _ROS_CONDA_PATH=~/anaconda3/bin
  _ROS_CONDA_ADDED=0
  _ROS_CONDA_ALIASES=''
  _ROS_CONDA_RELEASED_MANUALLY=0
  _ROS_CONDA_PYTHONPATH_WITHOUT_ROS=$PYTHONPATH
  _PS1=$PS1
fi

function _ROS_CONDA_addAliases {
  if [[ $_ROS_CONDA_ALIASES != '' ]]
  then
    echo "ROS Conda Wrapper: Error! Aliases already defined!"
    _ROS_CONDA_removeAliases
  fi
  
  for file in $_ROS_CONDA_PATH/*
  do
    local name
    name=${file##*/}
    if ! [ -x "$(command -v $name)" ]
    then
      alias $name='_ROS_CONDA_runWithConda '$name' $@'
      _ROS_CONDA_ALIASES=$_ROS_CONDA_ALIASES" "$name
    fi
  done
}

function _ROS_CONDA_removeAliases {
  for cmd in $_ROS_CONDA_ALIASES
  do
    unalias $cmd
  done
  _ROS_CONDA_ALIASES=''
}

function _ROS_CONDA_runWithConda {
  _ROS_CONDA_ensureCondaInPath
  command $@
  _ROS_CONDA_removeCondaFromPath
}

function _ROS_CONDA_ensureCondaInPath {
  if [ $_ROS_CONDA_ADDED -eq 1 ]
  then
    return 1 # false
  fi
  _ROS_CONDA_ADDED=1

  # Check that the path doesn't start, end or contain the ros conda path
  if [[  $PATH != $_ROS_CONDA_PATH":"* && $PATH != *":"$_ROS_CONDA_PATH && $PATH != *":"$_ROS_CONDA_PATH":"* ]]
  then
    export PATH=$_ROS_CONDA_PATH:$PATH
    # Backup and clear python path to keep ros from checking ros directories for python modules
    _ROS_CONDA_PYTHONPATH_BACKUP=$PYTHONPATH
    export PYTHONPATH=$_ROS_CONDA_PYTHONPATH_WITHOUT_ROS
    
    # Unalias the stuff
    _ROS_CONDA_removeAliases

    _UPDATE_PROMPT

    return 0 # true
  fi
  return 1
}

function _ROS_CONDA_removeCondaFromPath {
  if [[ $PATH = $_ROS_CONDA_PATH":"* ]]
  then
    export PATH=${PATH#$_ROS_CONDA_PATH:}
  elif [[ $PATH = *":"$_ROS_CONDA_PATH ]]
  then
    export PATH=${PATH%:$_ROS_CONDA_PATH}
  elif [[ $PATH = *":"$_ROS_CONDA_PATH":"* ]]
  then
    export PATH=${PATH//:$_ROS_CONDA_PATH:/:}
  fi

  if [ $_ROS_CONDA_ADDED -eq 1 ]
  then
    # Restore ROS PYTHONPATH
    export PYTHONPATH=$_ROS_CONDA_PYTHONPATH_BACKUP
    _ROS_CONDA_addAliases

    _UPDATE_PROMPT

  fi 

  _ROS_CONDA_ADDED=0
}

function _ROS_CONDA_sourceWrapper {
  if [ $1 == "activate" ]
  then
    _ROS_CONDA_ensureCondaInPath
    if [ $# == 1 ]
    then
    # If only source activate call source activate root.
    # Otherwise it will fail. Don't know why though
      command source activate
    else
      command source $@
    fi
  elif [ $1 == "deactivate" ]
  then
    command source deactivate
    if [ $_ROS_CONDA_RELEASED_MANUALLY -eq 0 ]
    then
      _ROS_CONDA_removeCondaFromPath
    fi
  else
    command source $@
  fi
}

if [ $_ROS_CONDA_ADDED -eq 0 ]
then
  if [[ $_ROS_CONDA_ALIASES != '' ]]
  then
    _ROS_CONDA_removeAliases
  fi
  _ROS_CONDA_addAliases
fi

# add conda identifier to prompt
function _UPDATE_PROMPT {
  if [[  $PATH == $_ROS_CONDA_PATH":"* || $PATH == *":"$_ROS_CONDA_PATH || $PATH == *":"$_ROS_CONDA_PATH":"* ]]
  then 
    export PS1="\[\033[0;36m\][conda] $_PS1"
  else
    export PS1="$_PS1"
  fi
}

_UPDATE_PROMPT
alias source='_ROS_CONDA_sourceWrapper'
alias release-the-snake='_ROS_CONDA_RELEASED_MANUALLY=1; if _ROS_CONDA_ensureCondaInPath; then echo "All hail the snake!"; else echo "The snake is in another castle!
Jk, you released it already."; fi'
alias cage-the-snake='_ROS_CONDA_RELEASED_MANUALLY=0; _ROS_CONDA_removeCondaFromPath; echo "The snake has been caged if it wasn'"'"'t already."'