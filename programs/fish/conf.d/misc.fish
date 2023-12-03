function ,weather
    curl wttr.in
end

function ,zip-compress
    bash -c 'for i in *.txt; do zip -rm `basename $i .txt`.zip $i; done'
end

function ,code-to-image
    silicon --from-clipboard -l rs --to-clipboard --theme OneHalfDark
end

function tz # <https://github.com/oz/tz>
    TZ_LIST="Asia/Bangkok,TH - Bangkok;US/Eastern,USA - New York;US/Pacific,USA - Seattle;Europe/Riga,LV - Riga;Europe/London,UK - London" command tz
end

# function budget
#     fava -p 5004 ~/Cloud/Apps/fava/beans.beancount
# end
