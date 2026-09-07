#!/bin/bash

f2 -f '(\d+).*' -r '{id3.album_artist}/{id3.year} - {id3.album}/{id3.disc}{id3.track}. {id3.title}{ext}'
