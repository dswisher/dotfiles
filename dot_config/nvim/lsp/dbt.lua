
-- See https://github.com/j-clemons/dbt-language-server

return {
    cmd = { "dbt-language-server" },
    filetypes = { "sql", "yaml" },
    -- root_dir = require'lspconfig'.util.root_pattern("dbt_project.yml"),
    root_markers = { 'dbt_project.yml' },
}

