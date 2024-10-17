#!/bin/sh
echo -ne '\033c\033]0;I am a poor balloon trying to survive an endless rain of blades - Godot 4\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/I am a poor balloon trying to survive an endless rain of blades - Godot 4.x86_64" "$@"
