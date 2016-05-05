#!/usr/bin/env bats
load test_helpers

@test "[$TEST_FILE] Test emacs-elpy install/uninstall" {
    run make install
    [ -x /usr/local/bin/emacs-elpy ]
    
    run make uninstall
    [ ! -x /usr/local/bin/emacs-elpy ]
}

@test "[$TEST_FILE] Test emacs-elpy batch operations" {
    run make install
    [ ! -f /tmp/foofile ]
    cwd=$(pwd)
    cd /tmp
    run emacs-elpy --uid 1002 --gid 1001 --batch \
	--eval='(with-temp-buffer (write-file "/files/foofile"))'
    cd $cwd
    [ -f /tmp/foofile ]
    [ $(stat -c %u /tmp/foofile) == 1002 ]
    [ $(stat -c %g /tmp/foofile) == 1001 ]
    run rm /tmp/foofile
    [ ! -f /tmp/foofile ]
}
