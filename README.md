# Notion Random Quote
This is a widget for [Notion](https://notion.so) based on `saman/notion-quote`. Two key differences:
1. Widget is hosted as a Github page (so no extra dependency)
1. A Github Action syncs data from a simple table from Notion, so quotes can be managed from Notion.

## Setup steps
1. Fork this repo
1. Setup this repo with a github page ([docs](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site))
  1. For source, select `Deploy from a branch`
  1. For branch, select `master`
  1. Press `Save`
1. Setup Notion integration ([docs](https://www.notion.so/my-integrations))
  1. Only Capability required is `Content Capabilities` / `Read Content`
  1. Remember to store secret key for integration (we'll use it next).
1. Save Notion integration key to Github Secret
  1. Go to https://github.com/<username>/notion-quote/settings/secrets/actions
  1. Click `New Repository Secret`
  1. Name: `NOTION_API_KEY`
  1. Value: Paste in value from above.
1. Add Notion integration to Notion page.
  1. Go to Notion page with quote table.
  1. CLick `Share` (top right hand corner)
  1. Click `Add emails, people, integrations`
  1. Find, and click, the name of the integration made above
