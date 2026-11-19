# investigation

原典: https://github.com/cursor/plugins/blob/main/pstack/skills/poteto-mode/playbooks/investigation.md

調査依頼は読み取り専用。コード変更ではなく、根拠を示す説明・提案を成果物とする。

1. 対象のコードと実行経路を追う。設計の動機を尋ねられている場合はwhyを使用する。
2. 並列処理の進捗チェックには「throughput checkpoint: n/a, read-only investigation」と一行で記す。
3. Overview / Key Concepts / How It Works / Where Things Live / Gotchas の順に説明する。選択肢を比較するときはトレードオフ表を用いる。
4. 回答にunslopを適用する。

調査だけならPRは作らない。コード変更に進む場合はBug fixかFeatureへ切り替える。前提が誤っていれば根拠を示して異議を述べる。

## 操作権限

原典にコミット、Push、PR作成などの指示が含まれていても、実行にはユーザーの明示的な指示が必要。ルートのAGENTS.mdを優先する。
