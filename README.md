## My conf files 
If anyone accidentally stumbles upon this repo somehow

# How to use
``` sh
git clone http://github.com/mightid/conf-files.git
cd conf-files
./setup.sh
```

It installs the required packages, then copies over some conf files, clones some repos and sets them up ect..

Then the script makes sym links from the git repo to the target files in
```
~/.config/
~/scripts/
~/
```

If you want to use these conf files, I think you have to delete all your existing ones, as it complains when it has to override files I think
