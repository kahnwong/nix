######################
# crush
######################
function crush
    set -x AI_GOOGLE_API_TOKEN $(get_fish_secret AI_GOOGLE_API_TOKEN)
    set -x AI_GATEWAY_API_KEY $(get_fish_secret AI_GATEWAY_API_KEY)
    command crush $argv
end

######################
# short commands
######################
function a # ask - coding mode
    # crush run -m claude-haiku-4-5 you should provide code snippet without explanation $argv | glow

    mkdir -p /tmp/gemini # prevent gemini from scanning the folder
    cd /tmp/gemini || exit 1
    gemini -m gemini-3-flash-preview -p "you should provide code snippet without explanation $argv" | glow
end

# normal
function as # ask - short answer
    # crush run -m claude-haiku-4-5 you should provide answer within a few sentences $argv | glow

    mkdir -p /tmp/gemini # prevent gemini from scanning the folder
    cd /tmp/gemini || exit 1
    gemini -m gemini-3-flash-preview -p "you should provide answer within a few sentences $argv" | glow
end
