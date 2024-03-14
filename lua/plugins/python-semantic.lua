return {
  "wookayin/semshi",
   build = ":UpdateRemotePlugins",
   version = "*",  -- Recommended to use the latest release
   init = function ()
    vim.g['semshi#excluded_hl_groups'] = {
      'local',
      'global',
      'unresolved'
    }
    vim.g['semshi#simplify_markup'] = false
    vim.g['semshi#error_sign'] = false
   end
}
