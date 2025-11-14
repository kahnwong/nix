function cpubench
    CPUBENCH_API_KEY="$(get_fish_secret CPUBENCH_API_KEY)" command cpubench $argv
end

# pgconn
if type -p pgconn > /dev/null; pgconn completion fish | source; end

# totp
if type -p totp > /dev/null; totp completion fish | source; end

# swissknife
alias sk="swissknife"
if type -p swissknife > /dev/null; sk completion fish | source; end

# timesheet
alias ts="timesheet"
if type -p timesheet > /dev/null; ts completion fish | source; end

# config-init
alias ci="config-init"
if type -p config-init > /dev/null; ci completion fish | source; end

# article-summarizer
alias sm="article-summarizer"

# erp
if type -p erp > /dev/null; erp completion fish | source; end

# media-discord-rpc
alias d="media-discord-rpc"
if type -p media-discord-rpc > /dev/null; d completion fish | source; end

# habit-tracker
if type -p habit-tracker > /dev/null; habit-tracker completion fish | source; end
alias h="habit-tracker"

# thailand-train-fare-calculator
if type -p thailand-train-fare-calculator > /dev/null; thailand-train-fare-calculator completion fish | source; end

# gcal-tui
alias c="gcal-tui"

# bean-add
if type -p bean-add > /dev/null; bean-add completion fish | source; end
alias ba="bean-add"
