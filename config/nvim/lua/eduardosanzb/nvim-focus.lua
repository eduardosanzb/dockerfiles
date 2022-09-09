function FocusCurrentWindow()
    local ui = vim.api.nvim_list_uis()[1]
    local width = ui.width-5
    local height = ui.height-1
    local buf = vim.api.nvim_create_buf(true, true)

    local opts = {
        relative= 'editor',
        width= width,
        height= height,
        col= (ui.width/2) - (width/2),
        row= (ui.height/2) - (height/2),
        anchor= 'NW',
        border = 'rounded'
       }

    local myPath = vim.fn.expand('%:p')
    local win = vim.api.nvim_open_win(buf, 1, opts)
    local file_path = vim.api.nvim_get_runtime_file(myPath, false)[1]

    print(vim.inspect(myPath))
    vim.api.nvim_command(":edit" .. myPath)

end

return FocusCurrentWindow

