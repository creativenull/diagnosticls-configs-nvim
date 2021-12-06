if has('nvim') && has('nvim-0.5')
  function! s:has_issues() abort
    let l:dls_issues = luaeval('_G.diagnosticls_healthcheck')
    return !empty(l:dls_issues)
  endfunction

  function! health#diagnosticls_configs#check() abort
    if s:has_issues()
      let l:dls_issues = luaeval('_G.diagnosticls_healthcheck')
      for l:issue in l:dls_issues
        call health#report_error(issue)
      endfor
    else
      call health#report_ok('All checks passed')
    endif
  endfunction
endif
