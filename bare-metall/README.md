# K3S on Bare-Metall

## Overview

Folder with code for running K3S on windows WSL nodes and other linux distros

## Setup

### Linux Bare-Metall

1. Run do_all under root in Ubuntu

### Windows WSL

:no_entry: Yet this is not working. Problems with calico nodes connections timeout and systemd absence on old windows distros

1. Make sure [windows update](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5020030) is installed
2. Download WSL from windows store
3. Run in powershell [setup script](./setup.ps1)
4. (optional) Download ubuntu for wsl if it didn't happen in 1
    - Do 1 again
5. Run do_all under root in Ubuntu
