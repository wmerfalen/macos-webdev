# macos-webdev
A repository to hold all mac OS web development configurations.

# Enabling font ligatures in VS Code
```
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
```
## Then, in vs code, add this to your `settings.json`
```
    "editor.fontFamily": "Fira Code", 
    "editor.fontLigatures": true,
```
# git autocomplete (for bash or zsh)
[https://www.macinstruct.com/tutorials/how-to-enable-git-tab-autocomplete-on-your-mac/](https://www.macinstruct.com/tutorials/how-to-enable-git-tab-autocomplete-on-your-mac/)

# Alternate terminal choices
[iTerm 2](https://iterm2.com/)

# Virtual machines
- [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
- [Docker](https://docs.docker.com/desktop/mac/install/)
- [QEMU](https://www.qemu.org/download/#macos)
    - Also available via `brew`
        - `brew install qemu`
        
# One-stop shop for lots of common utilities
- [Webi](https://webinstall.dev)
  - Effortlessly install developer tools with easy-to-remember URLs.
