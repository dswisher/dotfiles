
-- Use the zls installed by zvm. Keep it matched to the active Zig version.

return {
    cmd = { 'zls' },
    filetypes = { 'zig', 'zir' },
    root_markers = { 'build.zig', 'build.zig.zon', '.git' },
    settings = {
        zls = {
            enable_build_on_save = true,
            warn_style = true,
        },
    },
}
