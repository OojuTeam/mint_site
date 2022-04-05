# Ooju NFT Mint Site
template for NFT creators who only need a minting portal. this is a simple, no-code solution with an interface for plugging in contract details and a background image.

## Installation
if you are a non-developer wanting to launch your own minting website:

1. deploy your smart contract and upload image/json assets (if applicable) to IPFS.
2. click the "Deploy to Heroku" button below, create a password for your admin account, and provide your smart contract details
3. your site will work immediately - set up a custom domain (optional) for free inside your heroku.com dashboard

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/OojuTeam/mint_site)

for more details on each step above, go here (INSERT).

## Development

1. `bundle`
2. `rails g rename:into your_site_name` (remove `rename` gem afterwards)
3. `rails db:setup && rails db:migrate`
4. `cp config/application-sample.yml config/application.yml`
5. `rm -rf .git && git init && git add . && git commit -m 'first commit'`

```sh
bin/dev # uses foreman to boot server, frontend, and bg job queue
```

## Testing
```
rspec # run all tests inside spec/
rspec spec/dir_name # run all tests inside given directory
```

## Deploying
```sh
heroku git:remote -a heroku_app_name_here # you only need to do this once
```

```sh
git push heroku master # deploys master branch
git push heroku some_branch_name:master # deploys non-master branch
```
