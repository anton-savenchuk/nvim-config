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

        --Web Development
        "prettier",
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "emmet-language-server",

        -- Python
        "pyright",
        "black",
        "flake8",
        "ruff",

        -- Yaml
        "yaml-language-server",

        -- Docker
        "docker_compose_language_service",
        "dockerls",
    },
}
