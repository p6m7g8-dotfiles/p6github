# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_github_cli_ruleset_branch_activate([ruleset_name=default])
#
#  Args:
#	OPTIONAL ruleset_name - [default]
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_ruleset_branch_activate() {
    local ruleset_name="${1:-default}"

    p6_github_cli ruleset-branch activate "$ruleset_name"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_ruleset_branch_deactivate([ruleset_name=default])
#
#  Args:
#	OPTIONAL ruleset_name - [default]
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_ruleset_branch_deactivate() {
    local ruleset_name="${1:-default}"

    p6_github_cli ruleset-branch deactivate "$ruleset_name"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_ruleset_branch_create([ruleset_name=default])
#
#  Args:
#	OPTIONAL ruleset_name - [default]
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_ruleset_branch_create() {
    local ruleset_name="${1:-default}"

    p6_github_cli ruleset-branch create "$ruleset_name"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_ruleset_branch_delete([ruleset_name=default])
#
#  Args:
#	OPTIONAL ruleset_name - [default]
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_ruleset_branch_delete() {
    local ruleset_name="${1:-default}"

    p6_github_cli ruleset-branch delete "$ruleset_name"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_ruleset_branch_update(...)
#
#  Args:
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_ruleset_branch_update() {
    shift 0

    p6_github_cli ruleset-branch update "$@"

    p6_return_stream
}
