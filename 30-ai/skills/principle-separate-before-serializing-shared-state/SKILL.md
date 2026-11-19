---
name: principle-separate-before-serializing-shared-state
description: 共有状態の競合を避ける。並列の処理やエージェントが同じファイル、ブランチ、キー、オブジェクトを更新する場合は、まず共有そのものを取り除けないか検討する。
disable-model-invocation: true
---

# 共有状態の競合を避ける（Separate Before Serializing Shared State）

原典: https://github.com/cursor/plugins/blob/main/pstack/skills/principle-separate-before-serializing-shared-state/SKILL.md

並列の処理やエージェントが同じファイル、ブランチ、キー、オブジェクトを更新する場合は、まず共有そのものを取り除けないか検討する。

## 適用

この原則が関連する作業を行うとき、原典の判断基準を優先し、変更内容と実際に確認した証拠を記録する。作業権限についてはルートのAGENTS.mdを優先する。
