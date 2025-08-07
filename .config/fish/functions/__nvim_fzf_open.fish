function __nvim_fzf_open
    # Check if we're in a git repo
    if git rev-parse --git-dir >/dev/null 2>&1
        # In git repo: show tracked files + directories
        set selection (begin
            git ls-files
            git ls-tree -d -r --name-only HEAD
        end | sort -u | fzf)
    else
        # Not in git repo: show all files and directories (including hidden)
        set selection (find . -type f -o -type d | sed 's|^\./||' | grep -v '^\.$' | fzf)
    end
    
    if test -n "$selection"
        if test -d "$selection"
            cd "$selection" && commandline -f repaint
        else
            nvim "$selection"
        end
    end
end
