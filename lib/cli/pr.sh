# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_github_cli_pr_checkout(...)
#
#  Args:
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_pr_checkout() {
    shift 0

    p6_github_cli pr checkout "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_pr_list(...)
#
#  Args:
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_pr_list() {
    shift 0

    p6_github_cli pr list "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_pr_view(pr, ...)
#
#  Args:
#	pr -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_pr_view() {
    local pr="$1"
    shift 1

    p6_github_cli pr view "$pr" "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_pr_view_web(pr, ...)
#
#  Args:
#	pr -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_pr_view_web() {
    local pr="$1"
    shift 1

    p6_github_cli_pr_view "$pr" -w "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_pr_create(...)
#
#  Args:
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_pr_create() {
    shift 0

    p6_github_cli pr create "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_pr_merge_squash_delete(pr, ...)
#
#  Args:
#	pr -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_pr_merge_squash_delete() {
    local pr="$1"
    shift 1

    p6_github_cli pr merge -d -s "$pr" "$@"

    p6_return_stream
}
