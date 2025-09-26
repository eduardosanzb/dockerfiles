# LazyVim Configuration

This is a migration of the original Packer-based Neovim configuration to LazyVim.

## Features

- Plugin management with lazy.nvim
- LSP support with Mason
- Treesitter syntax highlighting
- Telescope for fuzzy finding
- NvimTree file explorer
- Git integration with gitsigns
- Autocompletion with nvim-cmp
- And many more...

## Installation

1. Make sure you have Neovim 0.8+ installed
2. Clone this repository
3. Use stow to symlink the configuration:
   \`\`\`bash
   stow nvim-lazy -t ~/.config/nvim
   \`\`\`
4. Run Neovim and let lazy.nvim install the plugins:
   \`\`\`bash
   nvim
   \`\`\`

## Key Mappings

### General
- \`<Space>\` - Leader key
- \`<Tab>\` - Toggle NvimTree
- \`<leader><Tab>\` - Find current file in NvimTree

### Window Management
- \`<Space>h/j/k/l\` - Navigate windows
- \`<Space>we\` - Equalize window sizes
- \`<Space>ws\` - Swap window splits

### File Operations
- \`<Space>ff\` - Find files
- \`<Space>fg\` - Live grep
- \`<Space>fb\` - Find buffers
- \`<Space>fh\` - Find help

### LSP
- \`K\` - Hover documentation
- \`<Space>gd\` - Go to definition
- \`<Space>gi\` - Go to implementation
- \`<Space>gr\` - Find references
- \`<Space>ca\` - Code actions
- \`<Space>rn\` - Rename

### Git
- \`<Space>gs\` - Git status
- \`<Space>gc\` - Git commits
- \`<Space>gb\` - Git branches

### Commenting
- \`<Leader>/\` - Toggle comment

### Surround
- Uses default bindings: ys, cs, ds

### DAP
- \`<Space>du\` - Toggle DAP UI
- \`<Space>dc\` - Continue
- \`<Space>db\` - Toggle breakpoint
- \`<Space>dn\` - Step over
- \`<Space>di\` - Step into
- \`<Space>do\` - Step out

### Markdown
- \`<Space>md\` - Preview markdown with Glow

### Go
- \`<Space>rt\` - Run Go tests
