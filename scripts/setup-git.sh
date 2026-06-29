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
echo ""


# Ensure main branch exists
if ! git show-ref --verify --quiet refs/heads/main; then
    git branch -M main
fi

# Create develop if missing
if ! git show-ref --verify --quiet refs/heads/develop; then
    git branch develop
fi

# Create staging if missing
if ! git show-ref --verify --quiet refs/heads/staging; then
    git branch staging
fi

echo "Current branches:"
git branch




# DEFAULT_BRANCH=$(git branch --show-current)

# if [ -z "$DEFAULT_BRANCH" ]; then
#     DEFAULT_BRANCH="main"
# fi

# git checkout -B main

# git branch -M main
# git branch develop
# git branch staging

# git add .
# git commit -m "Initial repository setup"

# git push -u origin main
# git push origin develop
# git push origin staging

# echo "Branches created."
# echo ""
# echo "Current branches"

# git branch

