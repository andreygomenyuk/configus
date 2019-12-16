
mkdir -pv ~/dev/badoo
git clone --bare --single-branch --no-tags git@git.mlan:badoo.git ~/dev/badoo/badoo.repo
git clone --reference ~/dev/badoo/badoo.repo --no-tags git@git.mlan:badoo.git ~/dev/badoo/badoo
echo '../../../badoo.repo/objects' > ~/dev/badoo/badoo/.git/objects/info/alternates

mkdir ~/dev/badoo/badoo/.unrealsync
cp home/.unrealsync_client_config ~/dev/badoo/badoo/.unrealsync/client_config
cp ~/dev/badoo/badoo/{_deploy/hooks,.git/hooks}/prepare-commit-msg

# [www1.d4] > ln -s /home/wwwrun/badoo.git/.git /home/dron/badoo.repo
# [www1.d4] > git clone --reference ~/badoo.repo --no-tags git@git.mlan:badoo.git ~/badoo

