## utils

Handy little scripts. The version of bash on macOS is usually quite old, so be sure to install the latest via brew as follows:

    brew install bash

![Demo][demo]

| Utility | Description |
|---------|-------------|
| flip| Flip working to another repo |
| open-gh| Open Github |
| gf| Run git fetch across all cloned repos |
| gs| Run git status across all cloned repos |
| s| fzf powered ssh shorthand - Needs configuration, see below |
| ta| fzf powered tmux attach |
| tk| fzf powered tmux kill session|
| tls| tmux ls shorthand |
| tn| tmux new shorthand | 

[demo]: utils-demo.webp

## Configuration

### s

`s` loads SSH hosts from `~/.ssh_hosts`. Copy the provided example and fill in your own hosts:

```bash
cp ssh_hosts.example ~/.ssh_hosts
```

Each line has the format `display_name|ssh_command`, with `#` for comments:

```
# Simple host
my-server|ssh user@192.168.1.10

# Host requiring legacy SSH options (e.g. managed switches)
office-switch|ssh -oPreferredAuthentications=password -oHostKeyAlgorithms=+ssh-rsa admin@192.168.1.2
```

You can override the config file location with the `SSH_HOSTS_FILE` environment variable.
