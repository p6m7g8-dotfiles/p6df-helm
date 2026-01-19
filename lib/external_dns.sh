# shellcheck shell=bash
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

  helm install -n kube-system bitnami/external-dns external-dns --set policy=sync --set txtOwnerId="$zone_id" --set aws.assumeRoleArn="$role_arn" --set log-level=debug
}
