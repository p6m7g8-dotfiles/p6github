# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_github_cli_workflow_run(workflow, ...)
#
#  Args:
#	workflow -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_workflow_run() {
    local workflow="$1"
    shift 1

    p6_github_cli workflow run "$workflow" "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_workflow_upgrade_main_run()
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_workflow_upgrade_main_run() {

    p6_github_cli_workflow_run upgrade-main

    p6_return_stream
}
