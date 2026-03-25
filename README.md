# Config structure

```
.
├── config
│  ├── autocmds.lua
│  ├── keymaps.lua
│  └── options.lua
├── ftplugin
├── init.lua
├── nvim-pack-lock.json
├── plugin
│  └── 00-colorscheme.lua
└── README.md
```

Note that the lua files under `plugin` (singular) are executed by default by Neovim, in alphabetical order.

## References

- vim.pack guide : https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack

- for "minimal" config inspiration, see https://github.com/radleylewis/nvim-lite with vim.pack
(in video: https://www.youtube.com/watch?v=lljs_7xB7Ps)

- another example of not-too-big config https://github.com/BreadOnPenguins/nvim/
