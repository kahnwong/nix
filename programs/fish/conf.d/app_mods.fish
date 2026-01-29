set -gx MODS_GOOGLE_API_TOKEN $(get_fish_secret MODS_GOOGLE_API_TOKEN)
set -gx MODS_CUSTOM_API_TOKEN $(get_fish_secret AI_GATEWAY_API_KEY)
# set -gx MODS_GITHUB_PERSONAL_ACCESS_TOKEN $(get_fish_secret MODS_GITHUB_PERSONAL_ACCESS_TOKEN)


# coding
function a # ask - coding mode
    mods --no-cache -P $argv
end

# function ap # ask - pro (model)
#     mods --no-cache -m "gemini-2.5-pro" -P $argv
# end

# normal
function as # ask - short answer
    mods --no-cache -R short-answer -P $argv
end

function an # ask - normal mode
    mods --no-cache -R default -P $argv
end

# # select
# function aselect # ask - select model
#     mods --no-cache -m "dummy" # -M flat doesn't display all models
# end
