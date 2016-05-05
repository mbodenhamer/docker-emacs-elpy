#!/usr/bin/env bats
load test_helpers

@test "[$TEST_FILE] Check if Elpy is installed" {
    run launch --batch test1.py -u root -f elpy-version
    [[ ${lines[2]} =~ "Elpy 1." ]]
}

@test "[$TEST_FILE] Check if Elpy is installed for user" {
    run launch --batch test1.py -l /home/user/.emacs -f elpy-version
    [[ ${lines[2]} =~ "[yas]" ]]
    [[ ${lines[15]} =~ "Elpy 1." ]]
}
