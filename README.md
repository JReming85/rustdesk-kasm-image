# rustdesk-kasm-image
## Rustdesk image/app for Kasm Workspaces

To add to Kasm, first clone the git and cd into it
`git clone https://github.com/JReming85/rustdesk-kasm-image.git`
`cd rustdesk-kasm-image/`

Next you will need to build the image
`docker build -t rustdesk-kasm-image:main -f Dockerfile .`
![image](https://github.com/JReming85/rustdesk-kasm-image/assets/21246660/f71b9fb2-5f1b-40be-a3c0-f164f02452e5)

Once it has finish building we can now add it as an image in Kasm

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
