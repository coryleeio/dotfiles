# What is this

My dotfiles repo, installed via ansible

# How to use this
Either install nix or ansible

## With nix
```shell
nix-develop
```

or just install ansible then do:


### For Linux
```shell
ansible-playbook --ask-become-pass \
        -i hosts \
        linux.yml
```

### For Mac

```shell
ansible-playbook --ask-become-pass \
        -i hosts \
        mac.yml
```
