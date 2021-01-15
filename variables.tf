variable "vault_addr" {
    description         = "url of the vault server http(s)://<name or ip>:port"
    default             = ""
}

variable "vault_admin_token" {
    description         = "admin token to allow creation of roles, etc..."
    default             = ""
}

variable "default_user" {
    description         = "default user to be allowed ssh access"
    default             = "ubuntu"
}