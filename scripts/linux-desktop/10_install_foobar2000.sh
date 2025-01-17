#!/bin/bash

# <https://ubuntuhandbook.org/index.php/2018/02/install-foobar2000-snap-ubuntu-16-04/>
sudo snap install foobar2000 --classic

sudo snap connect foobar2000:hardware-observe core:hardware-observe
sudo snap connect foobar2000:process-control core:process-control
sudo snap connect foobar2000:cups-control core:cups-control

# <https://hydrogenaud.io/index.php?PHPSESSID=39cdc0ulu4psl0r0on6pk6q5pr&topic=117136.msg982713#msg982713>
sudo snap connect foobar2000:removable-media
