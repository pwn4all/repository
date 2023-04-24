#################################################################################
## When it run the command 'pip install --upgrade pip'
#################################################################################
# pip install --upgrade pip
Collecting pip
  Using cached https://files.pythonhosted.org/packages/43/7d/1f52f99a7f2eae870483b2c2a3064511487de87911bce146df8a154fbe81/pip-23.1.1.tar.gz
    Complete output from command python setup.py egg_info:
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
      File "/tmp/pip-build-nIFI1m/pip/setup.py", line 7
        def read(rel_path: str) -> str:
                         ^
    SyntaxError: invalid syntax

    ----------------------------------------
Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-build-nIFI1m/pip/
You are using pip version 8.1.2, however version 23.1.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
#


#################################################################################
## just select specific pip version because it doesn't support upgrading to the latest version.
#################################################################################
# pip install --upgrade pip==20.0.0
Collecting pip==20.0.0
  Downloading https://files.pythonhosted.org/packages/60/65/16487a7c4e0f95bb3fc89c2e377be331fd496b7a9b08fd3077de7f3ae2cf/pip-20.0-py2.py3-none-any.whl (1.5MB)
    100% |################################| 1.5MB 943kB/s
Installing collected packages: pip
  Found existing installation: pip 8.1.2
    Uninstalling pip-8.1.2:
      Successfully uninstalled pip-8.1.2
Successfully installed pip-20.0
You are using pip version 20.0, however version 23.1.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
#
