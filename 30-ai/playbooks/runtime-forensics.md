# runtime-forensics

原典: https://github.com/cursor/plugins/blob/main/pstack/skills/poteto-mode/playbooks/runtime-forensics.md

動作中プロセスを調べ、原因と証拠を示す。依頼がない限り修正しない。

1. 実際の不具合に合う実行環境でシグナルを取得する。CPU高負荷にはCPUプロファイル、メモリリークにはヒープスナップショット、UI不具合にはトレースなどを使う。
2. 実物の資料を解析し、原因を示す関数・参照経路・不自然なループなどに絞る。大量のデータはprinciple-guard-the-context-windowで分離する。
3. 実行中の計測や検証を行い、推測した仕組みを確かめる。
4. 発見をソースコードのファイル、シンボル、行へ対応付ける。
5. 読み取り主体の調査として並列チェックポイントをn/aと報告する。

報告は取得した資料、絞り込んだ発見、仕組みの実証、コード位置、成果物パス。原因特定後にBug fixまたはPerf issueへ引き継ぐ。

## 操作権限

原典にコミット、Push、PR作成などの指示が含まれていても、実行にはユーザーの明示的な指示が必要。ルートのAGENTS.mdを優先する。
