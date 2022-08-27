#!/bin/bash
PAGE_ID=${NOTION_URL##*-}

PAGE_CHILDREN=$(curl 'https://api.notion.com/v1/blocks/'"$PAGE_ID"'/children' \
  -H 'Authorization: Bearer '"$NOTION_API_KEY"'' \
  -H "Notion-Version: 2022-02-22"
  )

TABLE_ID=$(echo $PAGE_CHILDREN | jq '.results[] |  select( .type | contains("table")) | .id')
TABLE_CHILDREN=$(curl 'https://api.notion.com/v1/blocks/'"${TABLE_ID:1:36}"'/children' \
  -H 'Authorization: Bearer '"$NOTION_API_KEY"'' \
  -H "Notion-Version: 2022-02-22"
  )

RESULT=$(paste -sd '\t\n' <(echo $TABLE_CHILDREN | jq -r '.results[].table_row.cells[][0].text.content') | jq -nRcr '{ results: [inputs] | map(split("\t") | { author: .[1], content: .[0] }) }')

echo $RESULT | jq -r '.results[1:]' > index.json
