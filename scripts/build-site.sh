#!/usr/bin/env bash
#
# Builds the published site into an output directory.
#
# The site is exactly the contents of spec/: spec/index.html becomes the site
# root, spec/initial-report/ becomes /initial-report/, and so on. Nothing else
# in the repository is published — meeting minutes, documents/ and feps/ stay
# on GitHub only.
#
# Usage: script/build-site.sh [SOURCE_DIR] [OUTPUT_DIR]
#   SOURCE_DIR  directory to read spec/ from  (default: the current directory)
#   OUTPUT_DIR  directory to write the site into (default: _site)
#
# Run it locally to see what will be published:
#   script/build-site.sh && open _site/index.html
#
# SECURITY: the pull request preview workflow runs *this* script, from the base
# branch, against a pull request's checkout. SOURCE_DIR is therefore untrusted:
# copy data out of it, and never execute anything from it. Do not add a build
# step here that runs code from SOURCE_DIR.
set -euo pipefail

SOURCE_DIR="${1:-.}"
OUTPUT_DIR="${2:-_site}"
SPEC_DIR="${SOURCE_DIR%/}/spec"

if [ ! -d "$SPEC_DIR" ]; then
  echo "error: no spec/ directory found in '${SOURCE_DIR}'" >&2
  exit 1
fi

# Reserved names that Cloudflare and GitHub Pages treat as code or routing
# configuration rather than as content. Nothing in spec/ should ever be one of
# these, so their presence is either a mistake or an attempt to get code onto
# the site. Refuse rather than publish.
reserved=$(find "$SPEC_DIR" \( -name '_worker.js' -o -name '_routes.json' -o -name 'functions' \) 2>/dev/null || true)
if [ -n "$reserved" ]; then
  echo "error: refusing to publish reserved Cloudflare/Pages paths:" >&2
  echo "$reserved" >&2
  exit 1
fi

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"
cp -R "$SPEC_DIR/." "$OUTPUT_DIR/"

# Every published path must be safe to interpolate into a Markdown link in the
# preview comment, and safe as a URL path. Reject anything else rather than
# quietly publishing it.
while IFS= read -r entry; do
  rel="${entry#"${OUTPUT_DIR%/}/"}"
  case "$rel" in
    *[!A-Za-z0-9._/-]* | *..*)
      echo "error: unsafe path in site output: '${rel}'" >&2
      echo "       published paths may only contain A-Z a-z 0-9 . _ - and /" >&2
      echo "       rename the file (no spaces or accents) and try again" >&2
      exit 1
      ;;
  esac
done < <(find "$OUTPUT_DIR" -mindepth 1)

echo "Built '${OUTPUT_DIR}' from '${SPEC_DIR}':"
find "$OUTPUT_DIR" -type f | sort