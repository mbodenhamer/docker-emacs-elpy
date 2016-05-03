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
COPY install.el /root/
RUN emacs --batch -l /root/install.el \
    && rm /root/install.el

COPY .emacs /root/.emacs
