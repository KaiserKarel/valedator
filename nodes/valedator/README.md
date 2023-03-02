How to boot this on a new node:

1. Clone the repo.
2. Add a file named `keyfile` to the secrets directory of the node you want to run, with the passphrase of the private key (.cpt) file.
3. `sudo docker compose up -d` to start the node in daemon mode.

Useful commands:

- `sudo docker compose logs -f` for logs
- `sudo docker exec -it valedator-node /bin/sh` to use marsd and other commands.

In the current setup, only the data dir is persisted between runs. Make sure to add  other volumes if needed.