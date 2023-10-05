import importlib.util
import sys


PACKAGES = ["pynvim", "python-lsp-server"]


def install_python_default_packages():
    install_python_packages(PACKAGES)


def install_python_packages(packages):
    for name in packages:
        if name in sys.modules:
            continue
        elif (_ := importlib.util.find_spec(name)) is not None:
            continue
        else:
            args = [sys.executable, "-m", "pip", "install", name]
            print(" ".join(args))
