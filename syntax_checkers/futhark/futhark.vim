if exists("g:loaded_syntastic_futhark_fut_checker")
    finish
endif
let g:loaded_syntastic_futhark_fut_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_futhark_fut_GetLocList() dict
    let makeprg = self.makeprgBuild({})

    let errorformat .=
        \ '^Error at %f:%l%c-%c'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'fut',
    \ 'name': 'futhark'
})

let &cpo = s:save_cpo
unlet s:save_cpo
