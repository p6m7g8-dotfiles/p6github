######################################################################
#<
#
# Function: p6_github_oauth_token_get(gh_api, user, pass, note)
#
#  Args:
#	gh_api -
#	user -
#	pass -
#	note -
#
#>
######################################################################
p6_github_oauth_token_get() {
  local gh_api="$1"
  local user="$2"
  local pass="$3"
  local note="$4"

  local output=$(curl -X POST -s -u ${user}:${pass} -d '{"scopes": ["repo", "user"], "note": "'${note}'"}' ${gh_api}/v3/authorizations | egrep '"token"|"id"')

  local id=$(echo $output | awk '{ print $2 }' | sed -e 's/[", ]//g')
  local token=$(echo $output | awk '{ print $4 }' | sed -e 's/[", ]//g')

  GH_TOKEN=$token
  GH_TOKEN_ID=$id
}

######################################################################
#<
#
# Function: p6_github_oauth_token_del(gh_api, user, pass, id)
#
#  Args:
#	gh_api -
#	user -
#	pass -
#	id -
#
#>
######################################################################
p6_github_oauth_token_del() {
  local gh_api="$1"
  local user="$2"
  local pass="$3"
  local id="$4"

  curl -X DELETE -s -u ${user}:${pass} ${gh_api}/v3/authorizations/$id
}

######################################################################
#<
#
# Function: p6_github_oauth_token_clear()
#
#>
######################################################################
p6_github_oauth_token_clear() {

  unset GH_TOKEN
  unset GH_TOKEN_ID
}
