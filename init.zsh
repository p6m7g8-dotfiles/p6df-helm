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
# Function: p6df::modules::helm::home::symlinks()
#
#  Environment:	 HOME P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::helm::home::symlinks() {

  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/helm-generator"                   "$HOME/.claude/skills/helm-generator"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/helm-validator"                   "$HOME/.claude/skills/helm-validator"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::helm::external::brews()
#
#>
######################################################################
p6df::modules::helm::external::brews() {

  p6df::core::homebrew::cli::brew::install helm

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
  helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard
  helm repo add nginx https://helm.nginx.com/stable
  helm repo add prometheus https://prometheus-community.github.io/helm-charts
  helm repo add stable https://charts.helm.sh/stable

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::helm::prompt::context()
#
#>
#/ Operating System Cache Path		      Configuration Path 	      Data Path
#/ Linux  	    $HOME/.cache/helm         $HOME/.config/helm  	      $HOME/.local/share/helm
#/ macOS	    $HOME/Library/Caches/helm $HOME/Library/Preferences/helm  $HOME/Library/helm
#/ Windows	    %TEMP%\helm		      %APPDATA%\helm		      %APPDATA%\helm
######################################################################
p6df::modules::helm::prompt::context() {

  p6_helm_prompt_info
}
