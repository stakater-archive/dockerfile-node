#!/bin/bash
_node_version=$1
_node_tag=$2
_release_build=false

if [ -z "${_node_version}" ]; then
	source NODE_VERSION
	_node_version=$NODE_VERSION
	_node_tag=$NODE_VERSION
	_release_build=true
fi

echo "NODE_VERSION: ${_node_version}"
echo "DOCKER TAG: ${_node_tag}"
echo "RELEASE BUILD: ${_release_build}"

docker build --build-arg NODE_VERSION=${_node_version} --tag "stakater/node:${_node_tag}"  --no-cache=true .

if [ $_release_build == true ]; then
	docker tag "stakater/node:${_node_tag}" "stakater/node:latest"
fi