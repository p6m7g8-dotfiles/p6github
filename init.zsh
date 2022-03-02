######################################################################
#<
#
# Function: p6df::modules::p6github::deps()
#
#>
######################################################################
p6df::modules::p6github::deps() {
  ModuleDeps=(
    p6m7g8/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::p6github::init()
#
#  Depends:	 p6_bootstrap
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::p6github::init() {

  local dir="$P6_DFZ_SRC_DIR/p6m7g8/p6github"
  p6_bootstrap "$dir"
}
