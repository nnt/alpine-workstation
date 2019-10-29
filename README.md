# Alpine Linux Workstation

## What is this?

Alpine Linux, crafted to be a workstation, for beginner-level system engineers
* Alpine v3.10
	* Vagrant-wrapped (base box: [generic/alpine310](https://app.vagrantup.com/generic/boxes/alpine310))
	* [Hyper-V](https://en.wikipedia.org/wiki/Hyper-V) backed
* Packages added:
	* `git`, `nano`, `htop`, `iotop`, `shadow`
	* `zsh`
		* `oh-my-zsh` framework, using [agnoster](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes#agnoster) theme, [powerline fonts](https://github.com/powerline/fonts) installed
	* `docker` Community Edition
* PowerShell backup script

## Why this?

* I'm equipped with a Windows laptop and I'm not used to Windows (don't get me wrong -- this machine is a real beast, in a very good way)
* It's fun building stuff, even the simplest ones

## Requirements

* Windows with Hyper-V
* Vagrant
* _Recommended_: [Git Bash for Windows](https://git-scm.com/downloads) as the terminal (all commands here run under Git Bash)

## How to

### Get things up

```
git clone https://github.com/nnt/alpine-workstation.git
cd alpine-workstation
vagrant up
vagrant ssh
```

### Back up

```
powershell scripts/back-up-vm.ps1
```

A new Vagrant box is then placed under `"Documents\Vagrant-backups"`
