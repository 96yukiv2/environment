#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
repo_dir="$(cd "$script_dir/.." && pwd -P)"
source_dir="$repo_dir/30-ai/skills"
target_dir="$HOME/.cursor/skills"

link_owned() {
  local source="$1" target="$2" name="$3" backup
  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
    printf 'OK: %s\n' "$name"
    return
  fi
  mkdir -p "$(dirname "$target")"
  if [[ -e "$target" || -L "$target" ]]; then
    backup="$target.environment-backup-$(date +%Y%m%d%H%M%S)-$$"
    if [[ -e "$backup" || -L "$backup" ]]; then
      printf 'Backup already exists: %s\n' "$backup" >&2
      return 1
    fi
    mv "$target" "$backup"
    printf 'BACKUP: %s -> %s\n' "$name" "$backup"
  fi
  ln -s "$source" "$target"
  printf 'LINK: %s\n' "$name"
}

[[ -d "$source_dir" ]] || { printf 'Skills directory not found: %s\n' "$source_dir" >&2; exit 1; }
mkdir -p "$target_dir"
for source in "$source_dir"/*; do
  [[ -d "$source" && -s "$source/SKILL.md" ]] || continue
  link_owned "$source" "$target_dir/${source##*/}" "${source##*/}"
done

playbook_src="$repo_dir/30-ai/playbooks"
[[ -d "$playbook_src" ]] || { printf 'Playbooks directory not found: %s\n' "$playbook_src" >&2; exit 1; }
link_owned "$playbook_src" "$HOME/.cursor/playbooks" "playbooks"

agent_src="$repo_dir/30-ai/agents/comment-sicko.md"
if [[ -f "$agent_src" ]]; then
  link_owned "$agent_src" "$HOME/.cursor/agents/comment-sicko.md" "comment-sicko agent"
fi

printf 'Done. Restart Cursor if it does not show the new skills.\n'
