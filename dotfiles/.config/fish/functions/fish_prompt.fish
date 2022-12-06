# https://github.com/tehdarthvid/log-wakatime-fish

function log-wakatime \
    --description="Wakatime Terminal tracking for Fish" \

    # wakatime for fish
    #
    # Add this to the fish_prompt function in
    # ~/.config/fish/functions/fish_prompt.fish
    # (or if it doesn't exist, create it).

    set -l project "Terminal"

    if [ -d .git ]
        set -l tmp (basename (git config --local remote.origin.url) 2>/dev/null)
        if [ $status -eq 0 ]
            set project $tmp
        end
    else
        git rev-parse > /dev/null 2>&1
        if [ $status -eq 0 ]
            set -l tmp (basename (git config --local remote.origin.url) 2>/dev/null)
            if [ $status -eq 0 ]
                set project $tmp
            end
        end
    end


    set tmp (echo $project | sed 's/.*\(....\)/\1/')
    if [ $tmp = ".git" ]
        set project (echo $project | sed 's/....$//')
    end
    #echo $project "~> "
    wakatime-cli --write --plugin "log-wakatime/1.0.0" --entity-type app --project "$project" --entity (echo $history[1] | cut -d ' ' -f1) 2>&1 > /dev/null&

end
