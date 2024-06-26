# rustdesk-kasm-image
## Rustdesk image/app for Kasm Workspaces

## Grab it from my Kasm Registry

Just add https://jreming85.github.io/kasm_registry/ as a registry.

If its your first time, make sure to enable persistant data (or dont) and run the Legacy client.  Configure it to your server or if your not running your own rustdesk server, use out of the box.

After it has been configured, you can then stay on the legacy version or use the latest version, however you will need to make sure you untick the protect settings option as it wont let you access them in the latest version.

## Grab it from github

To help anyone else that want to use this, I have created a docker image on github.

To use it, on your kasm server you will need to pull the image.  I created a registry, but it doesnt seem to work at the moment.

```docker pull ghcr.io/jreming85/rustdesk-kasm-image:main```
After go to the Add to Kasm section, but change
**Docker Image = ghcr.io/jreming85/rustdesk-kasm-image:main**

## Build it from source

To add to Kasm, first clone the git and cd into it I prefer to put most of my projects in /opt so

```
cd /opt
git clone https://github.com/JReming85/rustdesk-kasm-image.git
cd rustdesk-kasm-image/
```

Next you will need to build the image, 

_note: it is currently set to grab the latest x86/x64 deb file from Rustdesks official github.  It does this by first parsing the latest release page for the x86_x64.deb file, and using that as the package to download/install._

Originially I was hosting all files on my own server but figured it would be safest and less questionable if I had it pull the official deb, and pulled all other files from this git.

`docker build -t rustdesk-kasm-image:main -f Dockerfile .`

![image](https://github.com/JReming85/rustdesk-kasm-image/assets/21246660/f71b9fb2-5f1b-40be-a3c0-f164f02452e5)

Once it has finish building we can now add it as an image in Kasm
### Add to Kasm
Log into your Kasm instance as an admin, Goto Workspaces and then click + Add Workspace ![image](https://github.com/JReming85/rustdesk-kasm-image/assets/21246660/00e4e563-1733-42e0-a67f-b5fe8f8ab5bb)

**Workspace Type = Container**

**Friendly Name = Rustdesk**

Set a Description if you want

For Thumbnail, I went and uploaded a image to github you can use if you wish `https://github.com/JReming85/rustdesk-kasm-image/blob/main/rustdesk.png` 

![image](https://github.com/JReming85/rustdesk-kasm-image/blob/main/rustdesk.png?raw=true)

**Enabled = True/Checked**

**Docker Image = rustdesk-kasm-image:main**

Set what you want for resources, I used the defaults

**Cores = 2**

**Memory (MB)= 2768** (I am sure you can set this a lot lower, but its the default on my server)

**GPU Count 0**

**Uncompressed Image Size (MB) = 2900**

**CPU Allocation Method = Inherit**



I would highly recommend using a Persistent Profile Path, so you cna save your favorites

I use `/kasm-profiles/{username}/Rustdesk`


and Save/Submit
