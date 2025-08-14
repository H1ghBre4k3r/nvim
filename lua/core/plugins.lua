-- Plugin loader for vim.pack structure similar to LazyVim
local M = {}

-- Function to load all plugin specs from plugins directory
function M.load_plugins()
  local plugins = {}
  local plugin_configs = {}
  local plugin_dir = vim.fn.stdpath 'config' .. '/lua/plugins'

  -- Check if plugins directory exists
  if vim.fn.isdirectory(plugin_dir) == 0 then
    vim.notify('Plugins directory not found: ' .. plugin_dir, vim.log.levels.WARN)
    return {}, {}
  end

  -- Get all lua files in plugins directory
  local files = vim.split(vim.fn.glob(plugin_dir .. '/*.lua'), '\n')

  for _, file in ipairs(files) do
    if file ~= '' then
      -- Extract module name from file path
      local module_name = file:match '.*/(.-)%.lua$'
      if module_name and module_name ~= 'init' then
        local plugin_spec = require('plugins.' .. module_name)

        -- Handle different return types
        if type(plugin_spec) == 'table' then
          -- Helper function to process a single plugin spec
          local function process_plugin(spec)
            if type(spec) == 'table' and spec.src then
              local config_fn = spec.config

              -- Create a shallow copy instead of deepcopy to preserve functions
              local spec_copy = {}
              for k, v in pairs(spec) do
                if k ~= 'config' then
                  spec_copy[k] = v
                end
              end

              table.insert(plugins, spec_copy)
              if config_fn and type(config_fn) == 'function' then
                local plugin_name = spec.name
                if not plugin_name and spec.src then
                  -- Try multiple patterns to extract plugin name
                  plugin_name = spec.src:match '.*/(.-)%.git$' or spec.src:match '.*/(.-)$' or spec.src:match '([^/]+)$'
                end
                if plugin_name and plugin_name ~= '' then
                  plugin_configs[plugin_name] = config_fn
                end
              end
            end
          end

          -- Check if this is a single plugin spec (has src field) or array of plugin specs
          if plugin_spec.src then
            -- Single plugin spec
            process_plugin(plugin_spec)
          else
            -- Assume it's an array of plugin specs
            for _, spec in ipairs(plugin_spec) do
              process_plugin(spec)
            end
          end
        end
      end
    end
  end

  return plugins, plugin_configs
end

-- Load and add all plugins
function M.setup()
  local plugins, configs = M.load_plugins()

  if #plugins > 0 then
    vim.pack.add(plugins)

    -- Use VimEnter to ensure plugins are loaded
    vim.api.nvim_create_autocmd('VimEnter', {
      once = true,
      callback = function()
        vim.schedule(function()
          for plugin_name, config_fn in pairs(configs) do
            local ok, err = pcall(config_fn)
            if not ok then
              vim.notify('Error configuring plugin ' .. plugin_name .. ': ' .. err, vim.log.levels.ERROR)
            end
          end
        end)
      end,
    })
  end
end

return M
