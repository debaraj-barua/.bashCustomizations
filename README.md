<h1>bashCustomizations</h1>

Custom bashrc files and aliases.

<h1>Table Of Content</h1>

- [Getting Started and Installation](#getting-started-and-installation)
  - [[Note] Using Conda with ROS Functionality](#note-using-conda-with-ros-functionality)
  - [[Note] Random](#note-random)
- [How To Use?](#how-to-use)
  - [Aliases Defined](#aliases-defined)
  - [Package Specific Functionalities](#package-specific-functionalities)
    - [Git](#git)
    - [Node Package Manager (*npm*)](#node-package-manager-npm)
    - [Using Anaconda with ROS](#using-anaconda-with-ros)

# Getting Started and Installation

- Clone the repository.

  ```bash
  cd ~ && git clone https://github.com/debaraj-barua/.bashCustomizations.git
  ```

- Add the lines below to your `.bashrc` file. If you do not need any functionality, comment or remove that particular line.

  ```bash  
  # ---------------------------------------------------------------------------------------
  # bashCustomizations

  if [  -d "$HOME"/.bashCustomizations/ ]; then
    # npm functionalities
    . "$HOME"/.bashCustomizations/package_specific_functionalities/bashrc_npm.bash

    # git functionalities
    . "$HOME"/.bashCustomizations/package_specific_functionalities/bashrc_git.bash

    # conda with ros functionalities
    . "$HOME"/.bashCustomizations/package_specific_functionalities/conda_with_ros.bash

    # generic aliases
    . "$HOME"/.bashCustomizations/aliases/generic_aliases.bash

    # docker aliases
    . "$HOME"/.bashCustomizations/aliases/docker_aliases.bash

    # shorten prompt alias
    . "$HOME"/.bashCustomizations/aliases/shorterPrompt.bash
  fi
  # ---------------------------------------------------------------------------------------

  ```

## [Note] Using Conda with ROS Functionality

  This has been taken from [StefanFabian's gist](https://gist.github.com/StefanFabian/17fa715e783cd2be6a32cd5bbb98acd9#file-anaconda_with_ros_wrapper-bash)

  1. Remove the line that adds the anaconda bin folder to your PATH in the ~/.bashrc file (if you've let anaconda add itself to the PATH during installation)
  1. Change `_ROS_CONDA_PATH` in [conda_with_ros file](package_specific_functionalities/conda_with_ros.bash) _line 23_ to the path of your Anaconda bin folder (if you didn't install it to `~/anaconda3`)
  1. Add the scripts mentioned above **_before any_** ROS setup bash files are sourced.

## [Note] Random

  In addition to useful bash scripts, the [random](random/README.md) directory has a list of known issues, workarounds and scripts not related to bash.

# How To Use

## Aliases Defined

  | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Command  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; Alias &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|
  |---------------------------------------|----------------------------------------------------------|
  | <b>Get rid of command not found:</b>  |                                                          |
  | cd..                                  | cd ..                                                    |
  |                                       |                                                          |
  | <b>Quicker change directory:</b>      |                                                          |
  | cd ..                                 | ..                                                       |
  | cd ../..                              | ...                                                      |
  | cd ../../..                           | ....                                                     |
  | cd ../../../..                        | .....                                                    |
  |                                       |                                                          |
  | <b>Resume wget by default:</b>        |                                                          |
  | wget -c                               | wget                                                     |
  |                                       |                                                          |
  | <b>Restart network-manager:</b>       |                                                          |
  | sudo service network-manager restart  | net-restart                                              |
  |                                       |                                                          |
  | <b>Quicker apt commands:</b>          |                                                          |
  | sudo apt update                       | a-update                                                 |
  | sudo apt upgrade                      | a-upgrade                                                |
  | sudo apt install                      | a-install                                                |
  |                                       |                                                          |
  | <b>What does your gut say:</b>        |                                                          |
  | gut                                   | echo ACCORDING TO MY GUT: && echo && git                 |
  |                                       |                                                          |
  | <b>Using Anaconda with ROS:</b>       |                                                          |
  | activate  anaconda environment        | release-the-snake                                        |
  | deactivate  anaconda environment      | cage-the-snake                                           |
  |                                       |                                                          |
  | <b>Docker Aliases:</b>                |                                                          |
  | Clean all docker containers           | clean-docker                                             |
  | Run docker container interactively    | dockerRunInteractive                                     |
  |                                       |                                                          |
  | <b>Shorten Prompt:</b>                |                                                          |
  | shorten prompt `<user>:<pwd basename>`| short-prompt                                             |
  | long prompt `<user>@host:<pwd>`       | long-prompt                                              |

## Package Specific Functionalities
  
### Git

- Update prompt when in a git repository.
- Add *branch details* to prompt.
- Prompts updated according to git status
  - **'*'** for un-staged changes
  - **'+'** for staged changes
  - **'$'** if something is stashed
  - **'%'** if there are any un-tracked files
  
### Node Package Manager (*npm*)

- Add functionality to enable auto complete features for npm cli.
- Sets npm install path to home

### Using Anaconda with ROS

- As described before, this enables usage of anaconda for ROS users without running into conflicts.
- Enable and disable *conda* environments via the aliases mentioned in the table above.
- Updates the prompt to add *conda* identifier.