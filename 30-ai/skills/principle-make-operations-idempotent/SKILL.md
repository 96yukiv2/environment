---
name: principle-make-operations-idempotent
description: 操作を冪等にする。再試行やクラッシュが発生する処理では、同じ操作を繰り返しても目的の状態に収束するようにする。
disable-model-invocation: true
---

# 操作を冪等にする（Make Operations Idempotent）

原典: https://github.com/cursor/plugins/blob/main/pstack/skills/principle-make-operations-idempotent/SKILL.md

再試行やクラッシュが発生する処理では、同じ操作を繰り返しても目的の状態に収束するようにする。

## 適用

この原則が関連する作業を行うとき、原典の判断基準を優先し、変更内容と実際に確認した証拠を記録する。作業権限についてはルートのAGENTS.mdを優先する。
