#!/usr/bin/env zsh

print "Hello!"
print "Please set GITHUB_SYNC_TOKEN to your GitHub token with scope `tput bold`read:org`tput sgr0`."
print "Here you can get and create one: <`tput smul`https://github.com/settings/tokens`tput sgr0`>."
read github_sync_token"?> "
print "Your org?"
read github_sync_org"?> "
github_sync_dir_default=~/com/$github_sync_org
print "Dir to sync? Leave empty for default $github_sync_dir_default"
read github_sync_dir"?> "
if (( $#github_sync_dir == 0 )) github_sync_dir=~/com/$github_sync_dir_default
env_f=env.zsh
cat <<EOF >$env_f
#!/usr/bin/env zsh
export GITHUB_SYNC_TOKEN=$github_sync_token
export GITHUB_SYNC_ORG=$github_sync_org
export GITHUB_SYNC_DIR=$github_sync_dir
export GITHUB_SYNC_API_REPOS=https://api.github.com/orgs/\$GITHUB_SYNC_ORG/repos
EOF
print "Good. All done from my side, I've created `tput smul`$env_f`tput sgr0`."
print "Please source it and you are ready to execute github-sync.zsh"