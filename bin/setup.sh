#!/usr/bin/env bash

set -e

echo "Owner: [= technote-space]"
read -r OWNER
if [[ -z "${OWNER}" ]]; then
	OWNER=technote-space
fi

echo "Repo: "
read -r REPO
if [[ -z "${REPO}" ]]; then
	exit
fi

echo "Title: [= ]"
read -r TITLE

echo "DESCRIOTION: [= ]"
read -r DESCRIOTION


echo ""
echo "=================================="
echo "Repository:  ${OWNER}/${REPO}"
echo "Title:       ${TITLE}"
echo "Description: ${DESCRIOTION}"
echo "=================================="
# shellcheck disable=SC2162
read -n1 -p "ok? (y/N): " yn
if [[ $yn != [yY] ]]; then
	exit
fi

sed -i "s/technote-space/${OWNER}/g" .github/CODEOWNERS
sed -i "s/technote-space/${OWNER}/g" README.md
sed -i "s/ts-package-template/${REPO}/g" README.md
sed -i "s/technote-space\/ts-package-template/${OWNER}\/${REPO}/g" package.json
sed -i "s/Template for npm package\./${DESCRIOTION}/g" README.md
sed -i "s/Template for npm package\./${DESCRIOTION}/g" package.json
sed -i "s/TypeScript Package Template/${TITLE}/g" README.md

if [[ "${OWNER}" != 'technote-space' ]]; then
	rm -f .github/FUNDING.yml
	rm -f _config.yml
	sed -i '26,100d' README.md
fi

sed -i '/setup.sh/d' package.json
touch __DELETE__

cat << EOS


Please edit package.json
  - version
  - description
  - authoer
  - license
  - keywords
  - homepage
EOS
