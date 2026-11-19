#!/usr/bin/env python3
"""Check the local AI skill catalog and its documented references."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
AI = ROOT / "30-ai"
LINK = re.compile(r"(?<!!)\[[^\]]+\]\(([^)]+)\)")
NAME = re.compile(r"^name:\s*['\"]?([a-z0-9]+(?:-[a-z0-9]+)*)['\"]?\s*$", re.M)
DESCRIPTION = re.compile(r"^description:\s*(.+)$", re.M)


def local_target(source: Path, value: str) -> Path | None:
    address = value.split("#", 1)[0].strip().strip("<>")
    if not address or re.match(r"^[a-z]+:", address, re.I) or address.startswith(("/", "#")):
        return None
    return source.parent / address


def broken_links(source: Path) -> list[str]:
    content = source.read_text(encoding="utf-8")
    return [
        f"{source.relative_to(ROOT)} -> {url}"
        for url in LINK.findall(content)
        if (target := local_target(source, url)) is not None and not target.exists()
    ]


def check() -> list[str]:
    issues: list[str] = []
    skills = AI / "skills"
    playbooks = AI / "playbooks"
    seen: set[str] = set()

    if not skills.is_dir() or not playbooks.is_dir():
        return ["Missing skills/ or playbooks/ directory"]

    for folder in sorted(skills.iterdir()):
        if not folder.is_dir():
            continue
        entry = folder / "SKILL.md"
        if not entry.is_file():
            issues.append(f"Missing SKILL.md: {folder.relative_to(ROOT)}")
            continue
        content = entry.read_text(encoding="utf-8")
        match = re.match(r"\A(?:\ufeff)?---\s*\n(.*?)\n---\s*\n", content, re.S)
        if not match:
            issues.append(f"Invalid frontmatter: {entry.relative_to(ROOT)}")
            continue
        name = NAME.search(match.group(1))
        if not name or name.group(1) != folder.name:
            issues.append(f"Skill name does not match directory: {entry.relative_to(ROOT)}")
        if not DESCRIPTION.search(match.group(1)):
            issues.append(f"Missing skill description: {entry.relative_to(ROOT)}")
        if name:
            if name.group(1) in seen:
                issues.append(f"Duplicate skill name: {name.group(1)}")
            seen.add(name.group(1))

    installed_playbooks = {p.name for p in playbooks.glob("*.md")}
    if not installed_playbooks:
        issues.append("No playbooks found")

    router = skills / "workflow-router" / "SKILL.md"
    if not router.is_file():
        issues.append("Missing workflow-router")
    else:
        for name in sorted(set(re.findall(r"\|\s*([a-z][a-z0-9-]*\.md)\s*\|", router.read_text(encoding="utf-8")))):
            if name not in installed_playbooks:
                issues.append(f"Missing router playbook: {name}")

    for required in (
        AI / "skills/show-me-your-work/scripts/log.sh",
        AI / "skills/show-me-your-work/references/decision-log-template.tsv",
        AI / "skills/typescript-best-practices/references/patterns.md",
    ):
        if not required.is_file():
            issues.append(f"Missing supporting file: {required.relative_to(ROOT)}")

    # Strict checks for our own documentation, rather than external upstream text.
    docs = [ROOT / "README.md", ROOT / "AGENTS.md", AI / "README.md"]
    docs.extend((AI / "docs").rglob("*.md"))
    docs.append(router)
    for doc in docs:
        if doc.is_file():
            issues.extend(broken_links(doc))
        else:
            issues.append(f"Missing documentation: {doc.relative_to(ROOT)}")

    return issues


def self_test() -> None:
    import tempfile

    with tempfile.TemporaryDirectory() as d:
        base = Path(d)
        source = base / "test.md"
        target = base / "found.md"
        target.write_text("# Found", encoding="utf-8")
        source.write_text("[valid](found.md)\n[broken](missing.md)\n[remote](https://example.com)\n", encoding="utf-8")
        assert len([url for url in LINK.findall(source.read_text()) if (p := local_target(source, url)) is not None and not p.exists()]) == 1
        assert local_target(source, "#section") is None
    print("Self-test passed")


if __name__ == "__main__":
    if "--self-test" in sys.argv:
        self_test()
    errors = check()
    if errors:
        print("AI structure check failed:")
        for error in errors:
            print(f"- {error}")
        sys.exit(1)
    print("AI structure check passed: skill metadata, playbooks, dependencies, local documentation links")
