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
- python
- NerdFont(Cousine Nerd Font)

_上述依赖不要忘记配置对应系统的环境变量，尤其是Windows_

## 安装
类Unix系统克隆至~/.config

Windows克隆至AppData/Local

配置nvim别名
``` shell
if type nvim > /dev/null 2>1&; then
    vi=‘nvim'
fi
```

_Windows使用需要Cygwin环境_

## 文件结构
```
├─ftplugin
├─lua
│  ├─base
│  ├─configs
│  │  ├─basic
│  │  ├─complete
│  │  ├─editor
│  │  ├─lsp
│  │  │  └─configurations
│  │  ├─theme
│  │  └─views
│  └─utils
│      └─plugins
├─snippets
└─workspace-config-templates
```
- base文件夹存放基础配置，vim设置settings，按键映射mapping，插件启动选项options
- 插件管理器使用[Lazy]，详细设置以及插件安装脚本lazy.lua，对应插件作用见plugins.lua

## 使用
### 语言服务
[mason]语言服务包管理器，由于不同系统和不同的开发语言，并没有添加默认安装的语言服务。

[treesitter]对应也没有默认安装的语言支持

对应不同项目等，使用.nvim.lua文件覆盖全局配置

[telescope-fzf-native]插件需要手动编译

## 自定义工作区
需要在工程的根目录创建.nvim.lua文件，这个文件的生命周期是在neovim加载完之后，非懒加载的插件如要改配置需要添加相应的reload方法，详情见.nvim.unity.lua文件如何处理的nvim-tree插件

## TODO
上传目前不同语言项目的.nvim.lua模版文件
- 已上传
    - typescript
    - csharp
    - unity

需要加入Inlay-Hints吗？

需要支持DAP吗？

## Windows常见问题
### nvim-treesitter
- 在win使用默认配置下载编译使用时，会出现编译后的.so文件无法正常运行问题，详细解决方案见<https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support>




[askfiy]: https://github.com/askfiy/nvim
[LazyVim]: https://github.com/LazyVim/LazyVim
[Lazy]: https://github.com/folke/lazy.nvim
[mason]: https://github.com/williamboman/mason.nvim
[treesitter]: https://github.com/nvim-treesitter/nvim-treesitter
[telescope-fzf-native]: https://github.com/nvim-telescope/telescope-fzf-native.nvim
