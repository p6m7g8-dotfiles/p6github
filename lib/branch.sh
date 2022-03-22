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

    local suffix
    suffix=$(p6_token_random "5")

    local prefix="p6df-"

    local kind
    kind=$(p6_echo "$msg" | cut -d : -f 1)

    local rest
    rest=$(p6_echo "$msg" | cut -d : -f 2 | sed -e 's,^ *,,' -e 's, ,_,g')
    rest=$(p6_string_replace "$rest" "[^A-Za-z0-9_#]" "")

    local branch
    branch="$kind/$rest#$prefix$suffix"

    p6_return_str "$branch"
}
