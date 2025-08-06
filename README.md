## My conf files 
If anyone accidentally stumbles upon this repo somehow

# How to use
``` sh
git clone http://github.com/mightid/conf-files.git
cd conf-files
python setup.py
```

The script works by making sym links from the git repo to the target files in
```
~/.config/
~/scripts/
~/
```

If you want to use these conf files, I think you have to delete all your existing ones, as it complains when it has to override files I think
