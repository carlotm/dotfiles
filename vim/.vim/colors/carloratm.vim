set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "carloratm"

" Code
exec "hi Normal cterm=NONE ctermfg=249 ctermbg=232"
exec "hi Identifier cterm=NONE ctermfg=250 ctermbg=NONE"
exec "hi Comment cterm=BOLD ctermfg=238 ctermbg=NONE"
exec "hi Type cterm=NONE ctermfg=231 ctermbg=NONE"
exec "hi String cterm=NONE ctermfg=251 ctermbg=NONE"
exec "hi Number cterm=NONE ctermfg=160 ctermbg=NONE"
exec "hi Constant cterm=NONE ctermfg=231 ctermbg=NONE"
exec "hi Statement cterm=NONE ctermfg=231 ctermbg=NONE"

" Search
exec "hi IncSearch cterm=BOLD ctermfg=232 ctermbg=154"
exec "hi Search cterm=NONE ctermfg=232 ctermbg=154"

" Messages
exec "hi ErrorMsg cterm=BOLD ctermfg=231 ctermbg=196"

" File Manager
exec "hi Directory cterm=BOLD ctermfg=231 ctermbg=NONE"

" Status line
exec "hi StatusLine cterm=NONE ctermfg=233 ctermbg=233"
exec "hi StatusLineNC cterm=NONE ctermfg=233 ctermbg=233"

" General
exec "hi Visual cterm=NONE ctermfg=232 ctermbg=156"
exec "hi LineNr cterm=NONE ctermfg=154 ctermbg=232"
exec "hi VertSplit cterm=NONE ctermfg=233 ctermbg=233"

" Unknown
exec "hi Underlined cterm=BOLD ctermfg=228 ctermbg=201"
exec "hi NonText cterm=BOLD ctermfg=154 ctermbg=136"
exec "hi WarningMsg cterm=BOLD ctermfg=201 ctermbg=201"
exec "hi ModeMsg cterm=BOLD ctermfg=201 ctermbg=NONE"
exec "hi MoreMsg cterm=BOLD ctermfg=201 ctermbg=NONE"
exec "hi Question cterm=BOLD ctermfg=201 ctermbg=NONE"
exec "hi User1 cterm=BOLD ctermfg=201 ctermbg=201"
exec "hi User2 cterm=BOLD ctermfg=201 ctermbg=201"
exec "hi WildMenu cterm=BOLD ctermfg=201 ctermbg=201"
exec "hi MBENormal ctermfg=201 ctermbg=201"
exec "hi MBEChanged ctermfg=201 ctermbg=201"
exec "hi MBEVisibleNormal ctermfg=201 ctermbg=201"
exec "hi MBEVisibleChanged ctermfg=201 ctermbg=201"
exec "hi DiffText cterm=NONE ctermfg=201 ctermbg=201"
exec "hi DiffChange cterm=NONE ctermfg=201 ctermbg=201"
exec "hi DiffDelete cterm=NONE ctermfg=201 ctermbg=201"
exec "hi DiffAdd cterm=NONE ctermfg=201 ctermbg=201"
exec "hi Folded cterm=NONE ctermfg=201 ctermbg=201"
exec "hi FoldColumn cterm=NONE ctermfg=201 ctermbg=201"
exec "hi SpecialKey cterm=BOLD ctermfg=201 ctermbg=NONE"
exec "hi Title cterm=BOLD ctermfg=201 ctermbg=201"
exec "hi Error cterm=NONE ctermfg=201 ctermbg=201"
exec "hi Ignore cterm=NONE"
exec "hi PreProc cterm=NONE ctermfg=201 ctermbg=NONE"
exec "hi Special cterm=NONE ctermfg=201 ctermbg=NONE"
exec "hi SpecialChar cterm=NONE ctermfg=201 ctermbg=201"
exec "hi Todo cterm=BOLD ctermfg=201 ctermbg=201"
exec "hi TaglistTagName cterm=BOLD ctermfg=201 ctermbg=214"

if v:version >= 700
    exec "hi Pmenu cterm=NONE ctermfg=232 ctermbg=231"
    exec "hi PmenuSel cterm=BOLD ctermfg=232 ctermbg=231"
    exec "hi PmenuSbar cterm=BOLD ctermfg=232 ctermbg=231"
    exec "hi PmenuThumb cterm=BOLD ctermfg=232 ctermbg=231"

    exec "hi SpellBad cterm=NONE ctermbg=232"
    exec "hi SpellRare cterm=NONE ctermbg=232"
    exec "hi SpellLocal cterm=NONE ctermbg=232"
    exec "hi SpellCap cterm=NONE ctermbg=232"
    exec "hi MatchParen cterm=NONE ctermbg=231 ctermfg=232"
endif
if v:version >= 703
    exec "hi Conceal cterm=NONE ctermfg=232 ctermbg=NONE"
    exec "hi ColorColumn cterm=NONE ctermbg=232"
endif

" vim: set et :
