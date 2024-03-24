# shellcheck shell=bash
######################################################################
#<
#
# Function: str pass = p6df::modules::helm::jenkins::admin::password()
#
#  Returns:
#	str - pass
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
