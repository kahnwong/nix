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

    -- golang
    "golangci_lint_ls", "gopls",

    -- kubernetes
    "helm_ls",

    -- nix
    "nixd",

    -- python
    "pylyzer",

    -- terraform
    "terraform_lsp",
    "terraformls",
    "tflint",

    -- markdown
    "marksman",

    -- json/yaml
    "spectral",
    "yamlls",

    -- docker
    "docker_compose_language_service",
    "dockerls",
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
