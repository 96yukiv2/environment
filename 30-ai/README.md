# Skills

Lauren Tanの[pstack](https://github.com/cursor/plugins/tree/main/pstack)を基に、日本語化・環境向けに調整したSkillsとPlaybooks。共通の開発原則と作業権限は[AGENTS.md](../AGENTS.md)に記載する。

## SkillsとPlaybooksの違い

**Skills**は、特定の能力や判断手順を使い回すための定義。例えば`architect`は設計案の比較、`tdd`は失敗するテストからのバグ修正、`blast-radius`は影響調査を担当する。単独でも、別のSkillやPlaybookからも利用できる。

**Playbooks**は、作業全体を最初から最後まで進めるための手順書。例えば`bug-fix`は「再現→原因特定→修正→検証」という流れを定め、その途中で`why`、`architect`、`tdd`などを利用する。

つまり、**Playbookが作業の進め方を決め、Skillsが各段階で必要な能力を提供する**。どちらもファイルを置くだけで自動実行されるわけではない。利用するAIが内容を読み込んで実行する。

## よく使うSkills

| 名前 | 何をするか | 使うタイミング |
|---|---|---|
| [how](skills/how/SKILL.md) | コードを読み、実際の処理経路、データの流れ、各モジュールの責務を説明する。原則として読み取り専用。 | 初めて触る機能の仕組みを理解したいとき。調査や改修に入る前に全体像を把握するとき。 |
| [why](skills/why/SKILL.md) | Git履歴やPRの議論などから、設計・実装がその形になった理由を調べる。コードだけから理由を決めつけない。 | 「なぜこの仕様？」「なぜこの依存関係？」など、背景や変更経緯を確認するとき。 |
| [architect](skills/architect/SKILL.md) | 変更箇所を追跡してから、型・関数シグネチャ・モジュール境界を複数案で設計し比較する。 | 新機能や既存設計の変更が関数・モジュールをまたぐとき。実装前に責務や状態の持ち方を決めたいとき。 |
| [tdd](skills/tdd/SKILL.md) | 不具合を再現する失敗テストを先に用意し、修正後に同じテストが成功することを確かめる。 | 再現が容易で、安価な自動テストを書けるバグ修正。テスト先行を明示的に求めるとき。 |
| [blast-radius](skills/blast-radius/SKILL.md) | 差分外の呼び出し元や依存関係まで調べ、変更の影響と安全性に関する前提を実行で検証する。 | リファクタリング、API変更、共通処理の修正など、思わぬ場所の破損が心配なとき。 |
| [technical-writing](skills/technical-writing/SKILL.md) | Tutorial・How-to・Reference・Explanationを区別し、明確な技術文書へ整える。unslopと組み合わせる。 | README、設計資料、API説明、手順書、PR説明を書く・見直すとき。 |

## 必要に応じて使うSkills

| 名前 | 何をするか | 使うタイミング |
|---|---|---|
| [interrogate](skills/interrogate/SKILL.md) | 独立した観点から変更を攻撃的にレビューし、コマンドや再現テストで証明できた欠陥だけを報告する。修正は適用しない。 | 大きな変更のレビュー、設計の弱点探し、複数視点で反証したいとき。 |
| [correct](skills/correct/SKILL.md) | 繰り返し発生するミスを履歴から分類し、設計・型・Lint・テストによって再発不能に近づける。 | AIが同じ間違いを何度も繰り返すとき。注意書きを増やすより仕組みを直したいとき。 |
| [figure-it-out](skills/figure-it-out/SKILL.md) | 既存の手順に当てはまらない作業について、完了条件・実験・検証・判断記録を含む進め方を設計する。 | 長期移行、複数段階の開発、解決方法が決まっていない大きな課題に取り組むとき。 |
| [arena](skills/arena/SKILL.md) | 同じ課題を独立した複数案で解き、具体的な評価基準で比較して良い部分を統合する。 | 実装・設計の選択肢が複数あり、最初の案に決め打ちしたくないとき。複数エージェントを使える環境向け。 |
| [swarm](skills/swarm/SKILL.md) | 独立した調査・実装・検証を複数担当に分け、結果と不足箇所を一つにまとめる。 | 対象範囲が広く、作業を並行して進められるとき。共有ファイルを同時編集しないよう分離できるとき。 |

## 補助Skills

ほかのSkillsやPlaybooksから呼び出されることが多いが、直接指定しても利用できる。

| 名前 | 何をするか | 使うタイミング |
|---|---|---|
| [in-your-own-words](skills/in-your-own-words/SKILL.md) | 依頼の背後にある目的と解決すべき問題を、自分の言葉で捉え直す。 | 作業開始時、依頼の意図を整理するとき。interrogateなどからも参照する。 |
| [unslop](skills/unslop/SKILL.md) | 冗長な表現、曖昧な主張、AIらしい定型句などを除き、意味を維持して推敲する。 | 回答、README、PR説明などを仕上げるとき。technical-writingからも利用する。 |
| [no-comments](skills/no-comments/SKILL.md) | 不要なコメント、回避策やチェック抑制を点検し、説明で隠している設計上の問題を探す。 | コードレビュー前、不要なコメントを削除・構造へ移せないか検討するとき。専用エージェントの利用を想定。 |
| [benchmark-checklist](skills/benchmark-checklist/SKILL.md) | 測定条件・エラー・再現性・全体効果・計測対象を確認し、性能数値を信用できるか判定する。 | 速度改善や性能比較の数値を測る・発表する直前。 |
| [show-me-your-work](skills/show-me-your-work/SKILL.md) | 作業中の重要な判断、理由、根拠、結果をTSVに追記し、後から追跡できるようにする。 | 長期間の作業、並列作業、後から第三者が判断を確認する必要があるとき。 |
| [typescript-best-practices](skills/typescript-best-practices/SKILL.md) | 型の表現、外部入力の検証、網羅性、型アサーションの削減などを扱う。 | TypeScriptの型設計や実装修正時。principle-type-system-disciplineを補完する。 |

## 開発原則

`skills/principle-*/SKILL.md`に24件の原則Skillsを配置している。共通の判断基準は[AGENTS.md](../AGENTS.md)にまとめ、具体的な原則は関連するSkillから参照する。

特に`principle-fix-root-causes`（根本原因を修正）、`principle-laziness-protocol`（余分な変更を避ける）、`principle-prove-it-works`（実際の成果物で動作を証明）は多くの作業に関わる。

## Playbooks

手順書は`30-ai/playbooks/`に配置している。**Playbook名は作業の種類を表すもので、名前だけで役割が分かりにくいため、日本語の説明と使うタイミングを併記する。**

### 調査・設計・実装

| 名前 | 何をするか | 使うタイミング |
|---|---|---|
| [investigation](playbooks/investigation.md) | コード・仕様の読み取り調査。変更せず、処理の全体像や根拠を報告する。 | 「この処理はどう動く？」「実装案を調べて」など、まだ修正しない調査段階。 |
| [bug-fix](playbooks/bug-fix.md) | 症状の再現、仮説の切り分け、原因の実証、修正、同じ条件での再検証を順に行う。 | 再現できる不具合を、場当たり的なガードでなく根本原因から直したいとき。 |
| [feature](playbooks/feature.md) | 既存構造の調査、設計、作業分割、実装、実機での動作確認までを管理する。 | 仕様が決まった新機能を開発するとき。 |
| [refactoring](playbooks/refactoring.md) | 現状の振る舞いをテスト等で固定してから構造を整理し、変更前後の等価性を検証する。 | 外部仕様を変えずに内部構造を改善したいとき。 |
| [prototype](playbooks/prototype.md) | 本番コードと分離した試作品を複数作り、実際の表示・動作から案を比較する。 | UIや設計上の選択肢を、実装前に短時間で比べたいとき。 |

### 性能・実行時調査・検証

| 名前 | 何をするか | 使うタイミング |
|---|---|---|
| [perf-issue](playbooks/perf-issue.md) | 実測で遅延箇所を特定し、改善前後を同じ条件で比較して原因と効果を示す。 | 特定処理や画面の遅さを一度の修正で改善したいとき。 |
| [runtime-forensics](playbooks/runtime-forensics.md) | 実行中のプロセスからCPU・メモリ・トレースなどを取得して原因を特定する。 | CPUの高負荷、メモリリーク、実行時だけ起きる異常を調べるとき。 |
| [trace-forensics](playbooks/trace-forensics.md) | すでに取得済みのプロファイルやトレースを解析し、原因をソースコードまで追う。 | cpuprofile、heapsnapshot、spindumpなどの調査資料が手元にあるとき。 |
| [hillclimb](playbooks/hillclimb.md) | 一つの指標を、仮説→一変更→測定→採用または撤回の反復で改善する。 | 継続的な高速化や性能目標の達成など、何度も試行して数値を伸ばすとき。 |
| [visual-parity](playbooks/visual-parity.md) | 変更前の画面を基準に、スクリーンショットのピクセル差分で一致を確認する。 | フロントエンド移行やUI再実装で見た目を維持したいとき。 |
| [eval](playbooks/eval.md) | AIの異なる設定・Skills・手順を、候補に評価目的を知らせず同一条件で比較する。 | Skillsが実際に品質を改善するか、複数のAI設定を公平に比較したいとき。 |

### Skills作成・自律実行・PR管理

| 名前 | 何をするか | 使うタイミング |
|---|---|---|
| [authoring-a-skill](playbooks/authoring-a-skill.md) | Skillの目的、frontmatter、参照先、検証方法を整え、再利用可能な手順にする。 | 新しいSKILL.mdを作成・改善するとき。 |
| [autonomous-run](playbooks/autonomous-run.md) | 検証可能な終了条件を決め、進捗を繰り返し確認しながら作業を続ける。 | 長い作業を明示的な完了条件まで進めたいとき。利用環境の自動実行機能が必要。 |
| [autopilot-full](playbooks/autopilot-full.md) | 複数PRを独立して実装・検証し、許可を得た範囲だけマージまで統括する。 | 複数PRからなる変更を、人間の許可と検証を前提に一括管理したいとき。 |
| [autopilot-stack](playbooks/autopilot-stack.md) | 複数PRを依存順に整え、検証後にマージせず人間へ引き渡す。 | 積み重ねたPRをレビュー可能な状態まで準備したいとき。 |
| [babysit](playbooks/babysit.md) | PRの衝突、レビュー指摘、CIを確認し、マージ可能になるまでの問題を整理する。 | PR作成後のレビュー・CI待ちや失敗対応を管理したいとき。 |
| [opening-a-pr](playbooks/opening-a-pr.md) | 変更を整理し、理由・変更内容・影響・検証を短くまとめたPRを用意する。 | 実装を終えてPRを作るとき。Git操作・PR作成には明示的な許可が必要。 |
| [shipping](playbooks/shipping.md) | 各PRの実機検証と差分の一致を確認し、依存順にリリース対象を反映する。 | 検証済みの複数PRを順序よくマージするとき。マージには明示的な許可が必要。 |

### 引き継ぎ・作業計画・整理

| 名前 | 何をするか | 使うタイミング |
|---|---|---|
| [session-pickup](playbooks/session-pickup.md) | 前回の判断記録、Git履歴、未完了作業を読み、同じ調査を繰り返さず再開する。 | 別セッションや別エージェントに作業を引き継ぐとき。 |
| [pause-safely](playbooks/pause-safely.md) | 安全な境界で作業を止め、差分と再開に必要な記録を残す。 | 作業を一時停止し、後日続きから再開したいとき。 |
| [multi-phase-plan](playbooks/multi-phase-plan.md) | 実装せず、PR単位の依存関係、実装順、検証条件を備えた計画を作る。 | 大きな変更を複数フェーズ・PRに分けて先に計画したいとき。 |
| [worktree-cleanup](playbooks/worktree-cleanup.md) | 使用中・未コミットの作業を識別し、安全性を確認してworktreeや不要データを整理する。 | 作業ツリーが増えて容量を圧迫しているとき。削除には事前確認が必要。 |

### 使い分けの例

- **コードを理解したい**：`how`。調査全体の報告形式も必要なら`investigation` Playbook。
- **不具合を直したい**：`bug-fix` Playbook。必要に応じて`why`、`architect`、`tdd`、`blast-radius`を利用。
- **機能を追加したい**：`feature` Playbook。設計には`architect`、複数案の比較には`arena`。
- **内部構造だけ整理したい**：`refactoring` Playbook。事前に振る舞いを固定し、後から差分を検証。
- **READMEを書き直したい**：`technical-writing` Skillと`unslop` Skill。
- **Skillsの効果を比較したい**：`eval` Playbook。候補ごとの成果物を同じ条件で比較。

## Cursorでの利用

[20-scripts/cursor.sh](../20-scripts/cursor.sh)で、`~/.cursor/skills/`に各Skillへのシンボリックリンクを作成する。既存ファイルは上書きしない。

Playbooksは独立した自動検出Skillではなく、ルートの`AGENTS.md`から参照する手順書。**別プロジェクトでは、このリポジトリの`AGENTS.md`やPlaybooksが自動適用されるとは限らない**ため、対象プロジェクト側でも参照先を設定する必要がある。

公式pstackのPlaybooksにコミット、Push、PR作成、マージが書かれていても、実際の操作は`AGENTS.md`の権限制限を優先する。

## 出典とライセンス

原典：[cursor/plugins - pstack](https://github.com/cursor/plugins/tree/main/pstack)

Copyright (c) 2026 Lauren Tan. 公式のMITライセンス全文は[LICENSE](LICENSE)に保持する。各SkillとPlaybookには対応する公式ソースへのリンクを記載している。
