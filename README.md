# 🎮 Fastfetch-Pokemon

> Because staring at boring system info wasn't enough — now your terminal has opinions about which starter is best.

A setup that integrates **Fastfetch** with **pokimg** to display a random Pokémon sprite alongside your system information every time you open a terminal. You know, like a normal person.

---

<div style="display:flex;gap:16px;flex-wrap:wrap; height=500px; width=1000px; display:flex-column">


<img
  src="Showcase/demo.png"
  style="border-radius:1rem;width:1000px;max-width:100%;"
/>







</div>


---



---
## ⚙️ Installation

### 1. Clone the repo

```bash
git clone https://github.com/ayushgatla/Fastfetch-Pokemon.git
cd Fastfetch-Pokemon
chmod +x install.sh
```

### 2. Install Fastfetch

```bash
#fedora/red hat based
sudo dnf install fastfetch
# Ubuntu/Debian
sudo apt install fastfetch

# Arch (you already know)
sudo pacman -S fastfetch

# macOS
brew install fastfetch
```
3. Install
```bash
./install.sh
```
Uninstall
```bash
chmod +x uninstall.sh
./uninstall.sh
```

## 🗂️ Repo Structure

```
Fastfetch-Pokemon/
├── Showcase/        # Screenshots of the setup in action
├── fastfetch/       # Fastfetch config files
├── pokimg           # The Pokémon image rendering script
└── bashrc.txt       # Shell snippet to wire it all together
```

---

## Warning

- **Kitty** - use kitty as your terminal to experience without any issues
- if by any chance you dont want to use kitty then after installing be sure to change the kitty-direct logo-type to chafa

## 🐛 Troubleshooting

| Problem | Likely Cause | Fix |
|--------|-------------|-----|
| No image, just symbols | Terminal doesn't support image protocol | Switch to Kitty or iTerm2 |
| `pokimg: command not found` | Not in PATH | Move it to `/usr/local/bin/` |
| Fastfetch not found | Not installed | Install it (see above) |
| Image and text overlapping weirdly | Config needs tweaking | Adjust spacing in fastfetch config |
| It works but Mewtwo never shows up | Pure statistical tragedy | Keep opening terminals |

---

## 🙏 Credits

- [Fastfetch](https://github.com/fastfetch-cli/fastfetch) — for being a genuinely great neofetch replacement
- [pokimg](https://github.com/FuzzyGrim/pokimg) (or whichever flavor) — for making terminals inexplicably better
- You — for having the taste to want Pokémon in your terminal

---

*"It's not procrastination if your terminal looks sick while you do it."*


