function weather
    curl wttr.in/Bangkok
end

function tz # <https://github.com/oz/tz>
    TZ_LIST="US/Eastern,USA - New York;US/Pacific,USA - Seattle;Europe/Amsterdam,NL - Amsterdam;Europe/Riga,LV - Riga;Europe/London,UK - London" command tz
end

function cal
    icalBuddy \
      -ic A3340F36-8323-445F-BE7E-E0DC73FF26FD,140DA448-1B0A-42E0-85FE-DCF3949A44E9,CAB7A17B-8F21-4A64-A73B-E2756218CDB3 \
      -f \
      -npn \
      -ea \
      -nc \
      -iep "title,datetime" \
      -ps "| - |" \
      -po "datetime,title" \
      -tf "%H:%M" \
      -eed \
      -n \
      eventsToday
end

function go-build
    CGO_ENABLED=0 go build -ldflags="-s -w" .
end

function nw
    cd ~/Cloud/Apps/notes/notes-work/ || exit
    vi "+:NvimTreeToggle"
end
