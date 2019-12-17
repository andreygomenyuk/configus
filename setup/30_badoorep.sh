
# Adding badoo's root certificate
CERTURL="http://tools.qadev.d3/cert/new.crt"
CERTFILE=$(mktemp)
curl -o $CERTFILE $CERTURL
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $CERTFILE
rm $CERTFILE

# Getting badoo repo
mkdir -pv ~/dev/badoo
git clone --bare --single-branch --no-tags git@git.mlan:badoo.git ~/dev/badoo/badoo.repo
git clone --reference ~/dev/badoo/badoo.repo --no-tags git@git.mlan:badoo.git ~/dev/badoo/badoo
echo '../../../badoo.repo/objects' > ~/dev/badoo/badoo/.git/objects/info/alternates
cp ~/dev/badoo/badoo/{_deploy/hooks,.git/hooks}/prepare-commit-msg

# Setting up unrealsync
UNREALSYNC=$(curl -s https://api.github.com/repos/unrealsync/unrealsync/releases/latest | grep "browser_download_url.*darwin\"" | cut -d : -f 2,3 | tr -d \")
curl -o ~/dev/unrealsync $UNREALSYNC
chmod a+x ~/dev/unrealsync
mkdir ~/dev/badoo/badoo/.unrealsync
cp home/.unrealsync_client_config ~/dev/badoo/badoo/.unrealsync/client_config

# [www1.d4] > ln -s /home/wwwrun/badoo.git/.git /home/dron/badoo.repo
# [www1.d4] > git clone --reference ~/badoo.repo --no-tags git@git.mlan:badoo.git ~/badoo

