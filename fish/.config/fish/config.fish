if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

abbr -a -g v nvim
abbr -a -g ls exa -a --icons
