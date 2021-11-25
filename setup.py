#!/usr/bin/env python

VERSION="0.0.1"

import setuptools

setuptools.setup(name='dotfiles',
      version=VERSION,
          description='Replace dotfiles with something dynamic',
          url='https://github.com/rrx/dotfiles',
          packages=setuptools.find_packages(),
          include_package_data=True,
          install_requires=[
              ],
          python_requires='>=3.5'
         )
