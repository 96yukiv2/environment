# opening-a-pr

原典: https://github.com/cursor/plugins/blob/main/pstack/skills/poteto-mode/playbooks/opening-a-pr.md

ほかのPlaybookの最後に参照されるPR作成手順。**実際のPR作成、コミット、Pushは依頼された場合だけ行う。**

作業は無関係な差分のない独立した作業領域で管理し、検証可能な小さな変更単位へ整理する。原典が求めるdeslopなど外部Skillが利用できない場合は、unslop、no-comments、差分確認で代替し、代替したことを報告する。

PRタイトルは `type(scope): subject`。本文は40行以内を目安に、必要な見出しを以下の順番で置く。

- Why
- What changed
- Scope
- Tradeoffs（判断に関係する却下案のみ）
- Blast Radius
- Verification

後続PRに依存がある場合はベースブランチを正しく設定する。PRはレビュー可能な通常状態で開き、Draftにはしない。PR作成は監視の自動開始を意味しない。

## 操作権限

原典の実行権限に関する指示より、ルートのAGENTS.mdを優先する。外部プラグインやCursor固有の機能がない場合は、実施したふりをせず、利用できる検証方法と制約を報告する。
