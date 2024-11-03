# What is this

My dotfiles repo, installed via ansible

# How to use this

Install ansible then

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
