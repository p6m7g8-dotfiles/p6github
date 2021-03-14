######################################################################
#<
#
# Function: str list = p6_github_api_org_repos_list([org=:org])
#
#  Args:
#	OPTIONAL org - [:org]
#
#  Returns:
#	str - list
#
#>
######################################################################
p6_github_api_org_repos_list() {
    local org="${1:-:org}"

    local list
    list=$(gh api "orgs/$org/repos" --paginate | jq -M -r "[.[] | .clone_url ]" | grep http | sed -e 's,.*/,,' -e 's,",,g' -e 's/,//' -e 's,\.git$,,' | sort)

    p6_return_str "$list"
}

######################################################################
#<
#
# Function: str list = p6_github_api_user_repos_list([user=:user])
#
#  Args:
#	OPTIONAL user - [:user]
#
#  Returns:
#	str - list
#
#>
######################################################################
p6_github_api_user_repos_list() {
    local user="${1:-:user}"

    local list
    list=$(gh api "users/$user/repos" --paginate | jq -M -r "[.[] | .clone_url ]" | grep http | sed -e 's,.*/,,' -e 's,\.git\",,' -e 's,",,g' -e 's/,//' | sort)

    p6_return_str "$list"
}

######################################################################
#<
#
# Function: str list = p6_github_api_actions_list([name=Build], [owner=:owner], [repo=:repo])
#
#  Args:
#	OPTIONAL name - [Build]
#	OPTIONAL owner - [:owner]
#	OPTIONAL repo - [:repo]
#
#  Returns:
#	str - list
#
#>
######################################################################
p6_github_api_actions_list() {
    local name="${1:-Build}"
    local owner="${2:-:owner}"
    local repo="${3:-:repo}"

    local list
    list=$(p6_github_gh_cmd api "/repos/$owner/$repo/actions/runs" | jq -M -r ".workflow_runs[] | select(.name==\"$name\").id")

    p6_return_str "$list"
}

######################################################################
#<
#
# Function: str log = p6_github_api_action_log(action_id, [owner=:owner], [repo=:repo])
#
#  Args:
#	action_id -
#	OPTIONAL owner - [:owner]
#	OPTIONAL repo - [:repo]
#
#  Returns:
#	str - log
#
#>
######################################################################
p6_github_api_action_log() {
    local action_id="$1"
    local owner="${2:-:owner}"
    local repo="${3:-:repo}"

    local log
    log=$(p6_github_gh_cmd api "/repos/$owner/$repo/actions/runs/$action_id/logs")

    p6_return_str "$log"
}
