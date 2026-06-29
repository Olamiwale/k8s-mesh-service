set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT_DIR"

echo ""
echo "Initializing Git..."

if [ ! -d ".git" ]; then
    git init
    echo "Git initialized."

else
    echo "Git already initialized."

fi

echo ""
echo "Creating branches ....."

DEFAULT_BRANCH=$(git branch --show-current)


if [ -z "$DEFAULT_BRANCH" ]; then
    DEFAULT_BRANCH="main"
fi

git add .

git checkout -B main


git commit -m "Initial repository setup"

git branch -M main

git branch develop
git branch staging


echo "Branches created."

echo ""
echo "Current branches"

git branch

