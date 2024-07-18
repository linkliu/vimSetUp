--一个精简化的fzf插件，本地编译
return { 
    'nvim-telescope/telescope-fzf-native.nvim',
    build = function(plugin)
        local obj = vim.system({'cmake', '-S.', '-Bbuild', '-DCMAKE_BUILD_TYPE=Release'}, {cwd = plugin.dir}):wait()
        if obj.code ~= 0 then error(obj.stderr) end
        obj = vim.system({'cmake', '--build', 'build', '--config', 'Release'}, {cwd = plugin.dir}):wait()
        if obj.code ~= 0 then error(obj.stderr) end
        obj = vim.system({'cmake', '--install', 'build', '--prefix', 'build'}, {cwd = plugin.dir}):wait()
        if obj.code ~= 0 then error(obj.stderr) end
      end
}
