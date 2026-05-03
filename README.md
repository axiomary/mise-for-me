# Mise-for-me

This repo is the tooling bootstrapinator for all axiomary/ projects (WIP)

You must have mise-en-place installed. [Here](https://mise.jdx.dev/getting-started.html)

The idea is to clone this repo, run the bootstrap script `./bootstrap-machine.sh` and then you will be able to run mise commands anywhere without having to install repo specific tooling, and bootstrap everytime. 

Run `mise run` to see the available commands! 

```Tasks
tfa   Runs terraform apply
tfch  format AND validate all in one!
tff   runs terraform fmt
tfi   Runs terraform init
tfp   Runs terraform plan
tfv   Runs terraform validate
```


Note to future Scott: on git 2.54.0+ we can do global hk install.

# FUTURE TECH 
I want to be able to merge many tool specific sub-tomls into config.toml 
so like
--> terraform.toml
--> docker.toml
--> foo.toml
------> config.toml
