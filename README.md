## utils

Handy little scripts. The version of bash on macOS is usually quite old, so be sure to install the latest via brew as follows:

    brew install bash

Some of these scripts are designed to be run stand-alone. Others are in support of custom [television](https://alexpasmantier.github.io/television/) [channels](https://github.com/jasondchambers/dot-files/tree/main/television/cable)

![Demo][demo]

| Utility | Description |
|---------|-------------|
| flip | Yet another tmux session manager - can be used inside or outside tmux |
| open-gh | Open Github - used within tmux |
| gf | Run git fetch across all cloned repos |
| gs | Run git status across all cloned repos |
| ta | fzf powered tmux attach |
| tk | fzf powered tmux kill session |
| tls | tmux ls shorthand |
| tn | tmux new shorthand |
| ssh-get-command | Used by "tv ssh" channel |
| sftp-get-command | Used by "tv sftp" channel |
| dbproxy-get-command | Used by "tv dbproxy" channel |

[demo]: utils-demo.webp

## Configuration

### ssh-get-command / sftp-get-command (in support of "tv ssh|sftp" channels)

These utilities look up hosts from `~/.ssh_hosts`. Copy the provided example and fill in your own hosts:

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

### dbproxy-get-command (in support of "tv dbroxy" channel)

Looks up database proxy commands from `~/.databases`. Copy the provided example and fill in your own databases:

```bash
cp databases.examples ~/.databases
```

Each line has the format `display_name|proxy_command`:

```
Dev: mydb-dev|tsh proxy db --tunnel --port 60005 --db-name mydb --db-user admin@mydb-dev.iam mydb-dev
```
