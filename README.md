# My systems

![Playbook run](https://github.com/carlotm/dotfiles/actions/workflows/systems.yml/badge.svg)

| Profile | Hostname | OS | Description
| :--- | :--- | :--- | :---
| workstation | scumm | Debian stable | My work and personal laptops
| mediacenter | melee | Debian stable | The pc connected to the TV
| chiara | elaine | Debian stable | My wife's laptop

## Requirements

The playbook `sys.yml` is meant to be used on a Debian Operating System.

You need to have `git` (to clone this repository),
`make` and `ansible-playbook` in path to use `sys.yml`:

```
apt install git make ansible
```

## Run

To set up the machine, run:

```
sudo make <profile>
```

if you are **on** the machine you want to set up, run:

```
sudo make LOCAL=true <profile>
```
