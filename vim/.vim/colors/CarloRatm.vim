hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "CarloRatm"

set bg&


" cursor line and column
hi ColorColumn      ctermfg=NONE    ctermbg=15    cterm=NONE
hi CursorColumn     ctermfg=NONE    ctermbg=15    cterm=NONE
hi CursorLine       ctermfg=NONE    ctermbg=15    cterm=NONE
hi CursorLineNr     ctermfg=1       ctermbg=15    cterm=NONE
hi LineNr           ctermfg=8       ctermbg=NONE  cterm=NONE


hi TabLineFill      ctermfg=6       ctermbg=1    cterm=NONE
hi TabLine          ctermfg=6       ctermbg=1    cterm=NONE
hi TabLineSel       ctermfg=6       ctermbg=NONE    cterm=NONE
hi Comment          ctermfg=6       ctermbg=NONE    cterm=NONE
hi Normal           ctermfg=6       ctermbg=NONE    cterm=NONE
hi Conditional      ctermfg=6       ctermbg=NONE    cterm=NONE
hi Keyword          ctermfg=6       ctermbg=NONE    cterm=NONE
hi Label            ctermfg=6       ctermbg=NONE    cterm=NONE
hi Operator         ctermfg=6       ctermbg=NONE    cterm=NONE
hi Identifier       ctermfg=6       ctermbg=NONE    cterm=NONE
hi Statement        ctermfg=6       ctermbg=NONE    cterm=NONE
hi Underlined       ctermfg=6       ctermbg=NONE    cterm=NONE
hi Number           ctermfg=6       ctermbg=NONE    cterm=NONE
hi String           ctermfg=6       ctermbg=NONE    cterm=NONE
hi Boolean          ctermfg=6       ctermbg=NONE    cterm=NONE
hi Include          ctermfg=6       ctermbg=NONE    cterm=NONE
hi StorageClass     ctermfg=6       ctermbg=NONE    cterm=NONE
hi Function         ctermfg=6       ctermbg=NONE    cterm=NONE
hi Type             ctermfg=6       ctermbg=NONE    cterm=NONE
hi Constant         ctermfg=6       ctermbg=NONE    cterm=NONE
hi Special          ctermfg=6       ctermbg=NONE    cterm=NONE
hi PreProc          ctermfg=6       ctermbg=NONE    cterm=NONE
hi Error            ctermfg=6       ctermbg=NONE    cterm=NONE
hi Repeat           ctermfg=6       ctermbg=NONE    cterm=NONE
hi VertSplit        ctermfg=6       ctermbg=NONE    cterm=NONE
hi IncSearch        ctermfg=6       ctermbg=NONE    cterm=NONE
hi Search           ctermfg=6       ctermbg=NONE    cterm=NONE
hi Visual           ctermfg=6       ctermbg=NONE    cterm=NONE
hi NonText          ctermfg=6       ctermbg=NONE    cterm=NONE
hi MatchParen       ctermfg=6       ctermbg=NONE    cterm=NONE
hi VisualNOS        ctermfg=6       ctermbg=NONE    cterm=NONE
hi MatchParen       ctermfg=6       ctermbg=NONE    cterm=NONE
hi StatusLine       ctermfg=6       ctermbg=NONE    cterm=NONE
hi StatusLineNC     ctermfg=6       ctermbg=NONE    cterm=NONE
hi Directory        ctermfg=6       ctermbg=NONE    cterm=NONE
hi ErrorMsg         ctermfg=6       ctermbg=NONE    cterm=NONE
hi MoreMsg          ctermfg=6       ctermbg=NONE    cterm=NONE
hi ModeMsg          ctermfg=6       ctermbg=NONE    cterm=NONE
hi SpecialKey       ctermfg=6       ctermbg=NONE    cterm=NONE
hi Question         ctermfg=6       ctermbg=NONE    cterm=NONE
hi Title            ctermfg=6       ctermbg=NONE    cterm=NONE
hi WarningMsg       ctermfg=6       ctermbg=NONE    cterm=NONE
hi WildMenu         ctermfg=6       ctermbg=NONE    cterm=NONE
hi Folded           ctermfg=6       ctermbg=NONE    cterm=NONE
hi FoldColumn       ctermfg=6       ctermbg=NONE    cterm=NONE
hi DiffAdd          ctermfg=6       ctermbg=NONE    cterm=NONE
hi DiffChange       ctermfg=6       ctermbg=NONE    cterm=NONE
hi DiffDelete       ctermfg=6       ctermbg=NONE    cterm=NONE
hi DiffText         ctermfg=6       ctermbg=NONE    cterm=NONE
hi SignColumn       ctermfg=6       ctermbg=NONE    cterm=NONE
hi Conceal          ctermfg=6       ctermbg=NONE    cterm=NONE
hi SpellBad         ctermfg=6       ctermbg=NONE    cterm=NONE
hi SpellCap         ctermfg=6       ctermbg=NONE    cterm=NONE
hi SpellRare        ctermfg=6       ctermbg=NONE    cterm=NONE
hi SpellLocal       ctermfg=6       ctermbg=NONE    cterm=NONE
hi Pmenu            ctermfg=6       ctermbg=NONE    cterm=NONE
hi PmenuSel         ctermfg=6       ctermbg=NONE    cterm=NONE
hi PmenuSbar        ctermfg=6       ctermbg=NONE    cterm=NONE
hi PmenuThumb       ctermfg=6       ctermbg=NONE    cterm=NONE
hi Ignore           ctermfg=6       ctermbg=NONE    cterm=NONE
hi Todo             ctermfg=6       ctermbg=NONE    cterm=NONE
hi Character        ctermfg=6       ctermbg=NONE    cterm=NONE
hi Float            ctermfg=6       ctermbg=NONE    cterm=NONE
hi Define           ctermfg=6       ctermbg=NONE    cterm=NONE
hi Macro            ctermfg=6       ctermbg=NONE    cterm=NONE
hi PreCondit        ctermfg=6       ctermbg=NONE    cterm=NONE
hi Structure        ctermfg=6       ctermbg=NONE    cterm=NONE
hi Typedef          ctermfg=6       ctermbg=NONE    cterm=NONE
hi Tag              ctermfg=6       ctermbg=NONE    cterm=NONE
hi SpecialChar      ctermfg=6       ctermbg=NONE    cterm=NONE
hi Delimiter        ctermfg=6       ctermbg=NONE    cterm=NONE
hi SpecialComment   ctermfg=6       ctermbg=NONE    cterm=NONE
hi Debug            ctermfg=6       ctermbg=NONE    cterm=NONE
hi Exception        ctermfg=6       ctermbg=NONE    cterm=NONE