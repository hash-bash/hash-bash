#!/bin/bash

# Script to rename all repositories from their current names to kebab-case
# Usage: ./rename-repos-kebab-case.sh

# Function to convert a string to kebab-case
to_kebab_case() {
    echo "$1" | sed 's/\([A-Z]\)/-\L\1/g' | sed 's/^-//' | tr '[:upper:]' '[:lower:]'
}

# List of repositories to rename (retrieved from your GitHub account)
repos=(
    "AI-Agents-Playground"
    "Bash-Scripts-for-Beginners"
    "Blooming-Souls-Android-Project"
    "Calculator-using-HTML-JS-and-CSS"
    "Computer-Graphics-Programs"
    "Covid19-Data-Analysis-Notebook"
    "Covid19-Kavach-Flutter-Project"
    "Data-Structures-and-Algorithms"
    "DJ-Crossfader-Landing-Page"
    "IoT-Project-Setups"
    "Jupyter-Notebook-Exercises"
    "NASA-Jet-Engine-RUL-Prediction-Notebook"
    "Natural-Language-Processing-Notebook"
    "Object-Oriented-Programming"
    "parkour2"
    "Payment-Form-using-HTML-and-CSS"
    "Python-Programs-for-Beginners"
    "Regression-and-Classification-Notebooks"
    "Research-Software-Ecosystem-Atlas"
    "Server-Health-Monitoring-and-Forecasting"
    "Share-Market-Exploratory-Data-Analysis-Notebook"
    "Signin-and-Signup-Form-using-HTML-JS-and-CSS"
    "Superstore-Sales-Data-Analysis-Notebook"
    "Tic-Tac-Toe-using-Angular"
)

echo "🔄 Starting repository rename process to kebab-case..."
echo "=================================================="

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ Error: GitHub CLI (gh) is not installed."
    echo "Please install it from: https://cli.github.com/"
    exit 1
fi

# Counter for tracking progress
total=${#repos[@]}
count=0
success=0
failed=0

for repo in "${repos[@]}"; do
    ((count++))
    new_name=$(to_kebab_case "$repo")
    
    # Skip if already in kebab-case
    if [ "$repo" = "$new_name" ]; then
        echo "⏭️  [$count/$total] Skipping '$repo' (already in kebab-case)"
        continue
    fi
    
    echo "📝 [$count/$total] Renaming '$repo' → '$new_name'..."
    
    # Use gh CLI to rename the repository
    if gh repo rename "$new_name" --repo "hash-bash/$repo"; then
        echo "✅ Successfully renamed to '$new_name'"
        ((success++))
    else
        echo "❌ Failed to rename '$repo' to '$new_name'"
        ((failed++))
    fi
    
    # Add a small delay to avoid rate limiting
    sleep 1
done

echo "=================================================="
echo "🎉 Rename process complete!"
echo "✅ Successful: $success"
echo "❌ Failed: $failed"
echo "⏭️  Skipped: $((total - success - failed))"
