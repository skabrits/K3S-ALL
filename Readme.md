# K3S on all OS

## Overview

This is infrastructure repo for creating on-prem k3s cluster on all available platforms

## Setup

### Windows: VMS

1. Navigate to folder [vms](./vms)
2. Follow instructions from read-me of that folder

### Windows: WSL

:warning: Not implemented yet

### Linux: Bare-metall

1. Navigate to folder [bare-metall](./bare-metall)
2. Follow instructions from read-me of that folder

## Compatibility matrix

| OS                                 | Status                  | Condition        |
| ---                                | :------:                | :--------------: |
| Windows WSL                        | :gear:                  | in progress      |
| Windows Bare-Metall                | :no_entry:              | abandoned        |
| Windows/Mac OS VirtualBox VM       | :white_check_mark:      | done and tested  |
| Linux VirtualBox VM                | :ballot_box_with_check: | almost done      |
| Linux Bare-Metall                  | :heavy_check_mark:      | done, not tested |
| Raspberian Bare-Metall             | :electron:              | planned          |
