# K3S on vms

## Overview

This is folder for running K3S on vms using vagrant & virtualbox toolset

## Setup

### Pre-requisites:

0. Download VirtualBox

<details>
<summary>Windows Hyper-V</summary>
<br>
1. To make VirtualBox vms function properly disable Hyper-V and enable windows VMs 
(in Apps & Features > Optional Features > More optional Features)
<br>
2. Disable core isolation
</details>

1. Install [Vagrant](https://www.vagrantup.com/downloads) and install vbguest plugin

```bash
vagrant plugin install vagrant-vbguest
```

2. (optional) Install [kubectl](https://kubernetes.io/docs/tasks/tools/)
3. (optional) Install [GIT](https://git-scm.com/downloads)

### Launching cluster:

0. Create directory where you want script to be stored
1. Open cmd as administrator (jic, as tested) or shell or terminal (depending on OS)
2. Navigate to directory, using `cd` and once you are there type

<pre>
git clone "<b>Paste_here_link_to_github_repo</b>" .
</pre>

3. Change values in Vagrantfile to fit your configuration
4. Type

```bash
vagrant up
```

5. It is that easy - you are done
6. (optional) If to use kubectl from dev machine, copy config file at `"vms/configs/config"` to `$HOME/.kube/config` 
or use `KUBECONFIG` enviroment variable tostore path to config file

To set env var you should use `export` command on unix-like systems and `set` on windows

## Uninstall

1. Type

```bash
vagrant destroy -f
```
