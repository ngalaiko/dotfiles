function fish_title
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    echo (prompt_pwd)
end
