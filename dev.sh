#!/usr/bin/env bash

. ~/.bash_profile

# nvm
nvm install node
nvm install --lts
nvm alias default lts/*
nvm use lts/*

# npm/yarn
npm install -g yarn

yarn global add aws-cdk
yarn global add docusaurus-init
yarn global add dts-gen
yarn global add yo
yarn global add @endemolshinegroup/generator-nodejs-ts
yarn global add @endemolshinegroup/generator-serverless-nodejs-ts
yarn global add create-react-native-app
yarn global add create-react-app
yarn global add serverless

# pip
pip3 install --upgrade pip

pip3 install --user powerline-status
pip3 install --user awscli
pip3 install --user saws
