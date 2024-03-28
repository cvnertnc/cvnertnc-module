# cvnertnc-module
> It's my magisk module, thanks to Mods-Center
### Building from source with termux
<details><summary><big>Termux</big></summary>

| Android Version | Download Link|
| ---- | ----- |
| Android 8+ | [Termux Monet](https://github.com/HardcodedCat/termux-monet/releases/latest) (Strictly Recommended)
| Android 4+ | [Termux](https://github.com/termux/termux-app/releases/latest)
</details>

#### Script 1
```sh
apt update -y && apt upgrade -y
pkg install -y git zip figlet
rm -rf cvnertnc-module
git clone --depth=1 https://github.com/cvnertnc/cvnertnc-module
cd cvnertnc-module
bash autobuild.sh
mv cvnertnc-module-* /sdcard
```
#### Or Script 2
```sh
apt update -y && apt upgrade -y && pkg install -y git zip figlet && rm -rf cvnertnc-module && git clone --depth=1 https://github.com/cvnertnc/cvnertnc-module && cd cvnertnc-module && bash autobuild.sh
mv cvnertnc-module-* /sdcard
```
<details><summary><big>Sources</big></summary>
<ul>
 <li><a href="https://github.com/Mods-Center/">Mods-Center</a></li>
 <li><a href="https://github.com/cvnertnc/">cvnertnc</a></li>
</ul>
</details>
