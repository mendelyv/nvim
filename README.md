# Neovim 配置
## 简介
改编自[askfiy/nvim][askfiy]的Neovim配置，拷贝部分工具代码，删掉于我冗余的插件，调整了快捷键，目前正在长期使用中。这个仓库不会更新成为[LazyVim]等那种开箱即用的配置，纯粹是我个人使用。
## 依赖
- Neovim发行版
- git
- Lua
- nodejs
- c编译器
- ripgrep

_上述依赖不要忘记配置对应系统的环境变量，尤其是Windows_

## 安装
克隆至~/.config

_Windows使用需要Cygwin环境_

## 文件结构
```
├── ftplugin
├── init.lua
├── lua
│   ├── base
│   │   ├── mapping.lua
│   │   ├── options.lua
│   │   ├── plugins.lua
│   │   └── setting.lua
│   ├── configs
│   │   ├── basic
│   │   │   ├── nvim-notify.lua
│   │   │   └── which-key.lua
│   │   ├── complete
│   │   │   ├── luasnip.lua
│   │   │   └── nvim-cmp.lua
│   │   ├── editor
│   │   │   ├── aerial.lua
│   │   │   ├── comment.lua
│   │   │   ├── flash.lua
│   │   │   ├── hlchunk.lua
│   │   │   ├── neogen.lua
│   │   │   ├── nvim-spectre.lua
│   │   │   ├── nvim-tree.lua
│   │   │   ├── nvim-treesitter.lua
│   │   │   ├── surround.lua
│   │   │   ├── symbols-outline.lua
│   │   │   ├── telescope.lua
│   │   │   ├── todo-comments.lua
│   │   │   └── vim-illuminate.lua
│   │   ├── lsp
│   │   │   ├── configurations
│   │   │   ├── fidget.lua
│   │   │   ├── formatter.lua
│   │   │   ├── mason.lua
│   │   │   ├── nvim-lspconfig.lua
│   │   │   └── nvim-navic.lua
│   │   ├── theme
│   │   │   └── everforest.lua
│   │   └── views
│   │       ├── bufferline.lua
│   │       ├── lualine.lua
│   │       ├── nvim-colorizer.lua
│   │       └── persisted.lua
│   └── utils
│       ├── common.lua
│       ├── icons.lua
│       ├── keymap.lua
│       ├── path.lua
│       └── plugins
│           └── lazy.lua
└── snippets
```
- base文件夹存放基础配置，vim设置settings，按键映射mapping，插件启动选项options
- 插件管理器使用[Lazy]，详细设置以及插件安装脚本lazy.lua，对应插件作用见plugins.lua

## 使用
### 语言服务
[mason]语言服务包管理器，由于不同系统和不同的开发语言，并没有添加默认安装的语言服务。

[treesitter]对应也没有默认安装的语言支持

对应不同项目等，使用.nvim.lua文件覆盖全局配置

[telescope-fzf-native]插件需要手动编译

## TODO
上传目前不同语言项目的.nvim.lua模版文件

需要加入Inlay-Hints吗？

需要支持DAP吗？

## Windows常见问题
### nvim-treesitter
- 在win11使用默认配置下载编译使用时，会出现编译后的.so文件无法正常运行问题，详细解决方案见<https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support>




[askfiy]: https://github.com/askfiy/nvim
[LazyVim]: https://github.com/LazyVim/LazyVim
[Lazy]: https://github.com/folke/lazy.nvim
[mason]: https://github.com/williamboman/mason.nvim
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[telescope-fzf-native]: https://github.com/nvim-telescope/telescope-fzf-native.nvim
