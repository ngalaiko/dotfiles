function fish_vcs_prompt --description "Print all vcs prompts"
    # If a prompt succeeded, we assume that it's printed the correct info.
    # This is so we don't try git if jj already worked.
    fish_jj_prompt $argv
    or fish_git_prompt $argv
end
