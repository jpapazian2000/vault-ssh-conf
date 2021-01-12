This is the configuration of the vault ssh server

This module will do the following:
1. configure the terraform vault provider to use the correct namespace (it is not yet a variable, but can be done easily)
2. Mount the ssh secret engine at a path (ssh-client in y case, can be also a variable)
3. Configure a Certificate Authority to sign the ssh keys. The keys of the CA can be either imported or generated. In this example, they are generated
4. Create a role (sshclient2role, can be a variable as well) to allow users to sign their own public key with this role

**USAGE**

1. Fork/clone this repo in your own github
2. create a workspace (same name, better :-) ) and link this workspace to your vcs
3. The following variables are needed:
    1. vault_addr: adress of the vault server `http/https://<vault_ip/dns>:8200`
    2. default_user: default user to allow ssh to. Will be written in the ssh role. `ubuntu` by default in my case
4. you need to adjust to variables if your vault server is hosted in a cloud: you will have to add the cloud credentials to connect to it.
5. Queue a plan. Confirm the apply.
6. When it's done, connect to your `vault_server` in your selected `namespace` 
7. Select the ssh secret engine you've configured.
8. You can have the `roles` or the `configuration` 
    1. if you click on `roles` and select the role you've created, you can now in the interface sign a public_key.
    2. if you click on `configuration` you can see the configuration of the ssh secret engine.
        1. if from there you click on `configure` (right hand side of the screen) you will get a way to see the `public_key` that was generated for this CA.
9. You can now move to the next part of this demo, which is the aws configuration of the environement, leveraging the data provided by vault
