######################################################################
#<
#
# Function: p6df::modules::p6github::deps()
#
#  Depends:	 p6_bootstrap
#>
######################################################################
p6df::modules::p6github::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::p6github::init()
#
#  Depends:	 p6_bootstrap
#>
######################################################################
p6df::modules::p6github::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"
}
