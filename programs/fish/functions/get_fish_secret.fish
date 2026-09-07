function get_fish_secret
    ~/.nix-profile/bin/sops -d ~/.config/fish/secrets/fish_secrets.sops.yaml | ~/.nix-profile/bin/yq .$argv
end
