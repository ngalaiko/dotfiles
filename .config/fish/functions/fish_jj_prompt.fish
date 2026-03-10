function fish_jj_prompt --description 'Write out the jj prompt'
    # Is jj installed?
    if not command -sq jj
        return 1
    end

    # Are we in a jj repo?
    if not jj root --quiet &>/dev/null
        return 1
    end

    # Dirty/clean status of @
    set -l wc_status (jj log --ignore-working-copy --no-graph -r @ -T 'if(empty, "clean", "dirty")' 2>/dev/null)

    # If @ has bookmarks, show them directly
    set -l bookmark_display (jj log --ignore-working-copy --no-graph --color always -r @ -T 'local_bookmarks.join(", ")' 2>/dev/null)
    if test -n "$bookmark_display"
        printf ' [%s %s]' "$bookmark_display" "$wc_status"
        return 0
    end

    # Otherwise, show the closest ancestor bookmark prefixed with ~
    # and append +N for the number of commits between it and @ (excluding @)
    set -l closest (jj log --ignore-working-copy --no-graph --color always -r 'heads(::@ & bookmarks())' -T '"~" ++ local_bookmarks.join(", ~")' 2>/dev/null)
    if test -z "$closest"
        return 0
    end

    set -l ahead (string length -- (jj log --ignore-working-copy --no-graph -r 'heads(::@ & bookmarks())::@- ~ heads(::@ & bookmarks())' -T '"x"' 2>/dev/null))
    if test -n "$ahead" -a "$ahead" -gt 0
        printf ' [%s +%s %s]' "$closest" "$ahead" "$wc_status"
    else
        printf ' [%s %s]' "$closest" "$wc_status"
    end
end
