---
name: workflow-router
description: ユーザーが開発作業、調査、バグ修正、機能追加、リファクタリング、性能改善、PR対応、引き継ぎ、Skill作成を依頼したときに、該当するpstack Playbookを選んで読む。
---

# Workflow router

開発作業を開始する際に、作業全体の進め方を定めるPlaybookが必要か判断する。

原典: https://github.com/cursor/plugins/tree/main/pstack/skills/poteto-mode/playbooks

## 読み込み場所

このSkillと同じリポジトリを使っている場合は `30-ai/playbooks/` を参照する。Cursorのグローバル環境では `~/.cursor/playbooks/` のシンボリックリンク先を参照する。

PlaybookのファイルはCursorが標準で自動検出するSkillではない。**作業前に適切なファイルを明示的に開いて内容を読み、その手順に従う。** ディレクトリが存在しない、リンクが壊れている、読み取り不可の場合は、その制約を報告する。

## 作業からPlaybookを選ぶ

| 依頼 | Playbook |
|---|---|
| コードや仕様の調査、仕組みの説明 | investigation.md |
| 不具合を再現・修正 | bug-fix.md |
| 新機能の追加 | feature.md |
| 振る舞いを維持した構造整理 | refactoring.md |
| 方向性を比較する試作品 | prototype.md |
| 一回の性能問題調査・改善 | perf-issue.md |
| 実行中プロセスのプロファイリング | runtime-forensics.md |
| 取得済みプロファイルやトレースの分析 | trace-forensics.md |
| 数値目標へ反復改善 | hillclimb.md |
| UIの見た目を移行前後で一致 | visual-parity.md |
| AI設定・Skills・候補の比較評価 | eval.md |
| Skillの作成・改良 | authoring-a-skill.md |
| 終了条件までの自律実行 | autonomous-run.md |
| 複数PRを管理しマージまで進める | autopilot-full.md |
| 複数PRをマージせず引き渡す | autopilot-stack.md |
| PRのレビュー・CI対応 | babysit.md |
| PRの作成 | opening-a-pr.md |
| 検証済みPRのマージ | shipping.md |
| 中断した作業の再開 | session-pickup.md |
| 作業の安全な一時停止 | pause-safely.md |
| 複数フェーズ・PRの計画 | multi-phase-plan.md |
| worktreeや生成物の整理 | worktree-cleanup.md |

必要な手順が見当たらない複雑な仕事は `figure-it-out` Skillを使う。

## 実行ルール

1. 作業の目的と変更範囲を確認する。
2. 上の表から最も適したPlaybookを一つ選ぶ。複数必要なら役割と実行順序を説明する。
3. **選んだPlaybookの実ファイルを読み**、参照先のSkillsも必要に応じて読む。
4. 実行する段階と検証方法を定める。
5. 各段階を実行・検証し、未検証を成功とみなさない。
6. 最終報告では利用したPlaybookと、検証できた結果を示す。

Git操作、外部サービス操作、削除などはPlaybookに記載されていても自動的に許可されたと解釈しない。作業対象のAGENTS.mdの権限規則とユーザーの明示的な指示を優先する。

サブエージェントやCursor固有機能がない場合は、実行できる範囲で代替し、未実行の手順を明示する。
