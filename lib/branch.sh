######################################################################
#<
#
# Function: str branch = p6_github_branch_transliterate(pr_num, msg)
#
#  Args:
#	pr_num -
#	msg -
#
#  Returns:
#	str - branch
#
#  Environment:	 P6_DFZ_GH_BRANCH_STYLE USER
#>
######################################################################
p6_github_branch_transliterate() {
    local pr_num="$1"
    local msg="$2"

    local suffix
    suffix=$(p6_token_random "5")

    local prefix="p6df-"

    local kind
    kind=$(p6_echo "$msg" | cut -d : -f 1 | sed -e 's,(,/,g' -e 's,),/,g' -e 's,/$,,' -e 's,\/\!,!,')

    local rest
    rest=$(p6_echo "$msg" | cut -d : -f 2- | sed -e 's,^ *,,' -e 's, ,_,g')
    rest=$(p6_string_replace "$rest" "[^A-Za-z0-9_#]" "")

    local branch
    local user=$USER

    case "$P6_DFZ_GH_BRANCH_STYLE" in
    p6)
        if ! p6_string_blank "$pr_num"; then
            branch="$user/$kind/$pr_num/$rest#$prefix$suffix"
        else
            branch="$user/$kind/$rest#$prefix$suffix"
        fi
        ;;
    *) branch="$user-$pr_num-$rest" ;;
    esac

    p6_return_str "$branch"
}
