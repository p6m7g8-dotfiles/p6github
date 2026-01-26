# shellcheck shell=bash

######################################################################
#<
#
# Function: int pr_id = p6_github_api_pr_last()
#
#  Returns:
#	int - pr_id
#
#>
######################################################################
p6_github_api_pr_last() {

    # Prior PR
    local pr_id
    pr_id=$(p6_github_cli_pr_list | p6_filter_row_select "OPEN" | p6_filter_column_pluck 1 | p6_filter_row_first 1)

    p6_return_int "$pr_id"
}

######################################################################
#<
#
# Function: int pr_id = p6_github_api_pr_oldest()
#
#  Returns:
#	int - pr_id
#
#>
######################################################################
p6_github_api_pr_oldest() {

    # Oldest PR
    local pr_id
    pr_id=$(p6_github_cli_pr_list | p6_filter_row_select "OPEN" | p6_filter_column_pluck 1 | p6_filter_row_last 1)

    p6_return_int "$pr_id"
}

######################################################################
#<
#
# Function: p6_github_api_pr_merge_last()
#
#>
######################################################################
p6_github_api_pr_merge_last() {

    # Prior PR
    local pr_id
    pr_id=$(p6_github_api_pr_last)

    # Merge, Squash, Delete Branch
    p6_github_cli_pr_merge_squash_delete "$pr_id"

    # Pull (already on main)
    p6_git_cli_pull_rebase_autostash_ff_only

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_pr_merge_oldest()
#
#>
######################################################################
p6_github_api_pr_merge_oldest() {

    # Prior PR
    local pr_id
    pr_id=$(p6_github_api_pr_oldest)

    # Merge, Squash, Delete Branch
    p6_github_cli_pr_merge_squash_delete "$pr_id"

    # Pull (already on main)
    p6_git_cli_pull_rebase_autostash_ff_only

    p6_return_void
}

######################################################################
#<
#
# Function: str state = p6_github_api_pr_state_get(pr_id)
#
#  Args:
#	pr_id -
#
#  Returns:
#	str - state
#
#>
######################################################################
p6_github_api_pr_state_get() {
    local pr_id="$1"

    local state
    state=$(p6_github_cli_pr_view "$pr_id" --json state -q .state)

    p6_return_str "$state"
}

######################################################################
#<
#
# Function: p6_github_api_pr_poll_while_open([pr_id=], [delay=1])
#
#  Args:
#	OPTIONAL pr_id - []
#	OPTIONAL delay - [1]
#
#>
######################################################################
p6_github_api_pr_poll_while_open() {
    local pr_id="${1:-}"
    local delay="${2:-1}"

    if p6_string_blank "$pr_id"; then
        pr_id=$(p6_github_api_pr_oldest)
    fi

    while :; do
        local state
        state=$(p6_github_cli_pr_view "$pr_id" --json state -q .state 2>/dev/null)
        local rc=$?

        if p6_string_ne_0 "$rc"; then
            p6_retry__debug "pr_poll_while_open(): pr=$pr_id view_failed rc=$rc sleep=$delay"
            delay=$(p6_retry_delay_doubling "$delay")
            continue
        fi

        if p6_string_ne "$state" "OPEN"; then
            break
        fi

        p6_retry__debug "pr_poll_while_open(): pr=$pr_id state=$state sleep=$delay"
        delay=$(p6_retry_delay_doubling "$delay")
    done

    p6_return_void
}


######################################################################
#<
#
# Function: p6_github_api_pr_submit(editor, user, tmpl, [reviewer=], [cli_msg=], [pr_num=])
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
p6_github_api_pr_submit() {
    local editor="$1"
    local user="$2"
    local tmpl="$3"
    local reviewer="${4:-}"
    local cli_msg="${5:-}"
    local pr_num="${6:-}"

    # p6_transient: scratch_file
    p6_git_util_msg_collect "$editor" "$cli_msg" # XXX: can not use $() b/c of $editor Output socket/pipe
    # shellcheck disable=2154
    local file_msg=$scratch_file
    # unset $scratch_file

    local first_line=$(p6_file_line_first "$file_msg")
    local branch=$(p6_git_branch_process "$tmpl" "$user" "$first_line" "$pr_num")
    local all=$(p6_file_display "$file_msg")
    p6_transient_delete "$file_msg"

    p6_git_cli_branch_create "$branch"
    p6_git_cli_add_all
    p6_git_cli_commit_with_message "$all"
    p6_git_cli_push_u
    p6_github_api_pr_create "$user" "$reviewer"

    p6_git_util_checkout_default

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_pr_create(user, reviewer)
#
#  Args:
#	user -
#	reviewer -
#
#>
######################################################################
p6_github_api_pr_create() {
    local user="$1"
    local reviewer="$2"

    if ! p6_string_blank "$reviewer"; then
        p6_github_cli_pr_create -a "$user" -f -r "$reviewer"
    else
        p6_github_cli_pr_create -a "$user" -f
    fi

    p6_return_void
}
