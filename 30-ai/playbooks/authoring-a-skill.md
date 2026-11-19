# authoring-a-skill

原典: https://github.com/cursor/plugins/blob/main/pstack/skills/poteto-mode/playbooks/authoring-a-skill.md

Skillの構造と読みやすさに責任を持つ。

1. 利用できる場合はCursor標準のcreate-skillでSKILL.mdを作成・変更する。
2. frontmatterにname、descriptionがあるかを検証する。参照ファイルが存在し、Skill間リンクが解決することを確認する。
3. 構造的なSkillには実行可能なテストケースを作る。主観的な内容なら無理にテストを増やさない。
4. 明示的にPR作成を依頼されている場合はopening-a-prを実行する。

意味のある判断を変えない文章は削る。手順を直接指示し、理由がないと混乱する場合のみ補足する。型、README、設定といった構造的な情報を正本にする。繰り返し遭遇する作業は新しいSkillに分離することを検討する。

報告はSkillの要約、設計上の選択、検証結果。

## 操作権限

原典の実行権限に関する指示より、ルートのAGENTS.mdを優先する。外部プラグインやCursor固有の機能がない場合は、実施したふりをせず、利用できる検証方法と制約を報告する。
