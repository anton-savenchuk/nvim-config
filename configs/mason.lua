return {
  ui = {
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = false,
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },
  ensure_installed = {
    -- Lua
    "lua-language-server",
    "vim-language-server",
    "stylua",

    -- Python
    "pyright",
  },
}
