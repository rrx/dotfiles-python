Using a python script to install common programs across Linux and MacOS.

Do common environment configuration.

To install:
```

# install module
python3 -m pip install -e .

Install dotfiles using symbolic links:
python3 -m dotfiles install_dotfiles

# install everything else
python3 -m dotfiles install | bash
```

To setup your environment, add the following to your .zshrc:

```
eval "$(python3 -m dotfiles init)"
```

