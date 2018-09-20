# bashCustomizations
custom bashrc files and aliases

# Instruction
- Clone the repository.
  ```bash
  cd ~ && git clone git@github.com:debaraj-barua/.bashCustomizations.git
  ```
- Add the lines below to your `.bashrc` file.
  ```bash  
  # npm functionalities
  if [  -f /home/"$USER"/.bashCustomizations/package_specific_functionalities/bashrc_npm ]; then
    . /home/"$USER"/.bashCustomizations/package_specific_functionalities/bashrc_npm
  fi

  # git functionalities
  if [  -f /home/"$USER"/.bashCustomizations/package_specific_functionalities/bashrc_git ]; then
    . /home/deba"$USER"raj/.bashCustomizations/package_specific_functionalities/bashrc_git
  fi

  #generic aliases
  if [  -f  /home/"$USER"/.bashCustomizations/aliases/generic_aliases ]; then
      . /home/"$USER"/.bashCustomizations/aliases/generic_aliases
  fi
  ```