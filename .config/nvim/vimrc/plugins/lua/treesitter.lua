local languages = {
    "bash",
    "go",
    "gomod",
    "html",
    "java",
    "javascript",
    "svelte",
    "json",
    "lua",
    "yaml",
    "clojure",
    --"gotmpl",
    "vue",
    "graphql"
}

local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
    ensure_installed = languages,
    highlight = { enable = languages },
    indent = { enable = languages },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    incremental_delection = {
        enable = languages,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    },
    refactor = {
        highlight_definitions = { enable = languages },
        smart_rename = {
            enable = languages,
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = languages,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    }
}
