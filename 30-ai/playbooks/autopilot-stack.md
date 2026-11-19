# autopilot-stack

原典: https://github.com/cursor/plugins/blob/main/pstack/skills/poteto-mode/playbooks/autopilot-stack.md

autopilot-fullの検証手順を使うが、マージは行わず、検証を終えたPRを利用者へ引き渡す。

1. autopilot-fullのマージ段階で停止する。各PRが検証済みで現在のHEADに対するCIが成功していることを確認する。引き渡し後のPushは新たな許可がなければ行わない。
2. PRの依存がある場合だけ縦に積む。上位PRは下位PRブランチを基準にし、下位が更新されたら上位を再配置する。再配置してもパッチIDが変わらない場合は有効な検証結果を再利用できる。

報告は各PRの検証結果と、マージせず残した項目を示す。すべての操作でAGENTS.mdの明示的許可を優先する。

## 操作権限

原典の実行権限に関する指示より、ルートのAGENTS.mdを優先する。外部プラグインやCursor固有の機能がない場合は、実施したふりをせず、利用できる検証方法と制約を報告する。
