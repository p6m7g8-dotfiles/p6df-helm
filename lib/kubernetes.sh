# shellcheck shell=bash
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
