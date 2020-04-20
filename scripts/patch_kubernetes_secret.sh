#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o xtrace

# the environment variable is created by envconsul
base64Secret=`echo $SECRET_DATA_MYAPP_CONFIG_PASSWORD | base64`
cat << EOF > "/$HOME/patch"
{
  "data" : {
    "key" : "$base64Secret"
  }
}
EOF

# patch the Kubernetes secret with the latest value from Vault/envconsul
curl -s -XPATCH -d "@/$HOME/patch" \
-H "Content-Type: application/merge-patch+json" \
-H "Authorization: Bearer $(cat /run/secrets/kubernetes.io/serviceaccount/token)" \
-k "https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT_HTTPS/api/v1/namespaces/default/secrets/mycustomsecret"