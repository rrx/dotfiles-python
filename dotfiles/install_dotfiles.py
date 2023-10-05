import os
import platform


def is_macos():
    return platform.system() == "Darwin"


def is_linux():
    return platform.system() == "Linux"


def is_windows():
    return platform.system() == "Windows"


def read_manifest(filename):
    with open(filename, "r") as fp:
        for line in fp.readlines():
            line = line.strip()
            if len(line) > 0 and not line.startswith("#"):
                action, source, target  = line.split("|")
                yield action, source, target


def exec_manifest(base, filename):
    filename = os.path.join(base, filename)
    for action, source, target in read_manifest(filename):
        source = os.path.abspath(os.path.join(base, source))
        assert os.path.exists(source), f"Missing source file: {source}"
        full_target = os.path.expanduser(os.path.join("~", target))
        is_link = os.path.islink(full_target)
        create_link = False
        if os.path.exists(full_target):
            if is_link:
                link_target = os.path.abspath(os.readlink(full_target))
                if source != link_target:
                    print(f"Removing mismatched symlink for {source}")
                    os.remove(full_target)
                    create_link = True
            else:
                print(f"skipping, target already exists: {full_target}")
        else:
            create_link = True

        if create_link:
            print(f"Linking {source} => {full_target}")
            os.symlink(source, full_target)


def system_dotfiles_install(base):
    print("Platform", platform.system())
    exec_manifest(base, "MANIFEST")
    if is_macos():
        exec_manifest(base, "MANIFEST.macos")
    elif is_linux():
        exec_manifest(base, "MANIFEST.linux")

