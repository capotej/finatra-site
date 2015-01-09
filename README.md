# Finatra Site

### Install Jekyll (ruby 1.9.2+)

    bundle install --binstubs

### Local Preview

    ./bin/jeykll serve

### Deploy 

    ./bin/jeykll build


### Upload _site (public key needs to be added to nearlyfreespeech)

    rsync -avz -e ssh _site/* capotej_finatra@ssh.phx.nearlyfreespeech.net:
