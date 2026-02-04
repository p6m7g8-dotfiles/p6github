######################################################################
#<
#
# Function: stream  = p6_github_api_org_teams_list(org)
#
#  Args:
#	org -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_api_org_teams_list() {
    local org="$1"

    p6_github_cli api "orgs/$org/teams" --paginate --jq '.[].name'

    p6_return_stream
}
