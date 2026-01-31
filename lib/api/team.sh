######################################################################
#<
#
# Function: stream  = p6_github_api_org_teams_list(org, org)
#
#  Args:
#	org -
#	org -
#
#  Returns:
#	stream - 
#	stream - 
#
#>
######################################################################
p6_github_api_org_teams_list() {
    local org="$1"

    p6_github_cli api "orgs/$org/teams" --paginate --jq '.[].name'

    p6_return_stream
}
