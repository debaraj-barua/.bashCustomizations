# bashCustomizations
custom bashrc files and aliases

## Instructions
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

## Random
In addition to useful bash scripts, the [random](random/README.md) directory has a list of known issues, workarounds and scripts not related to bash.