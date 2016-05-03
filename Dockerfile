FROM mbodenhamer/emacs-elpy:latest
MAINTAINER Matt Bodenhamer <mbodenhamer@mbodenhamer.com>

ONBUILD ARG uid=1000
ONBUILD ARG gid=1000
ONBUILD RUN groupadd -g $gid user \
	&& useradd -u $uid -g $gid -d /home/user -m -s /bin/bash user \
	&& cp /root/.emacs /home/user \
	&& cp -r /root/.emacs.d /home/user \
	&& chown -R $uid:$gid /home/user
ONBUILD USER user


