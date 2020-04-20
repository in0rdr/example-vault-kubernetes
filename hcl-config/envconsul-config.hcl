vault {
  # cron job in a short lifed container
  renew_token = false

  # retry options for connecting to Vault
  retry {
    enabled = false
  }
}

secret {
  format = "ENVCONSUL_{{ key }}"
  path = "secret/data/myapp/config"
}

upcase = true

exec {
  command = "/scripts/patch_kubernetes_secret.sh"
}