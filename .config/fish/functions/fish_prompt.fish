function fish_prompt
    # Must be captured first, before any other command overwrites it
    set -l last_status $status

    set -l dot_color green
    if test $last_status -ne 0
        set dot_color red
    end

    # Location part
    if test "$PWD" = "$HOME"
        set_color blue
        echo -n "[home]"
    else
        # Replace $HOME with ~ at the start of the path
        set -l p (string replace -r -- '^'(string escape --style=regex -- $HOME) '~' $PWD)

        # Add trailing slash (except for root "/")
        if test "$p" != /
            set p "$p/"
        end

        set_color blue
        echo -n "[$p]"
    end

    # Yellow ~
    set_color yellow
    echo -n " ~ "

    # Status dot
    set_color $dot_color
    echo -n "●"

    set_color normal
    echo -n " "
end
