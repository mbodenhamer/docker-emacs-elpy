[![](https://travis-ci.org/mbodenhamer/docker-emacs-elpy.svg?branch=master)](https://travis-ci.org/mbodenhamer/docker-emacs-elpy)

Dockerized Emacs with [Elpy](https://github.com/jorgenschaefer/elpy).

## Usage

The image is intended to be generally used with the accompanying `emacs-elpy` shell script.  To install:

    $ git clone https://github.com/mbodenhamer/docker-emacs-elpy.git
	$ cd docker-emacs-elpy
    $ sudo make install
    
The application can then be invoked like so:

    $ emacs-elpy [emacs options] some_file.py
    
This will build an image that launches emacs with the UID and GID of the current user (if the command has been previously invoked as the current user, a new image will not be built) and gives the container access to the file tree starting at the current working directory.

If you wish to invoke emacs as root, you can supply the `--root` option:

    $ emacs-elpy --root [emacs options] some_file.py

Information on creating a container directly using `docker run` can be found in the [mbodenhamer/emacs](https://github.com/mbodenhamer/docker-emacs) documentation.
