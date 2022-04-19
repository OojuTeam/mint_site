# Ooju NFT Mint Site | Ooju NFT 민팅 사이트
template for NFT creators who only need a minting portal. this is a simple, no-code solution with an interface for plugging in contract details and a background image.
이것은 NFT 창작자들 중 민팅 사이트를 만들고 싶은 사람들을 위한 템플릿입니다. 심플하게 코드 없이 제공되는 인터페이스에 컨트랙트의 디테일과 사이트를 위한 배경이미지를 넣으면 바로 사용가능합니다.

## Installation | 설치
if you are a non-developer wanting to launch your own minting website:

1. deploy your smart contract and upload image/json assets (if applicable) to IPFS.
2. click the "Deploy to Heroku" button below, create a password for your admin account, and provide your smart contract details
3. your site will work immediately - set up a custom domain (optional) for free inside your heroku.com dashboard

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/OojuTeam/mint_site)

for more details on each step above, go here (INSERT).

만약 당신이 개발자는 아니지만, 자신만의 민팅 사이트를 만들고 싶다면:
1. 스마트 컨트랙트를 배포하고 이미지와 json 파일들을 모두 IPFS에 올려놓으세요.
2. 아래에 "Deploy to Heroku" 버튼을 누르고 들어가서 관리자 계정 생성을 위한 비밀번호를 생성하세요. 그리고 스마트 컨트랙트의 정보를 입력합니다.
3. 바로 사이트가 작동할거예요. - 혹시 도메인을 구매하였다면 도메인을 heroku.com 대시보드에서 설정하세요. 

각 스텝을 위한 더 자세한 내용을 보고 싶다면 여기로 가세요.

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
