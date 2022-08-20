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

  brew install helm

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
# Function: p6df::modules::helm::prompt::line()
#
#>
#/ Operating System	Cache Path			Configuration Path		Data Path
#/ Linux		$HOME/.cache/helm		$HOME/.config/helm		$HOME/.local/share/helm
#/ macOS		$HOME/Library/Caches/helm	$HOME/Library/Preferences/helm	$HOME/Library/helm
#/ Windows		%TEMP%\helm			%APPDATA%\helm			%APPDATA%\helm
######################################################################
p6df::modules::helm::prompt::line() {

    local str

    if ! p6_string_blank "$KUBECONFIG"; then
      str="helm:     "
    fi

    local helm_ctx=${HELM_KUBECONTEXT:-$P6_KUBE_CFG}
    if ! p6_string_blank "$helm_ctx"; then
      str="${str}ctx=[$helm_ctx]"
    fi
    local helm_ns=${HELM_NAMESPACE:-$P6_KUBE_NS}
    if ! p6_string_blank "$helm_ns"; then
      str="${str} ns=[$helm_ns]"
    fi

    if p6_string_blank "$str"; then
      p6_return_void
    else
      p6_return_str "$str"
    fi
}

######################################################################
#<
#
# Function: p6df::modules::helm::kubernetes::dashboard::token()
#
#>
######################################################################
p6df::modules::helm::kubernetes::dashboard::token() {

  local secret
  secret=$(kubectl -n kube-system get secret | awk '/eks-admin/ { print $1 }')

  kubectl -n kube-system describe secret "$secret" | awk '/^token/ { print $2 }'
}

######################################################################
#<
#
# Function: p6df::modules::helm::jenkins::admin::password()
#
#  Environment:	 JENKINS_PASS
#>
######################################################################
p6df::modules::helm::jenkins::admin::password() {

  local pass
  pass=$(kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password)
  p6_env_export "JENKINS_PASS" "$pass"

  p6_return_str "$pass"
}

######################################################################
#<
#
# Function: p6df::modules::helm::external-dns::chart::add(zone_id, role_arn)
#
#  Args:
#	zone_id -
#	role_arn -
#
#>
######################################################################
p6df::modules::helm::external-dns::chart::add() {
  local zone_id="$1"
  local role_arn="$2"

  helm install -n kube-system bitnami/external-dns external-dns --set policy=sync --set txtOwnerId=$zone_id --set aws.assumeRoleArn=$role_arn --set log-level=debug
}

######################################################################
#<
#
# Function: p6df::modules::helm::jenkins::chart::add()
#
#  Environment:	 URL
#>
######################################################################
p6df::modules::helm::jenkins::chart::add() {

  local str
  str=$(p6_template_process "share/jenkins-chart-values.yaml.in" "URL=x")
  p6_file_write "/tmp/jenkins-chart-values.yaml"

  helm install -f "/tmp/jenkins-chart-values.yaml" jenkins jenkinsci/jenkins
}
