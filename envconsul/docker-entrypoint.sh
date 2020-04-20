#!/bin/bash

# envconsul does not support `vault_agent_token_file` (consul-template)
export VAULT_TOKEN=$(cat /home/vault/.vault-token)
/bin/envconsul -config=/etc/envconsul/envconsul-config.hcl -secret="secret/data/myapp/config"