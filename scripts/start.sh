#!/bin/bash
cd /Users/garden/projects/nkdews.me 
enwrite -n "AWritingDaily" -t published  -o /Users/garden/projects/nkdews.me/  --remove-tags "published" 
git add .
git commit -m "updated posts"
git push
/usr/local/bin/hugo serve --port 9003 -D  --watch=true
