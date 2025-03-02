# Mage completions for Fish shell

# Define mage command
complete -c mage -f -d "Mage build tool for Go"

function __fish_mage_targets
    # Parse output of mage -l to get available targets with descriptions
    set -l mage_output (mage -l 2>/dev/null)
    
    # Skip lines until we reach "Targets:"
    set -l found_targets 0
    for line in $mage_output
        if test $found_targets -eq 1
            # Extract target name and description
            # Format is typically: "  targetName    Description here"
            set -l target (string trim $line)
            if test -n "$target"
                set -l name_desc (string replace -r '^\s*(\S+)\s+(.*)$' '$1\n$2' $target)
                set -l name $name_desc[1]
                set -l desc "No description"
                if test (count $name_desc) -gt 1
                    set desc $name_desc[2]
                end
                
                if test -n "$name"
                    # Fish-compatible way to output tab-separated values
                    printf "%s\t%s\n" $name $desc
                end
            end
        else if string match -q "*Targets:*" $line
            set found_targets 1
        end
    end
end

# Add dynamic targets from the current project
complete -c mage -n "__fish_use_subcommand" -a "(__fish_mage_targets)"
