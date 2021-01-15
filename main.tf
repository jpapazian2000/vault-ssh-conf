provider "vault" {
 address		= var.vault_addr
 add_address_to_env	= "true"
 token			= var.vault_admin_token
 token_name		= "vault-ssh-token"
 namespace		= "Tech/AWS"
}

resource "vault_token" "ssh-token" {
  policies = ["ssh-user-policy"]

  renewable = true
  ttl = "1200s"
}

resource "vault_mount" "ssh_engine" {
 type			= "ssh"
 path			= "ssh-client2"
 }

resource "vault_ssh_secret_backend_ca" "ssh_backend" {
 backend		= vault_mount.ssh_engine.path
 generate_signing_key	= "true"
}

resource "vault_ssh_secret_backend_role" "ssh_role" {
 name			= "sshclient2role"
 backend		= vault_mount.ssh_engine.path
 key_type		= "ca"
 allow_user_certificates = true
 default_user		= var.default_user
 allowed_users		= "*"
 default_extensions	= {"permit-pty":""}
 ttl			= 1200
 }
