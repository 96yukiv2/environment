# AI Skills

Lauren Tan の pstack を基にした日本語版の開発原則、Skills、Playbooks。

公式: https://github.com/cursor/plugins/tree/main/pstack
共通原則: [AGENTS.md](../AGENTS.md)

## よく使うSkills

| Skill | 用途 |
|---|---|
| [how](skills/how/SKILL.md) | コードの動作・責務・処理フローを調査 |
| [why](skills/why/SKILL.md) | 設計判断の経緯を履歴から調査 |
| [architect](skills/architect/SKILL.md) | 型やモジュールの設計案を比較 |
| [tdd](skills/tdd/SKILL.md) | 失敗するテストからバグを修正 |
| [blast-radius](skills/blast-radius/SKILL.md) | 変更の安全性と影響範囲を証明 |
| [technical-writing](skills/technical-writing/SKILL.md) | 技術文書の作成と改善 |

## 必要に応じて使うSkills

| Skill | 用途 |
|---|---|
| [interrogate](skills/interrogate/SKILL.md) | 実行証拠のある欠陥だけを報告 |
| [correct](skills/correct/SKILL.md) | 繰り返すミスを構造で防ぐ |
| [figure-it-out](skills/figure-it-out/SKILL.md) | 複雑な作業の手順と検証を設計 |
| [arena](skills/arena/SKILL.md) | 独立した実装候補を比較・統合 |
| [swarm](skills/swarm/SKILL.md) | 複数担当に並列で作業を分ける |

## 補助Skills

| Skill | 用途 |
|---|---|
| [in-your-own-words](skills/in-your-own-words/SKILL.md) | 目的と解決対象を言い換える |
| [unslop](skills/unslop/SKILL.md) | AIらしい不自然な文章を削る |
| [no-comments](skills/no-comments/SKILL.md) | 不要なコメントや抑制を監査 |
| [benchmark-checklist](skills/benchmark-checklist/SKILL.md) | 性能測定の妥当性をチェック |
| [show-me-your-work](skills/show-me-your-work/SKILL.md) | 作業の判断と証拠を記録 |
| [typescript-best-practices](skills/typescript-best-practices/SKILL.md) | TypeScriptの型・境界・テストの規律 |

## 開発原則

開発原則は `skills/principle-*/SKILL.md` に24件配置する。名称と判断基準はルートの [AGENTS.md](../AGENTS.md) を参照する。

## Playbooks

| 作業 | 手順書 |
|---|---|
| investigation | [investigation](playbooks/investigation.md) |
| bug-fix | [bug-fix](playbooks/bug-fix.md) |
| feature | [feature](playbooks/feature.md) |
| refactoring | [refactoring](playbooks/refactoring.md) |
| prototype | [prototype](playbooks/prototype.md) |
| perf-issue | [perf-issue](playbooks/perf-issue.md) |
| runtime-forensics | [runtime-forensics](playbooks/runtime-forensics.md) |
| trace-forensics | [trace-forensics](playbooks/trace-forensics.md) |
| hillclimb | [hillclimb](playbooks/hillclimb.md) |
| visual-parity | [visual-parity](playbooks/visual-parity.md) |
| eval | [eval](playbooks/eval.md) |
| authoring-a-skill | [authoring-a-skill](playbooks/authoring-a-skill.md) |
| autonomous-run | [autonomous-run](playbooks/autonomous-run.md) |
| autopilot-full | [autopilot-full](playbooks/autopilot-full.md) |
| autopilot-stack | [autopilot-stack](playbooks/autopilot-stack.md) |
| babysit | [babysit](playbooks/babysit.md) |
| opening-a-pr | [opening-a-pr](playbooks/opening-a-pr.md) |
| shipping | [shipping](playbooks/shipping.md) |
| session-pickup | [session-pickup](playbooks/session-pickup.md) |
| pause-safely | [pause-safely](playbooks/pause-safely.md) |
| multi-phase-plan | [multi-phase-plan](playbooks/multi-phase-plan.md) |
| worktree-cleanup | [worktree-cleanup](playbooks/worktree-cleanup.md) |

## Cursorでの利用

`20-scripts/cursor.sh` が `~/.cursor/skills/` に各Skillのシンボリックリンクを作成する。既存ファイルを上書きしない。ルートAGENTS.mdは別プロジェクトに自動伝播しないため、各プロジェクト側の共通ルール設定も必要。

## 出典とライセンス

pstack Copyright (c) 2026 Lauren Tan.
MITライセンス全文は [LICENSE](LICENSE) に保持する。各ファイルに公式の参照URLを記載する。
