#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
repo_dir="$(cd "$script_dir/.." && pwd -P)"
source_dir="$repo_dir/30-ai/skills"
target_dir="$HOME/.cursor/skills"

[[ -d "$source_dir" ]] || { printf 'Skills directory not found: %s\n' "$source_dir" >&2; exit 1; }
mkdir -p "$target_dir"

for source in "$source_dir"/*; do
  [[ -d "$source" && -s "$source/SKILL.md" ]] || continue
  name="${source##*/}"
  target="$target_dir/$name"
  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
    printf 'OK: %s\n' "$name"
    continue
  fi
  if [[ -e "$target" || -L "$target" ]]; then
    printf 'SKIP (exists): %s\n' "$target" >&2
    continue
  fi
  ln -s "$source" "$target"
  printf 'LINK: %s\n' "$name"
done

playbook_src="$repo_dir/30-ai/playbooks"
playbook_target="$HOME/.cursor/playbooks"
if [[ ! -d "$playbook_src" ]]; then
  printf 'Playbooks directory not found: %s\\n' "$playbook_src" >&2
  exit 1
fi

if [[ -L "$playbook_target" && "$(readlink "$playbook_target")" == "$playbook_src" ]]; then
  printf 'OK: playbooks\\n'
elif [[ -e "$playbook_target" || -L "$playbook_target" ]]; then
  printf 'SKIP (exists): %s\\n' "$playbook_target" >&2
else
  ln -s "$playbook_src" "$playbook_target"
  printf 'LINK: playbooks\\n'
fi

agent_src="$repo_dir/30-ai/agents/comment-sicko.md"
agent_target="$HOME/.cursor/agents/comment-sicko.md"
if [[ -f "$agent_src" ]]; then
  mkdir -p "$(dirname "$agent_target")"
  if [[ ! -e "$agent_target" && ! -L "$agent_target" ]]; then
    ln -s "$agent_src" "$agent_target"
    printf 'LINK: comment-sicko agent\n'
  fi
fi

printf 'Done. Restart Cursor if it does not show the new skills.\n'
