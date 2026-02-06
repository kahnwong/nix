switch (uname)
    case Linux
        function browsh
            docker run -it --rm -v "$HOME/.config/browsh/config.toml:/app/.config/browsh/config.toml" browsh/browsh
        end
end

function r
    set path (command repo-switcher $argv)
    if test $status -eq 0
        cd $path
    end
end
