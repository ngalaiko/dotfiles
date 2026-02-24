function fish_jj_prompt --description 'Write out the jj prompt'
    # Is jj installed?
    if not command -sq jj
        return 1
    end

    # Are we in a jj repo?
    if not jj root --quiet &>/dev/null
        return 1
    end

    # Bookmark template: name + sync status indicator
    #   (nothing) = synced with remote
    #   ↑ = ahead of remote
    #   ↓ = behind remote
    #   ↕ = ahead and behind (diverged)
    set -l bookmark_sync 'local_bookmarks.map(|b| b.name() ++ if(b.synced(), "", if(b.tracking_ahead_count().zero(), "↓", if(b.tracking_behind_count().zero(), "↑", "↕"))))'

    # Find the bookmark to display:
    # - If @ has bookmarks, show them directly
    # - Otherwise, show the closest ancestor bookmark prefixed with ~
    set -l bookmark_display (jj log --ignore-working-copy --no-graph --color always -r @ -T "$bookmark_sync"'.join(", ")' 2>/dev/null)
    if test -z "$bookmark_display"
        set bookmark_display (jj log --ignore-working-copy --no-graph --color always -r 'heads(::@ & bookmarks())' -T '"~" ++ '"$bookmark_sync"'.join(", ~")' 2>/dev/null)
    end

    if test -n "$bookmark_display"
        printf ' [%s]' "$bookmark_display"
    end
end
