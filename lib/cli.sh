# shellcheck shell=bash

######################################################################
#<
#
# Function: p6_github_cli_pr_checkout(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_github_cli_pr_checkout() {
    shift 0

    gh pr checkout "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_pr_list(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6_github_cli_pr_list() {
    shift 0

    gh pr list "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_pr_view(pr, ...)
#
#  Args:
#	pr -
#	... -
#
#>
######################################################################
p6_github_cli_pr_view() {
    local pr="$1"
    shift 1

    gh pr view "$pr" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_pr_view_web(pr)
#
#  Args:
#	pr -
#
#>
######################################################################
p6_github_cli_pr_view_web() {
    local pr="$1"

    p6_github_cli_pr_view "$pr" -w

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_pr_merge_squash_delete(pr)
#
#  Args:
#	pr -
#
#>
######################################################################
p6_github_cli_pr_merge_squash_delete() {
    local pr="$1"

    gh pr merge -d -s "$pr"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_cli_clone(repo, dir)
#
#  Args:
#	repo -
#	dir -
#
#>
######################################################################
p6_github_cli_clone() {
    local repo="$1"
    local dir="$2"

    gh repo clone "$repo" "$dir"

    p6_return_void
}
