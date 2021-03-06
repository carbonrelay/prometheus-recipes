#!/bin/bash

# Created by argbash-init v2.8.0
# ARG_OPTIONAL_BOOLEAN([delete],[],[Deletes all the kubernetes resources generated by a normal run],[off])
# ARG_OPTIONAL_BOOLEAN([deploy-alertmanager],[a],[Deploy the alertmanager as part of Prometheus],[off])
# ARG_OPTIONAL_BOOLEAN([deploy-grafana],[g],[Deploy a pre-configured Grafana dashboard as part of Prometheus],[off])
# ARG_OPTIONAL_BOOLEAN([deploy-kube-state-metrics],[k],[Deploy the kube-state-metrics as part of Prometheus],[off])
# ARG_OPTIONAL_BOOLEAN([deploy-node-exporter],[n],[Deploy the node-exporter for node level metrics],[off])
# ARG_OPTIONAL_BOOLEAN([deploy-prometheus-adapter],[p],[Deploy the adapter for prometheus metrics],[off])
# ARG_POSITIONAL_SINGLE([namespaces],[List of comma-separated namespaces for prometheus to listen to.  By default, the default, kube-system, and monitoring namespaces are all monitored.],[""])
# ARG_DEFAULTS_POS()
# ARG_HELP([Initializes a prometheus agent within a kubernetes cluster])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.8.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}


begins_with_short_option()
{
	local first_option all_short_options='agknph'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_namespaces=""
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_delete="off"
_arg_deploy_alertmanager="off"
_arg_deploy_grafana="off"
_arg_deploy_kube_state_metrics="off"
_arg_deploy_node_exporter="off"
_arg_deploy_prometheus_adapter="off"


print_help()
{
	printf '%s\n' "Initializes a prometheus agent within a kubernetes cluster"
	printf 'Usage: %s [--(no-)delete] [-a|--(no-)deploy-alertmanager] [-g|--(no-)deploy-grafana] [-k|--(no-)deploy-kube-state-metrics] [-n|--(no-)deploy-node-exporter] [-p|--(no-)deploy-prometheus-adapter] [-h|--help] [<namespaces>]\n' "$0"
	printf '\t%s\n' "<namespaces>: List of comma-separated namespaces for prometheus to listen to.  By default, the default, kube-system, and monitoring namespaces are all monitored. (default: '""')"
	printf '\t%s\n' "--delete, --no-delete: Deletes all the kubernetes resources generated by a normal run (off by default)"
	printf '\t%s\n' "-a, --deploy-alertmanager, --no-deploy-alertmanager: Deploy the alertmanager as part of Prometheus (off by default)"
	printf '\t%s\n' "-g, --deploy-grafana, --no-deploy-grafana: Deploy a pre-configured Grafana dashboard as part of Prometheus (off by default)"
	printf '\t%s\n' "-k, --deploy-kube-state-metrics, --no-deploy-kube-state-metrics: Deploy the kube-state-metrics as part of Prometheus (off by default)"
	printf '\t%s\n' "-n, --deploy-node-exporter, --no-deploy-node-exporter: Deploy the node-exporter for node level metrics (off by default)"
	printf '\t%s\n' "-p, --deploy-prometheus-adapter, --no-deploy-prometheus-adapter: Deploy the adapter for prometheus metrics (off by default)"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			--no-delete|--delete)
				_arg_delete="on"
				test "${1:0:5}" = "--no-" && _arg_delete="off"
				;;
			-a|--no-deploy-alertmanager|--deploy-alertmanager)
				_arg_deploy_alertmanager="on"
				test "${1:0:5}" = "--no-" && _arg_deploy_alertmanager="off"
				;;
			-a*)
				_arg_deploy_alertmanager="on"
				_next="${_key##-a}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-a" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-g|--no-deploy-grafana|--deploy-grafana)
				_arg_deploy_grafana="on"
				test "${1:0:5}" = "--no-" && _arg_deploy_grafana="off"
				;;
			-g*)
				_arg_deploy_grafana="on"
				_next="${_key##-g}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-g" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-k|--no-deploy-kube-state-metrics|--deploy-kube-state-metrics)
				_arg_deploy_kube_state_metrics="on"
				test "${1:0:5}" = "--no-" && _arg_deploy_kube_state_metrics="off"
				;;
			-k*)
				_arg_deploy_kube_state_metrics="on"
				_next="${_key##-k}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-k" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-n|--no-deploy-node-exporter|--deploy-node-exporter)
				_arg_deploy_node_exporter="on"
				test "${1:0:5}" = "--no-" && _arg_deploy_node_exporter="off"
				;;
			-n*)
				_arg_deploy_node_exporter="on"
				_next="${_key##-n}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-n" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-p|--no-deploy-prometheus-adapter|--deploy-prometheus-adapter)
				_arg_deploy_prometheus_adapter="on"
				test "${1:0:5}" = "--no-" && _arg_deploy_prometheus_adapter="off"
				;;
			-p*)
				_arg_deploy_prometheus_adapter="on"
				_next="${_key##-p}"
				if test -n "$_next" -a "$_next" != "$_key"
				then
					begins_with_short_option "$_next" && shift && set -- "-p" "-${_next}" "$@" || die "The short option '$_key' can't be decomposed to ${_key:0:2} and -${_key:2}, because ${_key:0:2} doesn't accept value and '-${_key:2:1}' doesn't correspond to a short option."
				fi
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	test "${_positionals_count}" -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect between 0 and 1, but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_namespaces "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash


printf "'%s' is %s\\n" 'delete' "$_arg_delete"
printf "'%s' is %s\\n" 'deploy-alertmanager' "$_arg_deploy_alertmanager"
printf "'%s' is %s\\n" 'deploy-grafana' "$_arg_deploy_grafana"
printf "'%s' is %s\\n" 'deploy-kube-state-metrics' "$_arg_deploy_kube_state_metrics"
printf "'%s' is %s\\n" 'deploy-node-exporter' "$_arg_deploy_node_exporter"
printf "'%s' is %s\\n" 'deploy-prometheus-adapter' "$_arg_deploy_prometheus_adapter"
printf "Value of '%s': %s\\n" 'namespaces' "$_arg_namespaces"


export namespaces=$_arg_namespaces
export delete=$_arg_delete
export deploy_alertmanager=$_arg_deploy_alertmanager
export deploy_grafana=$_arg_deploy_grafana
export deploy_kube_state_metrics=$_arg_deploy_kube_state_metrics
export deploy_node_exporter=$_arg_deploy_node_exporter
export deploy_prometheus_adapter=$_arg_deploy_prometheus_adapter

(
    cd $(dirname $0)
    ./prometheus.sh
)
# ] <-- needed because of Argbash
