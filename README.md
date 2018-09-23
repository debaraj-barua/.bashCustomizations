<h1>bashCustomizations</h1>
custom bashrc files and aliases

<h1>Table Of Content</h1>

- [Getting started and installation](#getting-started-and-installation)
  - [[Note] Using conda with ROS functionality](#note-using-conda-with-ros-functionality)
  - [[Note] Random](#note-random)
- [How to use?](#how-to-use)
  - [Aliases Defined](#aliases-defined)

# Getting started and installation
- Clone the repository.
  ```bash
  cd ~ && git clone git@github.com:debaraj-barua/.bashCustomizations.git
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
  fi
  # ---------------------------------------------------------------------------------------

  ```

  ## [Note] Using conda with ROS functionality
  This has beent taken from [StefanFabian's gist](https://gist.github.com/StefanFabian/17fa715e783cd2be6a32cd5bbb98acd9#file-anaconda_with_ros_wrapper-bash)

  1. Remove the line that adds the anaconda bin folder to your PATH in the ~/.bashrc file (if you've let anaconda add itself to the PATH during installation)
  1. Change `_ROS_CONDA_PATH` in [conda_with_ros file](package_specific_functionalities/conda_with_ros.bash) _line 23_ to the path of your Anaconda bin folder (if you didn't install it to `~/anaconda3`)
  1. Add the scripts mentioned above **_before any_** ros setup bash files are sourced
`source ~/.anaconda_with_ros_wrapper.bash`

  ## [Note] Random
  In addition to useful bash scripts, the [random](random/README.md) directory has a list of known issues, workarounds and scripts not related to bash.

# How to use?

  ## Aliases Defined
  | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Command  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; Alias &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|
  |--------------------------------------|------------------|
  | <b>Get rid of command not found:</b> |                  |
  | cd..                                 | cd ..            |
  |                                      |                  |
  | <b>Quicker change directory:</b>     |                  |
  | cd ..                                | ..               |
  | cd ../..                             | ...              |
  | cd ../../..                          | ....             |
  | cd ../../../..                       | .....            |
  |                                      |                  |
  | <b>Resume wget by default:</b>       |                  |
  | wget -c                              | wget             |
  |                                      |                  |
  | <b>Restart network-manager:</b>      |                  |
  | sudo service network-manager restart | net-restart      |
  |                                      |                  |
  | <b>Quicker apt commands:</b>         |                  |
  | sudo apt update                      | update           |
  | sudo apt upgrade                     | upgrade          |
  | sudo apt install                     | a-install        |
  |                                      |                  |
  | <b>Using Anaconda with ROS:</b>      |                  |
  | activate  anaconda environment       | release-the-snake| 
  | deactivate  anaconda environment     | cage-the-snake   | 