
# Lua Folder

This folder contains Lua scripts that are generally applicable and not specifically tailored for the Roblox LuaU environment.

## Scripts Overview

### `Book-Gen.lua`

**Description:**  
This script generates a sequential list of URLs for accessing the pages of an electronic book. It automates the creation of URLs based on page numbers, and prints them, which could be useful for batch downloading or automated access to serialized content.

**Key Functions:**  
- `CreateFE(k, v)`: Associates a page number with a URL.
- `GenerateURLS(x)`: Generates a URL for a given page number and stores it.
- `PrintURLS()`: Iterates through all desired page numbers, generates their URLs, and prints them.

This script is useful for anyone needing to programmatically access a large number of web-hosted book pages.

## Usage

To run any script in this folder, ensure Lua is properly installed on your system, navigate to the script's directory, and execute:

```bash
lua Book-Gen.lua.lua
```

Replace `Book-Gen.lua` with the name of the script you want to run.
