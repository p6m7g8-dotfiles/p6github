# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_github_cli_act(...)
#
#  Args:
#	... - 
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_act() {
  shift 0

  act --container-architecture linux/amd64 --container-daemon-socket - --container-options "--memory 4g" "$@"

  p6_return_stream
}
