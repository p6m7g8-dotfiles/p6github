# shellcheck shell=bash
# Wrapper for gh-parallel extension

######################################################################
#<
#
# Function: p6_github_api_parallel_list(login, ...)
#
#  Args:
#	login -
#	... -
#
#>
######################################################################
p6_github_api_parallel_list() {
    local login="$1"
    shift 1

    gh parallel list "$login" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_parallel_clone(login, dest_dir, ...)
#
#  Args:
#	login -
#	dest_dir -
#	... -
#
#>
######################################################################
p6_github_api_parallel_clone() {
    local login="$1"
    local dest_dir="$2"
    shift 2

    gh parallel clone "$login" "$dest_dir" "$@"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_parallel_sync(dest_dir)
#
#  Args:
#	dest_dir -
#
#>
######################################################################
p6_github_api_parallel_sync() {
    local dest_dir="$1"

    gh parallel sync "$dest_dir"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_parallel_status(dest_dir)
#
#  Args:
#	dest_dir -
#
#>
######################################################################
p6_github_api_parallel_status() {
    local dest_dir="$1"

    gh parallel status "$dest_dir"

    p6_return_void
}

######################################################################
#<
#
# Function: p6_github_api_parallel_config([key=], [value=])
#
#  Args:
#	OPTIONAL key - []
#	OPTIONAL value - []
#
#>
######################################################################
p6_github_api_parallel_config() {
    local key="${1:-}"
    local value="${2:-}"

    gh parallel config "$key" "$value"

    p6_return_void
}
