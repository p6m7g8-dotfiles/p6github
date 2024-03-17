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

    gh tidy

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
    pr_id=$(p6_github_util_pr_list | awk '/OPEN/ {print $1}' | head -1)

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
# Function: p6_github_util_pr_submit(editor, user, tmpl, [reviewer=], [cli_msg=], [pr_num=])
#
#  Args:
#	editor -
#	user -
#	tmpl -
#	OPTIONAL reviewer - []
#	OPTIONAL cli_msg - []
#	OPTIONAL pr_num - []
#
#>
######################################################################
p6_github_util_pr_submit() {
    local editor="$1"
    local user="$2"
    local tmpl="$3"
    local reviewer="${4:-}"
    local cli_msg="${5:-}"
    local pr_num="${6:-}"

    # p6_transient
    local file_msg=$(p6_git_util_msg_collect "$ditor" "$cli_msg")
    local first_line=$(p6_file_line_first "$file_msg")
    local branch=$(p6_git_branch_process "$tmpl" "$user" "$first_line" "$pr_num")
    local body=$(p6_file_lines_except_first "$file_msg")
    p6_transient_delete "$file_msg"

    p6_git_cli_branch_create "$branch"
    p6_git_cli_add_all
    p6_git_cli_commit_with_message "$body"
    p6_git_cli_push_u
    p6_github_util_pr_create "$user" "$reviewer"

    p6_git_util_checkout_default

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_util_pr_create(user, reviewer)
#
#  Args:
#	user -
#	reviewer -
#
#>
######################################################################
p6_github_util_pr_create() {
    local user="$1"
    local reviewer="$2"

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
