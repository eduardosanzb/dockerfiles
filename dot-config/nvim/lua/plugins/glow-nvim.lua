local status,glow = pcall(require, 'glow')

if not status then
  return
end

glow.setup({
  pager = false,
  width = 240,
})
