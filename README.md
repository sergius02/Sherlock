
<p align="center">
  <img src="data/icons/128/com.github.sergius02.sherlock.svg" alt="Icon" />
</p>
<h1 align="center">Sherlock</h1>

|![alt](screenshots/Sherlock.png) |![alt](screenshots/Sherlock2.png)|
|---------------------|---------------------|

With Sherlock you can find information about your current IP or search for public IP addresses information , elementary! 🕵️

## Dependencies

Ensure you have these dependencies installed

* valac
* glib-2.0
* gtk+-3.0
* libsoup-2.4
* json-glib-1.0
* gee-0.8
* gmodule-2.0

## Install, build and run

```bash
# install elementary-sdk, meson and ninja
sudo apt install elementary-sdk meson ninja
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
This is my first Vala application, be gentle 😹️

If you like my work you can

<a href="https://www.buymeacoffee.com/sergius02" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
