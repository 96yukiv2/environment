---
name: swarm
description: 複数の担当へ作業を分割・並列実行し、一つの統合報告を返す。Frame、Fan out、Aggregate、Report を管理する。
disable-model-invocation: true
---

# swarm

原典: https://github.com/cursor/plugins/blob/main/pstack/skills/swarm/SKILL.md

複数の担当へ作業を分割・並列実行し、一つの統合報告を返す。Frame、Fan out、Aggregate、Report を管理する。

## Phase A: Frame
完了条件と成果物を定義する。作業を独立した範囲へ分割するか、同じ課題で競争させるか、その組み合わせかを選ぶ。競争では最初の成功・全候補の順位付け・最良案選定のどれで判断するか先に決める。モデルの指定は使用環境に委ねる。書き込み先は担当ごとに分離する。計測では対象SHA、サンプル数、方法を指示に明記する。

## Phase B: Fan out
各担当へ独立して理解できる指示を渡す。目的、対象範囲、担当部分、検証方法、報告方法を含める。結果は PASS、ISSUES、BLOCKED と具体的な根拠を示す。脱落した担当があれば記録する。サブエージェントがない場合は順に実行する。

## Phase C: Aggregate
全結果を読み、指定SHAや測定方法を欠く結果は採用せず再確認する。作業の全範囲をカバーできたか確認する。欠落は成功と扱わない。生の報告をそのまま貼り付けず統合する。

## Phase D: Report
結果表、具体的な問題、未確認範囲、脱落、比較方式を一つにまとめて報告する。

## 実行上の制約

モデルを固定しない。ローカルの編集、Git操作、外部送信はルートのAGENTS.mdに従う。
