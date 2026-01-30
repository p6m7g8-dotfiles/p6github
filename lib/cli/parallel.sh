# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_github_cli_parallel_list(login, ...)
#
#  Args:
#	login -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_parallel_list() {
    local login="$1"
    shift 1

    p6_github_cli parallel list "$login" "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_parallel_clone(login, dest_dir, ...)
#
#  Args:
#	login -
#	dest_dir -
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_parallel_clone() {
    local login="$1"
    local dest_dir="$2"
    shift 2

    p6_github_cli parallel clone "$login" "$dest_dir" "$@"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_parallel_sync(dest_dir)
#
#  Args:
#	dest_dir -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_parallel_sync() {
    local dest_dir="$1"

    p6_github_cli parallel sync "$dest_dir"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_parallel_status(dest_dir)
#
#  Args:
#	dest_dir -
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_parallel_status() {
    local dest_dir="$1"

    p6_github_cli parallel status "$dest_dir"

    p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_parallel_config([key=], [value=])
#
#  Args:
#	OPTIONAL key - []
#	OPTIONAL value - []
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_parallel_config() {
    local key="${1:-}"
    local value="${2:-}"

    p6_github_cli parallel config "$key" "$value"

    p6_return_stream
}
