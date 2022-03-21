######################################################################
#<
#
# Function: str branch = p6_github_branch_transliterate(msg)
#
#  Args:
#	msg -
#
#  Returns:
#	str - branch
#
#>
######################################################################
p6_github_branch_transliterate() {
    local msg="$1"

    local branch
    branch=$(p6_string_replace "$msg" ":" "#")
    branch=$(p6_string_replace "$branch" " " "_")
    branch=$(p6_string_replace "$branch" "[^A-Za-z0-9_#]" "")

    p6_return_str "$branch"
}
