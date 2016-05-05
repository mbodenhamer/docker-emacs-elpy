#!/usr/bin/env bats
load test_helpers

@test "[$TEST_FILE] Test emacs-elpy install" {
    run make install
    [ -x /usr/local/bin/emacs-elpy ]
}

@test "[$TEST_FILE] Test emacs-elpy uninstall" {
    run make uninstall
    [ ! -x /usr/local/bin/emacs-elpy ]
}

