#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <title>"
    exit 1
fi

# Get the current date in the format YYYY-MM-DD
current_date=$(date +%Y-%m-%d)

# Remove spaces from the title and concatenate it to the date
title=$(echo "$@" | tr ' ' '-' | tr -d '[:space:]')

# Create the output filename
output_filename="content/posts/$current_date-$title.md"

# Hugo-compatible frontmatter template
frontmatter="---
title: '$title'
author: Nirmal
date: '$current_date'
draft: true
categories:
  - api
tags:
  - csioz
  - poland
slug: /$title
---

"

# Create the new Markdown file with frontmatter
echo -e "$frontmatter" > "$output_filename"

echo "New Markdown file with frontmatter created: $output_filename"
