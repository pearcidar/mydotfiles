if status is-interactive
    # Commands to run in interactive sessions can go here
	set fish_greeting
end

# Enable VI mode in fish
fish_vi_key_bindings

# aliases (not a lot)
alias ls="exa --icons"
alias vim="nvim"
alias cat="bat --theme base16"
alias hex="colorscript -e hex"
alias keybinds="vim ~/.config/sxhkd/sxhkdrc"
alias polyconfig="vim ~/.config/polybar/config"
alias zshrc="vim ~/.zshrc"
alias top="btm"
alias alacritty.yml="vim ~/.config/alacritty/alacritty.yml"
alias colhex="colorscript -e hex"
alias vimconfig="vim ~/.config/nvim/init.vim"
alias grep="rg"
alias matrix='unimatrix -s 95'
alias nc="newsboat"
alias col="colorscript -e colortest"

# Start Random Colorscript
colorscript random

# starship prompt
starship init fish | source

# Setting up colors

    # TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 33467c
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
    set -g fish_pager_color_selected_background --background=$selection


