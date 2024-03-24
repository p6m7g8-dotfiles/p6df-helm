# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::helm::deps()
#
#>
######################################################################
p6df::modules::helm::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-go
    p6m7g8-dotfiles/p6helm
    ohmyzsh/ohmyzsh:plugins/helm
  )
}

######################################################################
#<
#
# Function: p6df::modules::helm::external::brew()
#
#>
######################################################################
p6df::modules::helm::external::brew() {

  p6df::modules::homebrew::cli::brew::install helm

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::helm::langs()
#
#>
######################################################################
p6df::modules::helm::langs() {

  helm repo add bitnami https://charts.bitnami.com/bitnami
  helm repo add jenkinsci https://charts.jenkins.io
  helm repo add kubernetes-dashoard https://kubernetes.github.io/dashboard
  helm repo add nginx https://helm.nginx.com/stable
  helm repo add prometheus https://prometheus-community.github.io/helm-charts
  helm repo add stable https://charts.helm.sh/stable

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::helm::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules::helm::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::helm::prompt::line()
#
#>
#/ Operating System Cache Path		      Configuration Path 	     Data Path
#/ Linux  	    $HOME/.cache/helm         $HOME/.config/helm  	     $HOME/.local/share/helm
#/ macOS	    $HOME/Library/Caches/helm $HOME/Library/Preferences/helm $HOME/Library/helm
#/ Windows	    %TEMP%\helm		      %APPDATA%\helm		     %APPDATA%\helm
######################################################################
p6df::modules::helm::prompt::line() {

  p6_helm_prompt_info
}
