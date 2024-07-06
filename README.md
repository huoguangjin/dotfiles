# dotfiles

My personal dotfiles.

## Features

### IPython

[Config](.ipython) for [IPython](https://ipython.org/)

> see [setup_python.sh](setup/setup_python.sh)

### Ranger

[Config](.ranger) for [ranger](https://ranger.fm/)

> see [setup_python.sh](setup/setup_python.sh)

### AppleScript and Apps

1. Run [setup_applescript.sh](setup/setup_applescript.sh) to create a copy of Apps in [local folder](local).
2. Right-click on the toolbar in Finder, select 'Customize Toolbar', and drag the apps onto the toolbar

- [cmd.app](applescript/cmd.app): open iTerm2 in Finder
- [diff.app](applescript/diff.app): open Sublime Merge in Finder
- [duplicate.app](applescript/duplicate.app): open new Finder window in the same directory
- [st.app](applescript/st.app): open Sublime Text in Finder
- [vsc.app](applescript/vsc.app): open Visual Studio Code in Finder

### AutoHotkey

[AutoHotkey](https://www.autohotkey.com/) scripts on windows

### bin

Store executable files in [bin](bin)

- [$](bin/$): execute the following command
- [cht](bin/cht): curl https://cht.sh/:cht.sh > bin/cht && chmod +x bin/cht
- [run](bin/run): echo and execute the following command
- [alert](bin/alert): show notification in iTerm2

### Hammerspoon

[Hammerspoon](https://www.hammerspoon.org/) scripts on macOS

- [launcher.lua](hammerspoon/ext/launcher.lua): key bindings to launch or focus Apps
- [modal_context.lua](hammerspoon/ext/modal_context.lua): a simple modal menu util
- [puzzle.lua](hammerspoon/ext/puzzle.lua): window layout management
- [reload.lua](hammerspoon/ext/reload.lua): watch hammerspoon config files and reload automatically

### IME

Part of my [IME config files](ime)

### iterm2

Open iTerm2 settings > General > Settings > Load settings from a custom folder or URL

[iterm2 config](iterm/com.googlecode.iterm2.plist)

### Karabiner-Elements

My [keymap config](karabiner) for [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

> see [setup_karabiner.sh](setup/setup_karabiner.sh)

### Keyboard Layout

My pure ASCII keyboard layout named [raindrop](keylayout/raindrop.keylayout), without Roman letters, phonetic symbols,
or any other escape characters.

> see [setup_keylayout.sh](setup/setup_keylayout.sh)

### Setup scripts

[Scripts](setup) to set up config, Useful when I get a new computer

### Vim

I love Jetbrains IDE, but sometimes Vim is also good.

- [basic.vim](vim/basic.vim): basic settings
- [map.vim](vim/map.vim): keymap settings
- [plugin.vim](vim/plugin.vim): plugins
- [wsl.vim](vim/wsl.vim): additional settings on WSL

> see [setup_vim.sh](setup/setup_vim.sh)
### Git

- [.gitconfig](.gitconfig)
- [.gitignore_global](.gitignore_global)

> see [setup_git.sh](setup/setup_git.sh), [setup_github.sh](setup/setup_github.sh)

### ripgrep

[Config](.ripgreprc) for [ripgrep](https://github.com/BurntSushi/ripgrep)

### ZSH

My zsh config powered by [zinit](https://github.com/zdharma-continuum/zinit), perhaps it will be migrated
to [Z-Shell](https://github.com/z-shell/zi)

- [.zshrc](.zshrc), [init.zsh](init.zsh): entry files
- [flag.sh](flag.sh): variables for cli tools
- [alias.sh](alias.sh): useful abbreviations
- [env.sh](env.sh): environment variables
- [fun.sh](fun.sh): shell functions
- [fzf_fun.sh](fzf_fun.sh): fzf functions, see [setup_fzf.sh](setup/setup_fzf.sh)
- [bind.zsh](bind.zsh): my key bindings
- [breeze.zsh-theme](breeze.zsh-theme): A simple zsh prompt

> see [setup_zsh.sh](setup/setup_zsh.sh)

### WSL

[wsl.sh](wsl.sh)

### macOS Settings

- [setup_macos.sh](setup/setup_macos.sh)
- [setup_macos_app.sh](setup/setup_macos_app.sh)
- [setup_macos_preferences.txt](setup/setup_macos_preferences.txt)

## TODO

- Migrate to [Z-Shell](https://github.com/z-shell/zi)
- Archive configurations for more applications: uTools, TamperMonkey and others.
