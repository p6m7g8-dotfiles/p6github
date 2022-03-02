# shellcheck shell=bash
######################################################################
#<
#
# Function: code rc = p6_github_gh_cmd(cmd, ...)
#
#  Args:
#	cmd -
#	... - 
#
#  Returns:
#	code - rc
#
#  Depends:	 p6_run
#>
######################################################################
p6_github_gh_cmd() {
  local cmd="$1"
  shift 1

  local log_type
  case $cmd in
  *) log_type=p6_run_write_cmd ;;
  esac

  p6_run_code "$log_type gh $cmd $*"
  local rc=$?

  p6_return_code_as_code "$rc"
}

######################################################################
#<
#
# Function: p6_github_gh_pr_list()
#
#>
######################################################################
p6_github_gh_pr_list() {

  p6_github_gh_cmd pr list
}

######################################################################
#<
#
# Function: p6_github_gh_pr_checkout(pr, ...)
#
#  Args:
#	pr -
#	... - 
#
#>
######################################################################
p6_github_gh_pr_checkout() {
  local pr="$1"
  shift 1

  p6_github_gh_cmd pr checkout "$pr" "$@"
}

######################################################################
#<
#
# Function: p6_github_gh_pr_view(pr, ...)
#
#  Args:
#	pr -
#	... - 
#
#>
######################################################################
p6_github_gh_pr_view() {
  local pr="$1"
  shift 1

  p6_github_gh_cmd pr view "$pr" "$@"
}

######################################################################
#<
#
# Function: p6_github_gh_pr_comment(pr, body)
#
#  Args:
#	pr -
#	body -
#
#>
######################################################################
p6_github_gh_pr_comment() {
  local pr="$1"
  local body="$2"

  p6_github_gh_cmd pr comment "$pr" --body "$body"
}

######################################################################
#<
#
# Function: p6_github_gh_pr_merge(pr, ...)
#
#  Args:
#	pr -
#	... - 
#
#>
######################################################################
p6_github_gh_pr_merge() {
  local pr="$1"
  shift 1

  p6_github_gh_cmd pr merge -d -s "$pr"
}

######################################################################
#<
#
# Function: p6_github_gh_pr_close(pr, ...)
#
#  Args:
#	pr -
#	... - 
#
#>
######################################################################
p6_github_gh_pr_close() {
  local pr="$1"
  shift 1

  p6_github_gh_cmd pr close -d "$pr"
}

######################################################################
#<
#
# Function: p6_github_gh_pr_create([user=${USER:-pgollucci])
#
#  Args:
#	OPTIONAL user - [${USER:-pgollucci]
#
#  Environment:	 USER
#>
######################################################################
p6_github_gh_pr_create() {
  local user="${1:-${USER:-pgollucci}}"

  p6_git_p6_push
  p6_github_gh_cmd pr create -a "$user" -f
}

######################################################################
#<
#
# Function: p6_github_gh_repo_clone(repo, ...)
#
#  Args:
#	repo -
#	... - 
#
#>
######################################################################
p6_github_gh_repo_clone() {
  local repo="$1"
  shift 1

  p6_github_gh_cmd repo clone "$repo" "$@"
}

######################################################################
#<
#
# Function: p6_github_gh_repo_pull()
#
#>
######################################################################
p6_github_gh_repo_pull() {

  p6_github_gh_cmd repo sync "$@"
}
