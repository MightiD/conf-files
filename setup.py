import os

pwd = os.getcwd()

ignore = [".git", "setup.py", "setup.sh", "deps", "templates" "__packages.sh"]

os.system("python ./deps/__packages.sh")

def main():
    for (root,dirs,files) in os.walk("./", topdown=True):
        dirs[:] = [d for d in dirs if d not in ignore]
        files = [f for f in files if f not in ignore]

        for file in files:

            relPath = os.path.join(root, file)
            absPath = os.path.abspath(relPath)

            relSuffix = absPath.replace(pwd, "", 1).lstrip("/")
            homePath = os.path.expanduser(f"~/{relSuffix}")

            os.makedirs(os.path.dirname(homePath), exist_ok=True)

            os.system(f"ln -sf \"{absPath}\" \"{homePath}\"")
    
    for (root,dirs,files) in os.walk("./deps", topdown=True):
        for file in files:
            print(file)
            os.system(f"./deps/{file}")
    
    os.system("~/.config/hypr/scripts/hyprland.conf.sh")

if __name__ == "__main__":
    main()
