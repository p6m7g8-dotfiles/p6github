# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_github_cli_org_list(...)
#
#  Args:
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_org_list() {
    shift 0

    p6_github_cli org list "$@" | p6_filter_column_pluck 1 | p6_filter_sort

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_org_teams_list(org)
#
#  Args:
#	org -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_org_teams_list() {
    local org="$1"

    p6_github_cli team list -o "$org" --json name -q '.[].name'

    p6_return_stream
}
