# What is this

My dotfiles repo, installed via ansible. 

# How to use this

## Initial bootstrap

You need an initial ansible install to run it, i usually install it via pacman then remove it after the first run (using the nix flake after that)

## Subsequent runs

```shell
for Subsequent runs ansible will be on your path from the nix develop shell
```

Either using nix develop via direnv or install via package manager, you just need ansible on your path

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
