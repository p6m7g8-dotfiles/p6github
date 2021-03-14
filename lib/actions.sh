######################################################################
#<
#
# Function: str action_id = p6_github_gh_actions_last()
#
#  Returns:
#	str - action_id
#
#>
######################################################################
p6_github_gh_actions_last() {

    local action_id
    action_id=$(p6_github_api_actions_list | head -1)

    p6_return_str "$action_id"
}
