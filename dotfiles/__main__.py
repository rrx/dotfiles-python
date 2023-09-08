import csv
import os
import shutil
import sys
import platform
import pwd
import grp
import subprocess
import glob


CUSTOM = {
    'lazygit': lambda program_name, sys, _, arg: lazygit(arg),
    'terraform': lambda program_name, sys, _, version: terraform(version),
    'helix': lambda program_name, sys, _, version: helix(program_name, version),
    }


def get_user_groups(user):
    groups = [g.gr_name for g in grp.getgrall() if user in g.gr_mem]
    gid = pwd.getpwnam(user).pw_gid
    groups.append(grp.getgrgid(gid).gr_name)
    return groups


def get_project_path(*args):
    directory = os.path.abspath(os.path.dirname(__file__))
    parts = [directory]
    parts.extend(args)
    return os.path.join(*parts)


def get_dotfiles_config_paths(*args):
    sys = platform.system().lower()
    directory = os.path.abspath(os.path.dirname(__file__))
    for sys in ['common', sys]:
        parts = [directory, 'config', sys]
        base_path = os.path.join(*parts)
        parts.extend(args)
        path = os.path.join(*parts)
        if os.path.exists(base_path):
            yield path


def get_path_directories():
    for p in os.environ.get("PATH").split(":"):
        path = os.path.expanduser(p)
        yield path


def info():
    print(platform.machine(), platform.system())


def docker():
    user = os.environ['USER']
    groups = get_user_groups(user)
    if 'docker' not in groups:
        print("sudo usermod -aG docker %s" % user)


def helix(program_name, version):
    target = os.path.expanduser("~/bin/hx")
    if os.path.exists(target):
        return

    data = {
        'version': version,
        'arch': platform.machine(),
        'sys': platform.system().lower()
        }

    if data['sys'] == 'darwin':
        data['sys'] = 'macos'
    url = "https://github.com/helix-editor/helix/releases/download/v%(version)s/helix-v%(version)s-%(arch)s-%(sys)s.tar.xz" % data
    print("curl -o /tmp/%s.tar.xz -LO %s" % (program_name,url))
    path = "/tmp/helix-v%(version)s-%(arch)s-%(sys)s" % data
    print("tar -C /tmp -xvf /tmp/%s.tar.xz" % program_name)
    print("mv %s/hx %s" % (path, target))
    print("mkdir -p ~/.config/helix")
    print("cp -r %s/runtime ~/.config/helix/runtime" % (path))


def install_zsh():
    shell = pwd.getpwnam(os.environ['USER']).pw_shell
    if shell != shutil.which('zsh'):
        print("sudo chsh -s $(which zsh) %s" % os.environ['USER'])


def install_sdkman(program_name, version):
    yield 'source "~/.sdkman/bin/sdkman-init.sh"'
    yield "sdk install %s %s" % (program_name, version)


def pip(pips):
    reqs = subprocess.check_output([sys.executable, '-m', 'pip', 'freeze']).decode('utf-8').split("\n")
    packages = set()
    install = set()

    for p in pips:
        has_package = False
        for line in reqs:
            if line.lower().startswith(p):
                has_package = True
                break
        if not has_package:
            install.add(p)

    for x in install:
        print("python3 -m pip install --user %s" % x)



def terraform(version):
    target = os.path.expanduser("~/bin/terraform-%s" % version)
    if os.path.exists(target):
        return

    arch_map = {
            'x86_64': 'amd64',
            'arm64': 'arm64'
    }
    data = {
        'version': version,
        'arch': arch_map[platform.machine()],
        'sys': platform.system().lower()
        }
    url = "https://releases.hashicorp.com/terraform/%(version)s/terraform_%(version)s_%(sys)s_%(arch)s.zip" % data
    print("curl -o /tmp/terraform.zip -LO %s" % url)
    print("unzip -d /tmp /tmp/terraform.zip")
    print("mv /tmp/terraform %s" % target)


def lazygit(version):
    target = os.path.expanduser('~/bin/lazygit')
    if os.path.exists(target):
        return

    data = {
        'version': version,
        'arch': platform.machine(),
        'sys': platform.system()
        }
    url = "https://github.com/jesseduffield/lazygit/releases/download/v%(version)s/lazygit_%(version)s_%(sys)s_%(arch)s.tar.gz" % data
    print("curl -o /tmp/lazygit.tgz -LO %s" % url)
    print("tar -C /tmp -zxvf /tmp/lazygit.tgz")
    print("mv /tmp/lazygit %s" % target)


def shell_init():
    directory = get_project_path()
    print("export DOTFILES_DIR=%s" % directory)
    # print("export EDITOR=hx")
    print("export EDITOR=nvim")

    add = []
    paths = set(get_path_directories())
    for p in ['~/bin', '~/.local/bin']:
        path = os.path.expanduser(p)
        if path not in paths and path not in add:
            add.append(path)

    if add:
        print("export PATH=%s:$PATH" % ":".join(add))

    for wildcard_path in get_dotfiles_config_paths('zsh.sh'):
        for path in glob.glob(wildcard_path):
            if os.path.exists(path):
                with open(path, 'r', encoding='utf-8') as fp:
                    print(fp.read())


def install_keys(filename):
    current_keys = set()
    path = os.path.expanduser('~/.ssh/authorized_keys')
    if os.path.exists(path):
        with open(path, 'r', encoding='utf-8') as fp:
            for line in fp.readlines():
                current_keys.add(" ".join(line.strip().split()[:2]))

    with open(os.path.expanduser(filename), 'r', encoding='utf-8') as fp:
        for line in fp.readlines():
            line = " ".join(line.strip().split()[:2])
            if line not in current_keys:
                print("""umask 0077 ; echo "%s" >> ~/.ssh/authorized_keys""" % line)


def install_fonts(filename):
    with open(filename, 'r', encoding='utf-8') as fp:
        reader = csv.reader(fp)
        print("mkdir -p ~/.local/share/fonts/")
        for row in reader:
            url = row[0]
            if len(url) == 0 or url.startswith("#"):
                continue

            print("wget -nc -P ~/.local/share/fonts/", url)

        system = platform.system().lower()
        if system == 'linux':
            # for linux only
            print("fc-cache -f -v")


def packages(config_filename):
    apts = set()
    pips = set()
    brews = set()

    lines = []

    user_binary_dir = os.path.expanduser('~/bin')

    machine = platform.machine()
    system = platform.system().lower()

    if not os.path.isdir(os.path.expanduser('~/.ssh')):
        print("ssh-keygen -f ~/.ssh/id_rsa -N ''")

    key_filename = get_project_path('public_keys')
    install_keys(key_filename)

    install_zsh()

    with open(config_filename, 'r', encoding='utf-8') as fp:
        reader = csv.reader(fp)

        for row in reader:
            if len(row) == 0:
                continue
            if len(row[0]) == 0 or row[0].startswith("#"):
                continue
            assert(len(row) == 4)

            program_name, sys, install_method, arg = row
            # skip if it's not for this system
            if sys != '' and sys != system:
                continue

            if install_method == 'dir':
                path = os.path.expanduser(arg)
                if not os.path.isdir(path):
                    lines.append("mkdir -p %s" % path)

            elif install_method == 'apt' and system == 'linux':
                path = shutil.which(program_name)
                if not path:
                    apts.add(arg)

            elif install_method == 'appimage' and system == 'linux':
                binary_local_path = os.path.join(user_binary_dir, program_name)
                if not os.path.exists(binary_local_path):
                    lines.extend([
                        "curl -o %s -LO %s" % (binary_local_path, arg),
                        "chmod u+x %s" % binary_local_path
                        ])

            elif install_method == 'cargo':
                path = shutil.which(program_name)
                if not path:
                    lines.append("cargo install %s" % arg)

            elif install_method == 'cmd':
                path1 = shutil.which(program_name)
                path2 = os.path.expanduser(program_name)
                if not path1 and not os.path.exists(path2):
                    lines.append(arg)

            elif install_method == 'brew':
                path = shutil.which(program_name)
                if not path:
                    brews.add(arg)

            elif install_method == 'sdkman':
                path = shutil.which(program_name)
                if not path:
                    lines.extend(install_sdkman(program_name, arg))

            elif install_method == 'pip':
                pips.add(program_name)

            elif install_method == 'custom' and program_name in CUSTOM:
                CUSTOM[program_name](program_name, system, install_method, arg)

    if apts:
        print("sudo apt install -y %s" % " ".join(apts))

    if pips:
        pip(pips)

    if brews:
        print("brew install %s" % " ".join(brews))

    for line in lines:
        print(line)

if __name__ == '__main__':
    cmd = sys.argv[1]
    if cmd == 'install':
        packages(get_project_path('config', 'common', 'install.conf'))
        install_fonts(get_project_path('config', 'common', 'fonts.conf'))
    elif cmd == 'init':
        shell_init()
    elif cmd == 'info':
        info()
