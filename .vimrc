" Root directory
let s:DOTFILES_ROOT = system('echo -n $DOTFILES_ROOT')
let $VIM_DIR = s:DOTFILES_ROOT . '/vim'

" General
source $VIM_DIR/general.vim

" Layout
source $VIM_DIR/layout.vim

" Input
source $VIM_DIR/input.vim

" Keybind
source $VIM_DIR/keybind.vim

" Plugin
source $VIM_DIR/plugin.vim

" Plugin setting
source $VIM_DIR/plugin_setting.vim
