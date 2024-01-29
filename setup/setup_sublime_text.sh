#!/usr/bin/env bash
set -euo pipefail

# https://packagecontrol.io/packages/Sync%20Settings
# https://gist.github.com/huoguangjin/cdabef704034c4f7dfac283860397569

echo "
1. Install Package Control

2. Package Control: Install Package > Sync Settings

3. Create an access token here with gist scope checked:
https://github.com/settings/tokens

4. Sync Settings: Edit User Settings
{
    "access_token": "YOUR_TOKEN",
    "gist_id": "cdabef704034c4f7dfac283860397569"
}

5. Sync Settings: Download
"
