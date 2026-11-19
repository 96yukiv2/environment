# 作業フロー

## 参照順序

```mermaid
flowchart TD
    A["開発依頼"] --> B["AGENTS.md<br/>原則・権限"]
    B --> C["workflow-router<br/>作業を分類"]
    C --> D["Playbook<br/>進め方を確認"]
    D --> E["Skills<br/>必要な手順を実行"]
    E --> F["実物で検証・報告"]
    F -. "必要なら再調査" .-> E
```

- **[AGENTS.md](../../AGENTS.md)**：共通の開発原則と作業権限。
- **[workflow-router](../skills/workflow-router/SKILL.md)**：依頼に対応したPlaybookを選ぶ。
- **[Playbooks](../playbooks/)**：作業全体の流れ。例：調査→修正→検証。
- **[Skills](../skills/)**：各段階で使う技法。単独でも利用できる。

## 例：バグ修正

```mermaid
flowchart TD
    A["バグ修正の依頼"] --> B["bug-fix.md<br/>再現・調査・修正・検証"]
    B --> C["不具合を再現し原因を特定"]
    C --> D["why<br/>必要なら履歴を調査"]
    D --> E["architect<br/>設計変更が必要なら使用"]
    E --> F["tdd<br/>実用的な再現テストを作る"]
    F --> G["修正後に同じ条件で再検証"]
    G --> H["blast-radius<br/>変更の影響範囲を確認"]
    H --> I["結果を報告"]
```

ここに示すSkillsは使用例であり、毎回すべてを実行するわけではない。調査だけなら[investigation](../playbooks/investigation.md)と[how](../skills/how/SKILL.md)、文書の改善なら[technical-writing](../skills/technical-writing/SKILL.md)など、作業に必要なものを選ぶ。
