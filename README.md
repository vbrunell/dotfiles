# dotfiles

## My Vim

The .vimrc contains my lightweight customized vim configuration.  

It contains some useful plugins (NERDTree, CtrlP, YCM) and some handy settings and key mappings.

It will give you directory navigation tools, autocompletion, an updated status bar, and more.

<h1>Dependencies</h1>

You'll need vim-plug.  To install it, open a terminal window and execute:

`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \`
<br>`https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

For Neovim or Windows users, instructions are available here: https://github.com/junegunn/vim-plug

<h1>Installation</h1>

Installing this configuration is easy:

<ul>
  <li>Clone this repository and copy the .vimrc file to your home directory.
  <li>Open vim.
  <li>The plugins should install automagically.  
</ul>

All done!

(If you want to use YCM, read the next section.)

## YouCompleteMe Dependencies

To install and use YCM, you'll need cmake.  In a terminal execute `sudo apt-get install cmake`

Once you've done that, navigate to `~/.vim/plugged/YouCompleteMe` and execute  `install.py`

### C-family Support

In order to use YCM autocompletion with C and C++, you will need clang v3.8 or later.
<br>In a terminal window execute: `sudo apt-get install libclang-dev`

Then navigate to `~/.vim/plugged/YouCompleteMe` and execute  `install.py --clang-completer`

You'll also need to define compilation flags for YCM to reference for each project.

Information on how to achieve this can be found here: 
https://github.com/Valloric/YouCompleteMe/blob/master/README.md#c-family-semantic-completion

To get up and running fast:
<ul>
<li>Create a .ycm_extra_conf.py Python script in your project's root directory.</li>
<li>Add this to function it:</li></ul>
```sh
def FlagsForFile( filename, **kwargs ):
  return {
    'flags': [ '-x', 'c++', '-Wall', '-Wextra', '-Werror' ],
    }
```
<ul><li>Save and close.</li></ul>

You should now have autocompletion for your C and C++ projects.
