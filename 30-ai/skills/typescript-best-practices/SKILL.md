---
name: typescript-best-practices
description: TypeScriptの型・境界・テストに関するルール。.ts/.tsxを扱うときに適用する。
disable-model-invocation: true
---

# TypeScript best practices

原典: https://github.com/cursor/plugins/blob/main/pstack/skills/typescript-best-practices/SKILL.md

先にprinciple-type-system-disciplineを読む。

- 判別可能なUnionを使い、optionalだらけの状態オブジェクトを避ける。
- 同じプリミティブ型でも意味の異なる値はブランド型で区別し、境界で一度検証する。
- 空であってはならない配列やペアなどは構造で不正な値を表せないようにする。
- 操作が全域で安全な場合は過度に型を強くしない。
- 外部データはanyではなくunknownとし、境界で絞り込む。
- 既存のスキーマライブラリを優先し、スキーマから型を導出する。
- asキャストの前に型が正しいことを検証する。
- Unionのswitchでは全分岐を網羅し、neverで漏れを検出する。
- satisfiesを活用し、リテラル型を維持する。
- 内部で重複した検証を行わない。
- Pick、Omit、Parameters、ReturnTypeなどで既存定義から型を導出する。
- 引数が多いAPIでは順序を誤らないオブジェクト引数を使う。高頻度の処理では割り当てコストを考慮する。
- 実物で検証できるものを不要にMockしない。構造化ログを優先する。

詳細とコード例はreferences/patterns.mdを参照する。
