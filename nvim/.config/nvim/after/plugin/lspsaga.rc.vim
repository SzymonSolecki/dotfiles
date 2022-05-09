lua << EOF

local saga = require('lspsaga')

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
  code_action_icon = ' ',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
 },
}

EOF

nnoremap <silent> <A-k> <cmd>Lspsaga diagnostic_jump_prev<cr>
nnoremap <silent> <A-j> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent><leader>cc <cmd>Lspsaga show_line_diagnostics<cr>

nnoremap <silent> <C-u> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>
nnoremap <silent> <C-d> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>

nnoremap <silent>K <cmd>Lspsaga hover_doc<cr>

nnoremap <silent><leader>rn <cmd>Lspsaga rename<cr>

nnoremap <silent> <leader>gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
"nnoremap <silent> <leader>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

nnoremap <silent><leader>ca <cmd>Lspsaga code_action<cr>
vnoremap <silent><leader>ca :<c-u>Lspsaga range_code_action<cr>

nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
