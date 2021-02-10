#!/bin/sh

set -e

git config --local user.email "actions@github.com"
git config --local user.name "GitHub Actions"

git clone -b gh-pages https://${{github.actor}}:${{secrets.GITHUB_TOKEN}}@github.com/${{github.repository}}.gitt book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m "Update the book" || true
git push -q origin gh-pages
