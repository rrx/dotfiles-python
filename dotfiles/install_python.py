import importlib.util
import pip
import sys
import subprocess


PACKAGES = ["pynvim"]

def install_python_packages():
    for name in PACKAGES:
        if name in sys.modules:
            continue
        elif (spec := importlib.util.find_spec(name)) is not None:
            # print('asdf', spec)
            continue
        else:
            args = [sys.executable, "-m", "pip", "install", name]
            # subprocess.check_call(args)
            print(" ".join(args))
