return {
  "tikhomirov/vim-glsl",
  ft="glsl",
  init = function ()
    vim.cmd[[autocmd! BufNewFile,BufRead *.glsl set ft=glsl]]
  end
}
