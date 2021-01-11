variable "vault_addr" {
    description         = "url of the vault server http(s)://<name or ip>:port"
    default             = ""
}

variable "default_user" {
    description         = "default user to be allowed ssh access"
    default             = "ubuntu"
}