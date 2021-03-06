load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

@test "shubcommand not-a-command" {
    run bin/shubcommand not-a-command
    assert_failure 127
    assert_output <<____
shubcommand: not-a-command: Not a subcommand.
Type just 'shubcommand' for help.
____
}

@test "shubcommand unit-test" {
    run bin/shubcommand shbcmd-unit-test "p 1" p2
    assert_success
    assert_output <<____
COMMAND_BASE_DIR=XXX
COMMAND_BASE_CMD=shubcommand
COMMAND_BASE_SUB=shbcmd-unit-test
0: shubcommand-shbcmd-unit-test
1: p 1
2: p2
____
}

@test "shubcommand no-arg (help)" {
    run bin/shubcommand
    assert_failure 1
    assert_output <<____
Usage: shubcommand <command> [<args>]

Commands:
  XXX need to print out commands here
____
}

# XXX Need to test that this stuff works in dirs with,
#     e.g., spaces in the names, or even spaces in the command name.
