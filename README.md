# macos-webdev
A repository to hold all mac OS web development configurations. 
This document is biased towards the following toolsets: vim, bash, git

# Editor preferences
## Enabling font ligatures in VS Code
```bash
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
```
## Then, in vs code, add this to your `settings.json`
```json
    "editor.fontFamily": "Fira Code", 
    "editor.fontLigatures": true,
```

## vim as default git editor
```bash
git config --global core.editor $(which vim)
```

# git autocomplete
## For bash
```bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
# add this to your .bashrc:
# start snip
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# end snip

chmod +x ~/.git-completion.bash

# start a new terminal here
```

For more info: [MacInstruct](https://www.macinstruct.com/tutorials/how-to-enable-git-tab-autocomplete-on-your-mac/)


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
