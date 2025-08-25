# Mage completions for Fish shell with caching
# Define mage command
complete -c mage -f -d "Mage build tool for Go"

function __fish_mage_targets
    # Generate hash from mage files similar to bash version
    set -l magefile_hash (find . -name "magefile.go" -o -name "mage.go" -o -name "*_mage.go" 2>/dev/null | xargs ls -la 2>/dev/null | md5sum | cut -d' ' -f1)
    set -l cache_file "/tmp/.mage_targets_$magefile_hash"
    
    # Check if cache file exists and is valid
    if not test -f "$cache_file"
        # Extract targets with descriptions and save to cache
        mage -l 2>/dev/null | while read -l line
            # Skip until we find "Targets:" line
            if string match -q "*Targets:*" "$line"
                # Read remaining lines and process targets
                while read -l target_line
                    set -l trimmed (string trim "$target_line")
                    if test -n "$trimmed"
                        # Split on whitespace - first word is target, rest is description
                        set -l parts (string split -m 1 ' ' "$trimmed")
                        if test (count $parts) -ge 1
                            set -l name $parts[1]
                            set -l desc ""
                            if test (count $parts) -ge 2
                                set desc (string trim $parts[2])
                            end
                            if test -z "$desc"
                                set desc "No description"
                            end
                            printf "%s\t%s\n" "$name" "$desc"
                        end
                    end
                end
                break
            end
        end > "$cache_file"
    end
    
    # Read targets with descriptions from cache file
    if test -f "$cache_file"
        cat "$cache_file" 2>/dev/null
    end
end

# Add dynamic targets from the current project
complete -c mage -n "__fish_use_subcommand" -a "(__fish_mage_targets)"
