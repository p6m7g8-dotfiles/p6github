######################################################################
#<
#
# Function: str login = p6_github_api_user_login_get(user)
#
#  Args:
#	user -
#
#  Returns:
#	str - login
#
#>
######################################################################
p6_github_api_user_login_get() {
    local user="$1"

    local login
    login=$(p6_github_cli api "users/$user" --jq ".login")

    p6_return_str "$login"
}
