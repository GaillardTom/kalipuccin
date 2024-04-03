## `🐲` Kalipuccin

>[!Important]
>**This is meant to be installed on a _fresh_ Kali install**. You _could_ do this on your battle-hardened Kali machine with all your previous configurations, but make sure you alter the script to preserve your previous configs or back them up first. 

<table>
    <tr>
        <td><b>OS</b></td>
        <td>Kali Linux</td>
    </tr>
    <tr>
        <td><b>Window Manager</b></td>
        <td>Bspwm</td>
    </tr>
    <tr>
        <td><b>Terminal</b></td>
        <td>Alacritty</td>
    </tr>
    <tr>
        <td><b>Shell</b></td>
        <td>Zsh + Oh My Zsh</td>
    </tr>
    <tr>
        <td><b>Colourscheme</b></td>
        <td>Catppuccin Mocha</td>
    </tr>
    <tr>
        <td><b>Font</b></td>
        <td>Iosevka Nerd Font</td>
    </tr>
    <tr>
        <td><b>Launcher</b></td>
        <td>Rofi</td>
    </tr>
    <tr>
        <td><b>Bar</b></td>
        <td>Polybar</td>
    </tr>
    <tr>
        <td><b>Compositor</b></td>
        <td>Picom</td>
    </tr>
</table>

## `📸` Screenshots

![base](https://github.com/cr-0w/kalipuccin/assets/59679082/48b5f3f7-71c3-4dd4-a37b-45549c7a2b2d)
![rofi](https://github.com/cr-0w/kalipuccin/assets/59679082/770764b1-a044-45d2-9591-dca85cdf2470)
![full](https://github.com/cr-0w/kalipuccin/assets/59679082/ae46989c-0515-47c7-8db4-fc2468b4ce7a)

## `💾` Installation

Simply `chmod +x install.sh` the installation script if it isn't already marked as executable and then just run it with `./install.sh`. 

```bash
crow@blackbird: ~/kalipuccin
ζ ›› chmod +x install.sh && ./install.sh
```

After successfully installing everything, make sure you reboot your system.

```bash
crow@blackbird: ~/kalipuccin
ζ ›› sudo reboot now
```

Once you reboot and you're in the login menu, you will have to select `bswpm` from the drop-down list and just log in to your brand new kalipuccin rice.

![image](https://github.com/cr-0w/kalipuccin/assets/59679082/147afc4a-5486-471b-ab76-a43dcd294756)

## `⌨️` Keyboard Shortcuts

Feel free to edit these in the `~/.config/sxhkd/sxhkdrc` file as you please. This is what's been comfortable for me.

<table>
    <tr>
        <td>Restart bspwm</td>
        <td><kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>r</kbd></td>
    </tr>
    <tr>
        <td>Open terminal</td>
        <td><kbd>Super</kbd> + <kbd>Enter</kbd></td>
    </tr>
    <tr>
        <td>Open launcher</td>
        <td><kbd>Super</kbd> + <kbd>Space</kbd></td>
    </tr>
    <tr>
        <td>Change workspace</td>
        <td><kbd>Super</kbd> + <kbd>1</kbd>, <kbd>2</kbd>, <kbd>3</kbd>, ..., <kbd>9</kbd> </td>
    </tr>
    <tr>
        <td>Send window to a workspace</td>
        <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd>, <kbd>2</kbd>, <kbd>3</kbd>, ..., <kbd>9</kbd> </td>
    </tr>
    <tr>
        <td>Close window</td>
        <td><kbd>Super</kbd> + <kbd>w</kbd></td>
    </tr>
    <tr>
        <td>Select window</td>
        <td><kbd>Super</kbd> + <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd></td>
    </tr>
    <tr>
        <td>Move window</td>
        <td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd></td>
    </tr>
    <tr>
        <td>Increase window size</td>
        <td><kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd></td>
    </tr>
    <tr>
        <td>Decrease window size</td>
        <td><kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>, <kbd>l</kbd></td>
    </tr>
</table>

## `❓` Why

Firstly, you might be asking why someone would even bother ricing an OS as bloated as Kali. Simple, I love to watch the world burn and if it means that you suffer alongside me, *even better*. Plus, ricing Debian/Ubuntu is (or at least when I was doing this, was) much harder than ricing an OS like Arch or something. So, as a challenge, I wanted to see if I could create a `r/unixporn`-ready rice for Kali, my beloathed.

## `💬` Notes

#### OVPN Support w/ Polybar

I've added the `tun0` interface IP, which is common for CTF platforms like [TryHackMe](https://tryhackme.com/) and [Hack The Box](https://app.hackthebox.com) in the bottom left of the polybar. After connecting to a VPN instance with `openvpn yourvpn.ovpn &`, you can run the <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>r</kbd> key combination to restart bspwm, which will now show your interface address. Once respawned, it will include the IP of your VPN instance. I'm certain this can be streamlined, so if you want to, you can come up with a way to do that. Or, classically, just have the IP in your `zsh`/`bash` prompt itself. If you want to add support for other interfaces, like `tap0` or something, you should copy the `vpn.ini` file in the polybar modules folder (`~/.config/polybar/crowpuccin/modules/vpn.ini`), and change the `interface` variable to the name of the interface that you want. Or, you could just change the interface name in the default file, it's up to you.

```bash
[module/vpn]
type = internal/network
interface = tun0 # change this, homie
interval = 1.0
...
```

#### Polybar

Now, the polybar that I have set up is a gross abomination of the amazing work of this repository: [polybar-collection](https://github.com/Murzchnvok/polybar-collection).

#### Neovim

I've left out my Neovim "rice" because while moving files for this godforsaken build, I ended up completely borking the text editor. I *might* update this repository with a neovim rice that I make for my new machine, but I wouldn't hold my breath. You're urged to rice Neovim by yourself, it's fun :)

## `📝` Todo
- Introduce various colour palettes like rose pine, nord, etc.
- Introduce the [cozette](https://github.com/slavfox/Cozette) bitmap font.
- Maybe add in some command-line arguments for modular installs or something.
