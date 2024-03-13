# shellcheck shell=bash

######################################################################
#<
#
# Function: p6_github_util_pr_list()
#
#>
######################################################################
p6_github_util_pr_list() {

    gh pr list

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_util_tidy()
#
#>
######################################################################
p6_github_util_tidy() {

    p6_run_code "gh tidy"

    p6_return_void
}

######################################################################
#<
#
# Function: int pr_id = p6_github_util_pr_last()
#
#  Returns:
#	int - pr_id
#
#  Environment:	 OPEN
#>
######################################################################
p6_github_util_pr_last() {

    # Prior PR
    local pr_id
    pr_id=$(gh pr list | awk '/OPEN/ {print $1}' | head -1)

    p6_return_int "$pr_id"
}

######################################################################
#<
#
# Function: p6_github_util_pr_merge_last()
#
#>
######################################################################
p6_github_util_pr_merge_last() {

    # Prior PR
    local pr_id
    pr_id=$(p6_github_util_pr_last)

    # Merge, Squash, Delete Branch
    gh pr merge -d -s "$pr_id"

    # Pull (already on main)
    p6_git_cli_pull_rebase_autostash_ff_only

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_util_submit(reviewer, user, pr_num, ..., msg)
#
#  Args:
#	reviewer -
#	user -
#	pr_num -
#	... - 
#	msg -
#
#>
######################################################################
p6_github_util_submit() {
    local reviewer="$1"
    local user="$2"
    local pr_num="$3"
    shift 3
    local msg="$*"

    local branch
    branch=$(p6_github_branch_transliterate "$pr_num" "$msg")

    p6_git_cli_status_s
    p6_git_cli_diff
    p6_git_cli_branch_create "$branch"
    p6_git_cli_add_all
    p6_git_cli_commit_verbose_with_message "$msg"
    p6_git_cli_push_u
    p6_github_util_pr_create "$reviewer" "$user"
    p6_git_util_checkout_default

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_util_pr_create(reviewer, user)
#
#  Args:
#	reviewer -
#	user -
#
#>
######################################################################
p6_github_util_pr_create() {
    local reviewer="$1"
    local user="$2"

    if ! p6_string_blank "$reviewer"; then
        gh pr create -a "$user" -f -r $reviewer
    else
        gh pr create -a "$user" -f
    fi

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_util_clone(repo, dir)
#
#  Args:
#	repo -
#	dir -
#
#>
######################################################################
p6_github_util_clone() {
    local repo="$1"
    local dir="$2"

    gh repo clone "$repo" "$dir"

    p6_return_void
}
