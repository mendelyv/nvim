local M = {}

M.g = {
  -- 设置leader键
  mapleader = " ",
}

M.opt = {
  -- 状态栏显示光标的当前位置和文件信息
  ruler = false,
  -- 是否在状态栏上显示当前的编辑模式
  showmode = false,
  -- 是否使用交换文件
  swapfile = false,
  -- 设置窗口旁边显示行标记的列
  signcolumn = "yes:1",

  -- 自动完成（Autocompletion）的行为和显示方式
  -- menu: 显示自动完成菜单，以便在自动完成时选择匹配项
  -- menuone: 如果只有一个匹配项，自动完成菜单也会显示，但会立即进行完成（不需要手动选择）
  -- noselect: 自动完成时不会选择第一个匹配项，除非手动选择
  -- longest: 自动完成时将自动选择最长的公共部分，而不是显示完整的候选项
  -- preview: 在菜单中预览当前选择的匹配项的信息
  -- noinsert: 自动完成时不会立即插入匹配项，除非手动选择
  completeopt = "menuone,noselect",

  -- 设置弹出菜单（Popup Menu）的最大高度
  pumheight = 15,
  -- 设置在插入模式之外的操作之后，自动保存文件的时间间隔。这个选项的作用是控制 Vim 在非插入模式下自动保存文件的频率。
  updatetime = 1000,
  -- 设置键盘映射的响应时间阈值
  timeoutlen = 500,
  -- 启用在支持真彩色的终端中使用真彩色
  termguicolors = true,
  -- 是否高亮显示当前光标所在的行
  cursorline = true,
  -- 是否高亮显示当前光标所在的列
  cursorcolumn = false,
  -- 设置行号（行标）显示的宽度
  numberwidth = 1,

  -- 设置是否开启行号（行标）
  number = true,
  -- 设置是否开启相对行号（行标）
  relativenumber = true,
  -- 设置在光标接近屏幕顶部或底部时，文本内容滚动的行数偏移量
  scrolloff = 10,
  -- 启用或禁用鼠标支持的模式
  mouse = "",
  -- 显示不可见字符（invisible characters）的设置
  list = true,

  -- 设置启用拼写检查功能
  -- spell = true,
  -- 设置拼写检查的语言或拼写词典
  -- spelllang = "en_us,cjk",

  -- 如果同时启用了 ignorecase 和 smartcase，那么当你搜索时，如果搜索内容中包含大写字母，Vim 将对大小写敏感；如果搜索内容全为小写字母，Vim 将忽略大小写
  -- 用于控制搜索时是否忽略大小写
  ignorecase = true,
  -- 智能忽略大小写
  smartcase = true,
  -- 根据当前打开文件的内容和扩展名来设置自动识别的文件类型
  filetype = "plugin",

  -- 设置折叠（fold）的方式
  -- manual: 手动折叠。你可以使用 Vim 的折叠命令手动创建、打开和关闭折叠块。例如，使用 zf 命令创建折叠，使用 zo 命令打开折叠，使用 zc 命令关闭折叠
  -- indent: 缩进折叠。Vim 会根据代码的缩进级别自动创建折叠块。这对于类似 Python 这样的缩进敏感语言特别有用
  -- expr: 表达式折叠。你可以定义一个 Vim 表达式来决定哪些行应该属于一个折叠块
  -- syntax: 语法折叠。Vim 使用当前文件的语法文件来决定哪些部分应该被折叠。这对于程序源代码文件尤其有用
  -- diff: 比较折叠。Vim 可以根据当前文件与另一个文件的差异来设置折叠
  -- marker: 标记折叠。Vim 使用预先设置的标记（marker）来定义折叠块的范围
  foldmethod = "indent",
  -- 折叠级别的配置选项，用于控制哪些折叠块应该被显示或隐藏
  foldlevel = 100,
  -- 设置初始折叠级别。该选项决定了打开文件时代码的折叠状态
  foldlevelstart = 99,
  -- 设置显示折叠标识列的宽度
  foldcolumn = "0",
  -- 设置是否使用系统剪贴板（Clipboard）来进行复制和粘贴操作，即使用匿名寄存器
  clipboard = "unnamedplus",
  -- 控制智能缩进（Smart Indentation）的行为
  smartindent = true,
  -- 定义识别单词的字符集
  iskeyword = "@,48-57,_,192-255",
  -- 控制状态栏的显示方式
  laststatus = 3,
  -- 视觉换行
  wrap = true,
  -- 是否启用按单词wrap换行
  linebreak = true,
  -- wrap换行提示符
  showbreak = "↪",
  -- 设置特定显示元素的替代字符
  fillchars = "eob: ",
  -- 设置当前文件的字符编码（character encoding）
  fileencodings = "ucs-bom,utf-8,gbk,big5,gb18030,latin1",

  -- 控制会话（session）管理的行为和设置
  -- blank: 保存没有名字的缓冲区（没有与文件关联的缓冲区）
  -- buffers: 保存缓冲区列表，包括没有保存到磁盘的缓冲区
  -- curdir: 保存当前工作目录
  -- folds: 保存折叠信息
  -- globals: 保存全局变量和选项设置
  -- help: 保存帮助窗口的状态
  -- localoptions: 保存局部选项设置
  -- tabpages: 保存标签页信息
  -- unix: 使用 UNIX 风格的文件路径
  sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,globals",
  -- 分屏时是否自动调整窗口尺寸
  equalalways = false,
  -- 分屏窗口对齐方式
  eadirection = "ver",
  -- 允许调用自定义配置.nvim.lua
  exrc = true,
  -- 关闭shada
  -- shada = "",
  -- shadafile = "NONE",
}

for prefix, tbl in pairs(M) do
  for key, value in pairs(tbl) do
    vim[prefix][key] = value
  end
end

return M
