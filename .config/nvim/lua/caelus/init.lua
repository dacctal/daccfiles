local M = {};

local colors = {
  bg        = "#0f0f0f",
  gray0     = "#141514";
  gray1     = "#1e1f1e";
  gray2     = "#272a28";
  gray3     = "#3b403c";
  gray4     = "#585f5b";
  gray5     = "#6c756f";
  gray6     = "#888e7b";
  gray7     = "#9a9c8b";
  gray8     = "#b6b69a";
  gray9     = "#d9cdb5";
  gray10    = "#e3d6c9";
  fg        = "#f4decd",
  red       = "#f16e65";
  lred      = "#ef968f";
  orange    = "#ef934d";
  yellow    = "#efbf71";
  green     = "#7ec97e";
  lgreen    = "#a4daa4";
  cyan      = "#7ec9a3";
  lcyan     = "#abd4bf";
  blue      = "#71b4d6";
  lblue     = "#b0d4e8";
  magenta   = "#e28dc6";
  lmagenta  = "#ebadd6";
}

function M.colorscheme()
  vim.cmd("highlight clear")
  vim.cmd("syntax reset")

  vim.o.background = "dark";
  vim.g.colors_name = "caelus";

  local set = vim.api.nvim_set_hl

  -- ui
  set(0, "Normal",        { fg = colors.fg, bg = colors.bg })
  set(0, "NormalFloat",   { fg = colors.fg, bg = colors.bg })
  set(0, "FloatBorder",   { fg = colors.fg, bg = colors.bg })
  set(0, "CursorLine",    { bg = colors.gray2 })
  set(0, "Visual",        { bg = colors.gray3 })
  set(0, "Search",        { fg = colors.bg, bg = colors.orange })
  set(0, "IncSearch",     { fg = colors.bg, bg = colors.orange })
  set(0, "StatusLine",    { bg = colors.gray2 })
  set(0, "StatusLineNC",  { bg = colors.orange })
  set(0, "VertSplit",     { fg = colors.gray8 })
  set(0, "WinSeparator",  { fg = colors.gray8 })
  set(0, "LineNr",        { fg = colors.gray6 })
  set(0, "CursorLineNr",  { fg = colors.orange, bold = true })
  set(0, "SignColumn",    { bg = colors.bg })
  set(0, "Folded",        { fg = colors.gray8, bg = colors.gray3 })

  -- popup
  set(0, "Pmenu",         { fg = colors.fg, bg = colors.gray10 })
  set(0, "PmenuSel",      { fg = colors.bg, bg = colors.orange })
  set(0, "PmenuSbar",     { bg = colors.gray10 })
  set(0, "PmenuThumb",    { bg = colors.orange })

  -- syntax
  set(0, "Comment",       { fg = colors.gray8, italic = true })
  set(0, "Constant",      { fg = colors.magenta })
  set(0, "String",        { fg = colors.green })
  set(0, "Identifier",    { fg = colors.blue })
  set(0, "Function",      { fg = colors.yellow })
  set(0, "Statement",     { fg = colors.red })
  set(0, "Type",          { fg = colors.cyan, bold = true })
  set(0, "Special",       { fg = colors.yellow })
  set(0, "Error",         { fg = colors.red, bold = true })
  set(0, "Keyword",       { fg = colors.red })
  set(0, "Variable",      { fg = colors.fg })
  set(0, "TSKeyword",     { fg = colors.red })
  set(0, "TSFunction",    { fg = colors.yellow })
  set(0, "TSVariable",    { fg = colors.fg })
  set(0, "TSType",        { fg = colors.cyan })
  
  if package.loaded['lualine'] then
    require('lualine').setup({
      options = { theme = 'caelus' },
    })
  end

end

return M
