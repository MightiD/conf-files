# Instructions for self on how to set up ungoogled-chromium

Profile is stored at `~/.config/chromium/`

```sh
yay -S ungoogled-chromium-bin
```

Run it at least once

Download chrome `.deb` image from [here](https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb)
```sh
av x google-chrome-stable-current_amd64.deb
tar -xvf data.tar.xz
cd ./opt/google/chrome/WidevineCdm
sudo cp -r ./ /usr/lib/chromium/WidevineCdm
```

Test if Widevine is working [here](https://bitmovin.com/demos/drm)

## Make it run with `--enable-widevine` flag globally

```sh
readlink -f "$(which chromium)"
# find where chromium is downloaded
# /usr/bin in this example

cd /usr/bin
sudo mv chromium chromium.real
sudoedit chromium
```

`/usr/bin/chromium`:
```sh
#!/bin/sh
exec /usr/bin/chromium.real --enable-widevine "$@"
```

```sh
sudo chmod +x chromium

# check if working
chromium --version
```
