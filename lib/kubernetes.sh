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
  secret=$(kubectl -n kube-system get secret | p6_filter_row_select "eks-admin" | p6_filter_column_pluck 1)

  kubectl -n kube-system describe secret "$secret" | p6_filter_row_select "^token" | p6_filter_column_pluck 2
}
