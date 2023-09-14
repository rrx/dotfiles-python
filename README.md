Using a python script to install common programs across Linux and MacOS.

Do common environment configuration.

To install:
```
python3 -m pip install -e .
```

To run:

```
# install everything
python3 -m dotfiles install | bash
```

To setup your environment, add the following to your .zshrc:

```
eval "$(python3 -m dotfiles init)"
```

To install dotfiles using symbolic links:

```
python3 -m dotfiles install_dotfiles
```
