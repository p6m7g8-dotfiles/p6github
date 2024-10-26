# shellcheck shell=bash

######################################################################
#<
#
# Function: stream  = p6_github_cli_act()
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

######################################################################
#<
#
# Function: stream  = p6_github_cli_act_build()
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_act_build() {

  p6_github_cli_act -j build

  p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_github_cli_act_release()
#
#  Returns:
#	stream - 
#
#>
######################################################################
p6_github_cli_act_release() {

  p6_github_cli_act -j release

  p6_return_stream
}
