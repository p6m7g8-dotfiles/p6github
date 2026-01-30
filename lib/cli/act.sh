# shellcheck shell=bash

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
