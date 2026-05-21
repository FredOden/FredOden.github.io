#!/bin/bash

set -e

ROOT="lourah_site"
rm -rf "$ROOT"
mkdir -p "$ROOT"

# Helper to write files
write() {
  mkdir -p "$(dirname "$ROOT/$1")"
  cat > "$ROOT/$1"
}

#############################################
# ROOT FILES
#############################################

write "index.md" << 'EOF'
# Welcome

This website gathers my personal and technical activities.  
Some parts are structured, others are still evolving — and that is exactly how I like to work: exploring, experimenting, building, refining.

I enjoy software development, creative problem‑solving, and designing tools that make devices do unexpected things.  
Some of these projects became full ecosystems, such as **LourahJs**, while others remain prototypes or experiments.

## My Software Activity
👉 [My Software Activity](/my-software-activity/)

## My GitHub
👉 [My GitHub](/my-software-activity/my-github/)

## LourahJs Ecosystem
👉 [LourahJs Ecosystem](/my-software-activity/my-github/lourahjs-ecosystem/)
EOF

write "_config.yml" << 'EOF'
title: Lourah
theme: just-the-docs

url: "https://lourah.com"

color_scheme: "dark"

logo: "/assets/logo.svg"

aux_links:
  "GitHub":
    - "https://github.com/FredOden"

search_enabled: true

sass:
  load_paths:
    - assets
EOF

#############################################
# ASSETS (SVG PLACEHOLDERS)
#############################################

mkdir -p "$ROOT/assets"

# Logo
cat > "$ROOT/assets/logo.svg" << 'EOF'
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <rect width="200" height="200" fill="#66aaff"/>
  <text x="100" y="120" font-size="80" text-anchor="middle" fill="#000">L</text>
</svg>
EOF

# Favicon
cat > "$ROOT/assets/favicon.svg" << 'EOF'
<svg width="64" height="64" xmlns="http://www.w3.org/2000/svg">
  <circle cx="32" cy="32" r="28" fill="#66aaff"/>
  <text x="32" y="40" font-size="32" text-anchor="middle" fill="#000">L</text>
</svg>
EOF

# Banner
cat > "$ROOT/assets/banner.svg" << 'EOF'
<svg width="800" height="200" xmlns="http://www.w3.org/2000/svg">
  <rect width="800" height="200" fill="#111"/>
  <text x="400" y="120" font-size="48" text-anchor="middle" fill="#66aaff">
    LourahJs Ecosystem
  </text>
</svg>
EOF

# Custom CSS
write "assets/custom.css" << 'EOF'
:root {
  --brand-color: #66aaff;
  --sidebar-color: #111;
  --body-background-color: #000;
}
EOF

#############################################
# MY SOFTWARE ACTIVITY
#############################################

write "my-software-activity/index.md" << 'EOF'
# My Software Activity

This section presents my software‑related work: engines, libraries, tools, experiments, and long‑term projects.

👉 [My GitHub](/my-software-activity/my-github/)  
👉 [LourahJs Ecosystem](/my-software-activity/my-github/lourahjs-ecosystem/)  
👉 [Archives](/my-software-activity/archives/)  
👉 [Inspirations](/my-software-activity/inspirations/)
EOF

#############################################
# MY GITHUB
#############################################

write "my-software-activity/my-github/index.md" << 'EOF'
# My GitHub

This section organizes my GitHub repositories into categories.

👉 [LourahJs Ecosystem](/my-software-activity/my-github/lourahjs-ecosystem/)
EOF

#############################################
# LOURAHJS ECOSYSTEM
#############################################

write "my-software-activity/my-github/lourahjs-ecosystem/index.md" << 'EOF'
# LourahJs Ecosystem

The LourahJs ecosystem is a complete environment for developing Android applications using JavaScript.

👉 [Engine Documentation](engine/)  
👉 [LourahJs Libraries & Apps](js/)  
👉 [API Reference](api/)  
👉 [Tutorials](tutorials/)  
👉 [Reference](reference/)
EOF

#############################################
# ENGINE
#############################################

write "my-software-activity/my-github/lourahjs-ecosystem/engine/index.md" << 'EOF'
# LourahJsEngine

👉 [Architecture](architecture.md)  
👉 [Bootstrap Process](bootstrap.md)  
👉 [Java API](api-java.md)  
👉 [Embedded JS Modules](modules-assets.md)
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/engine/architecture.md" << 'EOF'
# Engine Architecture

LourahJsEngine is composed of three main layers:

## 1. Java Layer
- Rhino initialization  
- Android Activity integration  
- Java classes exposed to JavaScript  

## 2. Embedded JavaScript Layer
- bootstrap.js  
- lourah.js  
- modules/*  

## 3. User Script Layer
Scripts located in `/storage/emulated/0/LourahJs/`.
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/engine/bootstrap.md" << 'EOF'
# Bootstrap Process

The engine loads and executes JavaScript files from the `assets/` directory:

1. bootstrap.js  
2. lourah.js  
3. modules/*  
4. User script
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/engine/api-java.md" << 'EOF'
# Java API Exposed to JavaScript

Examples:

- `Lourah.android.Activity`
- `Lourah.android.Intent`
- `Lourah.fs.File`
- `Lourah.ui.*`
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/engine/modules-assets.md" << 'EOF'
# Embedded JavaScript Modules

The `assets/` directory contains:

- bootstrap.js  
- lourah.js  
- modules/ui.js  
- modules/fs.js  
- modules/net.js  
EOF

#############################################
# JS LIBRARIES & APPS
#############################################

write "my-software-activity/my-github/lourahjs-ecosystem/js/index.md" << 'EOF'
# LourahJs Libraries & Applications

👉 [Lourah FX](lourah-fx.md)  
👉 [Lourah IDE X](lourah-ide-x.md)  
👉 [DemoJs](demojs.md)  
👉 [Checklist](checklist.md)  
👉 [Covid‑19](covid19.md)  
👉 [JSFWords](jsfwords.md)
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/js/lourah-fx.md" << 'EOF'
# Lourah FX

A graphical library providing UI abstractions for Android.
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/js/lourah-ide-x.md" << 'EOF'
# Lourah IDE X

A JavaScript development environment running directly on Android.
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/js/demojs.md" << 'EOF'
# DemoJs

Examples demonstrating how to use the LourahJs environment.
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/js/checklist.md" << 'EOF'
# Checklist

A simple application built with LourahJs.
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/js/covid19.md" << 'EOF'
# Covid‑19

An experimental application built with LourahJs.
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/js/jsfwords.md" << 'EOF'
# JSFWords

A word‑based application built with LourahJs.
EOF

#############################################
# API
#############################################

write "my-software-activity/my-github/lourahjs-ecosystem/api/index.md" << 'EOF'
# API Reference

👉 [Java API](api-java.md)  
👉 [JavaScript API](api-js.md)
EOF

write "my-software-activity/my-github/lourahjs-ecosystem/api/api-js.md" << 'EOF'
# JavaScript API

Namespaces:

- `Lourah.ui`
- `Lourah.fs`
- `Lourah.net`
- `Lourah.thread`
EOF

#############################################
# TUTORIALS
#############################################

write "my-software-activity/my-github/lourahjs-ecosystem/tutorials/index.md" << 'EOF'
# Tutorials

👉 Your First App  
👉 UI Basics  
👉 File Access  
👉 Using Lourah IDE X
EOF

#############################################
# REFERENCE
#############################################

write "my-software-activity/my-github/lourahjs-ecosystem/reference/index.md" << 'EOF'
# Reference

👉 Module List  
👉 Glossary
EOF

#############################################
# ARCHIVES & INSPIRATIONS
#############################################

write "my-software-activity/archives/index.md" << 'EOF'
# Archives

Older projects and prototypes.
EOF

write "my-software-activity/inspirations/index.md" << 'EOF'
# Inspirations

Ideas, notes, and future directions.
EOF

#############################################
# CREATE TAR ARCHIVE
#############################################

tar -czvf lourah_site.tar.gz "$ROOT"

echo "Done. Archive created: lourah_site.tar.gz"
