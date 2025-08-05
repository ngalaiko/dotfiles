function __nvim_fzf_open
    set file (rg --files | fzf)
    if test -n "$file"
        nvim "$file"
    end
end
