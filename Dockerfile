FROM mbodenhamer/emacs:latest
MAINTAINER Matt Bodenhamer <mbodenhamer@mbodenhamer.com>

# Install pip
RUN apt-get update && apt-get install -y \
    python-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install -U pip \
    && rm -rf .cache/pip

# Install Elpy dependencies
RUN pip install --no-cache \
    autopep8 \
    flake8 \
    importmagic \
    rope \
    yapf

# Install Elpy
COPY install.el .emacs /root/
RUN emacs --batch -l /root/install.el \
    && rm /root/install.el

ONBUILD ARG uid=1000
ONBUILD ARG gid=1000
ONBUILD RUN groupadd -g $gid user \
	&& useradd -u $uid -g $gid -d /home/user -m -s /bin/bash user \
	&& cp /root/.emacs /home/user \
	&& cp -r /root/.emacs.d /home/user \
	&& chown -R $uid:$gid /home/user
ONBUILD USER user


