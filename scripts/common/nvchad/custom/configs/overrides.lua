local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "bash",
    "csv",
    "dockerfile",
    "fish",
    "go",
    "hcl",
    "json",
    "markdown",
    "nix",
    "python",
    "sql",
    "terraform",
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- bash
    "bash-language-server",

    -- golang
    "golangci-lint-langserver",
    "gopls",

    -- kubernetes
    "helm-ls",

    -- nix
    "nil",

    -- python
    "black",
    "pylyzer",

    -- terraform
    "terraform-ls",
    "tflint",

    -- markdown
    "marksman",

    -- json/yaml
    "spectral-language-server",
    "yaml-language-server",

    -- docker
    "docker-compose-language-service",
    "dockerfile-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
