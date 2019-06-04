hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "CarloRatm"

set bg&

hi CursorLineNr	    ctermfg=3       ctermbg=0       cterm=NONE
hi CursorLine       ctermfg=NONE    ctermbg=0       cterm=NONE
hi CursorColumn     ctermfg=NONE    ctermbg=7       cterm=NONE
hi LineNr	        ctermfg=8      ctermbg=NONE    cterm=NONE
hi ColorColumn      ctermfg=NONE    ctermbg=7       cterm=NONE

hi TabLineFill      ctermfg=NONE    ctermbg=0       cterm=NONE
hi TabLine	        ctermfg=8       ctermbg=0       cterm=NONE
hi TabLineSel	    ctermfg=3       ctermbg=NONE    cterm=NONE

" An example comment
hi Comment	        ctermfg=8       ctermbg=NONE    cterm=NONE

hi Normal	        ctermfg=7       ctermbg=NONE    cterm=NONE
hi Conditional	    ctermfg=7       ctermbg=NONE    cterm=NONE
hi Keyword	        ctermfg=7       ctermbg=NONE    cterm=NONE
hi Label	        ctermfg=7       ctermbg=NONE    cterm=NONE
hi Operator	        ctermfg=7       ctermbg=NONE    cterm=NONE
hi Identifier	    ctermfg=7       ctermbg=NONE    cterm=NONE
hi Statement	    ctermfg=7       ctermbg=NONE    cterm=NONE
hi Underlined       ctermfg=7       ctermbg=NONE    cterm=NONE

hi Number	        ctermfg=12      ctermbg=NONE    cterm=NONE
hi String	        ctermfg=12      ctermbg=NONE    cterm=NONE

hi Boolean	        ctermfg=6       ctermbg=NONE    cterm=NONE
hi Include	        ctermfg=6       ctermbg=NONE    cterm=NONE
hi StorageClass	    ctermfg=6       ctermbg=NONE    cterm=NONE
hi Function	        ctermfg=6       ctermbg=NONE    cterm=NONE
hi Type	            ctermfg=6       ctermbg=NONE    cterm=NONE
hi Constant	        ctermfg=6       ctermbg=NONE    cterm=NONE
hi Special	        ctermfg=6       ctermbg=NONE    cterm=NONE
hi PreProc	        ctermfg=6       ctermbg=NONE    cterm=NONE
hi Error	        ctermfg=6       ctermbg=NONE    cterm=NONE

hi IncSearch	    ctermfg=0       ctermbg=3    cterm=NONE
hi Search	        ctermfg=0       ctermbg=3    cterm=NONE
hi Visual	        ctermfg=0       ctermbg=3    cterm=NONE
hi VisualNOS	    ctermfg=0       ctermbg=3    cterm=NONE

hi MatchParen       ctermfg=NONE    ctermbg=2    cterm=NONE











hi StatusLine	    ctermfg=4       ctermbg=0       cterm=NONE
hi StatusLineNC	    ctermfg=4       ctermbg=0       cterm=NONE
hi Directory	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi ErrorMsg	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi MoreMsg	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi ModeMsg	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi NonText	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi SpecialKey       ctermfg=3       ctermbg=NONE    cterm=NONE
hi Question	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi VertSplit	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi Title	        ctermfg=3       ctermbg=NONE    cterm=NONE

hi WarningMsg	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi WildMenu	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi Folded	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi FoldColumn	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi DiffAdd	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi DiffChange	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi DiffDelete	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi DiffText	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi SignColumn	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi Conceal	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi SpellBad	        ctermfg=3       ctermbg=NONE    cterm=NONE

hi SpellCap	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi SpellRare	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi SpellLocal	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi Pmenu	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi PmenuSel	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi PmenuSbar	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi PmenuThumb	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi Ignore	        ctermfg=3       ctermbg=NONE    cterm=NONE

hi Todo	            ctermfg=3       ctermbg=NONE    cterm=NONE
hi Character	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi Float	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi Repeat	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi Define	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi Macro	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi PreCondit	    ctermfg=3       ctermbg=NONE    cterm=NONE

hi Structure	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi Typedef	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi Tag	            ctermfg=3       ctermbg=NONE    cterm=NONE
hi SpecialChar	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi Delimiter	    ctermfg=3       ctermbg=NONE    cterm=NONE
hi SpecialComment	ctermfg=3       ctermbg=NONE    cterm=NONE
hi Debug	        ctermfg=3       ctermbg=NONE    cterm=NONE
hi Exception	    ctermfg=3       ctermbg=NONE    cterm=NONE
