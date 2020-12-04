
<p align="center">
  <img src="data/icons/128/com.github.sergius02.sherlock.svg" alt="Icon" />
</p>
<h1 align="center">Sherlock</h1>

![Last Release](https://img.shields.io/github/v/release/sergius02/Sherlock?include_prereleases&style=for-the-badge)
![Build Status](https://img.shields.io/travis/sergius02/Sherlock/master?style=for-the-badge)
![License](https://img.shields.io/github/license/sergius02/Sherlock?style=for-the-badge)

|![alt](screenshots/sherlock.png) |![alt](screenshots/sherlock2.png)|
|---------------------------------|---------------------------------|
|![alt](screenshots/sherlock3.png)|![alt](screenshots/sherlock4.png)|

<p align="center">
  <a href="https://appcenter.elementary.io/com.github.sergius02.sherlock"><img src="https://appcenter.elementary.io/badge.svg" alt="Get it on AppCenter" /></a>
</p>

With Sherlock you can find information about your current IP or search for public IP addresses information , elementary! 🕵️

## Dependencies

Ensure you have these dependencies installed

* valac
* glib-2.0
* gtk+-3.0
* libsoup-2.4
* json-glib-1.0

## Install, build and run

```bash
# FOR ELEMENTARY OS USERS
sudo apt install elementary-sdk

# FOR THE REST
sudo apt install cmake libgtk-3-dev gettext libjson-glib-dev libsoup2.4-dev

# clone repository
git clone https://github.com/sergius02/Sherlock Sherlock

# cd to dir
cd Sherlock

# run meson
meson build --prefix=/usr

# cd to build
cd build

# build
ninja

# install
sudo ninja install
```

## Credits

* [IP-API](https://ip-api.com/)
* [REMIXICON](https://remixicon.com/)
* [Visual studio code](https://code.visualstudio.com/)
* App icon from [Flaticon](https://www.flaticon.es/)

----------

If you like my work you can

<a href="https://www.buymeacoffee.com/sergius02" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
