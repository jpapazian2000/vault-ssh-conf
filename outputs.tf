output "vault_backend_created" {
 value = vault_ssh_secret_backend_ca.ssh_backend.backend
}

output "vault_public_key" {
 value = vault_ssh_secret_backend_ca.ssh_backend.public_key
}