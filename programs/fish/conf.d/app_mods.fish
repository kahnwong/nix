set -gx MODS_GOOGLE_API_TOKEN $(get_fish_secret MODS_GOOGLE_API_TOKEN)
set -gx MODS_GITHUB_PERSONAL_ACCESS_TOKEN $(get_fish_secret MODS_GITHUB_PERSONAL_ACCESS_TOKEN)

function a
    mods --no-cache -P $argv
end

function ap
    mods --no-cache -m "gemini-2.5-pro" -P $argv
end

function an
    mods --no-cache -R default -P $argv
end
