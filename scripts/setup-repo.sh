

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$ROOT_DIR/.github/workflows"
mkdir -p "$ROOT_DIR/.github/ISSUE_TEMPLATE"

touch "$ROOT_DIR/.github/CODEOWNERS"
touch "$ROOT_DIR/.github/pull_request_template.md"
touch "$ROOT_DIR/.github/ISSUE_TEMPLATE/bug_report.md"
touch "$ROOT_DIR/.github/ISSUE_TEMPLATE/feature_request.md"

touch "$ROOT_DIR/CONTRIBUTING.md"
touch "$ROOT_DIR/LICENSE"

echo "# K8S-MESH" > "$ROOT_DIR/README.md"

echo "Repository setup complete!"






# echo "setting up repo structure"

# mkdir -p ../.github/workflows
# mkdir -p ../.github/ISSUE_TEMPLATE


# touch ../.github/CODEOWNERS
# touch ../.github/pull_request_template.md
# touch ../.github/ISSUE_TEMPLATE/bug_report.md
# touch ../.github/ISSUE_TEMPLATE/feature_request.md

# touch ../CONTRIBUTING.md
# touch ../LICENSE



# echo "Repository setup complete"