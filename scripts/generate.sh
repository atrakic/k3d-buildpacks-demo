#!/usr/bin/env bash
set -e
set -o pipefail
[[ -n $DEBUG ]] && set -x

APP=${1:-demo}
IMAGE=myproj/demo:v1.0.0

main() {
  local file=manifests/deploy.yml

  echo --- > $file
  kubectl create service clusterip $APP --tcp=80:8080 --dry-run=client -o yaml | grep -Ev "creationTimestamp" >> $file

  echo --- >> $file
  kubectl create deployment $APP --image $IMAGE --dry-run=client -o yaml | grep -Ev "status|creationTimestamp" >> $file

  [[ -z $NO_INGRESS ]] && cat >> $file <<EOF
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: $APP
  annotations:
    ingress.kubernetes.io/ssl-redirect: "false"
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: $APP
            port:
              number: 80
EOF
}

main "$@"
