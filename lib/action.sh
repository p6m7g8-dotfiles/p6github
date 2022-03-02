######################################################################
#<
#
# Function: p6_github_gh_action_view(action_id)
#
#  Args:
#	action_id -
#
#  Depends:	 p6_string
#>
######################################################################
p6_github_gh_action_view() {
    local action_id="$1"

    if p6_string_blank "$action_id"; then
        action_id=$(p6_github_gh_actions_last)
    fi

    if p6_string_blank "$action_id"; then
        p6_return_void
    else
        p6_github_gh_action_view_do "$action_id"
    fi
}

######################################################################
#<
#
# Function: p6_github_gh_action_view_do(action_id)
#
#  Args:
#	action_id -
#
#  Depends:	 p6_color p6_dir p6_file p6_msg p6_run p6_transient
#>
######################################################################
p6_github_gh_action_view_do() {
    local action_id="$1"

    p6_run_retry \
        p6_github_gh_action_status_stop_when_completed \
        "fail" \
        p6_github_gh_action_status \
        "$action_id"

    local dir
    dir=$(p6_transient_create "p6_ghav")
    local zip
    zip="$dir/logs.zip"

    p6_github_api_action_log "$action_id" >"$zip"

    (
        p6_dir_cd "$dir"
        unzip "$zip"
        p6_file_rmf "$zip"

        local file
        for file in **/*; do
            p6_color_say "blue" "white" "----------------------------------------------"
            p6_color_say "blue" "white" "$file"
            p6_color_say "blue" "white" "----------------------------------------------"
            p6_file_display "$file"
            p6_msg
        done
    )

    p6_transient_delete "$dir"
}

######################################################################
#<
#
# Function: str json = p6_github_gh_action_status_json(action_id)
#
#  Args:
#	action_id -
#
#  Returns:
#	str - json
#
#>
######################################################################
p6_github_gh_action_status_json() {
    local action_id="$1"

    local json
    json=$(p6_github_gh_cmd api /repos/:owner/:repo/actions/runs/"$action_id" |
        jq -M -r "{name: .name, event: .event, status: .status, conclusion: .conclusion}")

    p6_return_str "$json"
}

######################################################################
#<
#
# Function: str _status = p6_github_gh_action_status(action_id)
#
#  Args:
#	action_id -
#
#  Returns:
#	str - _status
#
#>
######################################################################
p6_github_gh_action_status() {
    local action_id="$1"

    local _status
    _status=$(p6_github_gh_action_status_json "$action_id" | jq -M -r ".status")

    p6_return_str "$_status"
}

######################################################################
#<
#
# Function: bool rc = p6_github_gh_action_status_stop_when_completed(_status)
#
#  Args:
#	_status - the current status
#
#  Returns:
#	bool - rc: to continue or not
#
#  Depends:	 p6_run p6_string
#>
######################################################################
p6_github_gh_action_status_stop_when_completed() {
    local _status="$1" # the current status

    local rc
    if p6_string_eq "$_status" "completed"; then
        rc=$?
        p6_run__debug "status=[$_status] -> break"
    else
        rc=$?
        p6_run__debug "status=[$_status] -> continue"
    fi

    p6_return_bool "$rc" # to continue or not
}
