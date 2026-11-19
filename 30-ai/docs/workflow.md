# 作業フロー

## 依頼から検証まで

```mermaid
flowchart TD
    A["人間が自然な言葉で依頼"] --> B["目的・既知情報・制約を整理"]
    B --> C{"成功条件は明確か"}
    C -->|"明確"| F["Playbookを選択"]
    C -->|"不足"| D{"人間の製品判断が必要か"}
    D -->|"不要"| E["AIが調査して検証条件を提案"]
    D -->|"必要"| H["選択肢・推奨案を示す"]
    H --> I["人間が決定"]
    E --> F
    I --> F
    F --> G["必要なSkillsで実装・調査"]
    G --> J["実動作と証拠で検証"]
    J --> K["結果を日本語で報告"]
    J -. "未達なら原因を調査" .-> G
```

[AGENTS.md](../../AGENTS.md) が共通原則と権限を定める。[workflow-router](../skills/workflow-router/SKILL.md) がPlaybookを選び、各段階で必要なSkillsを使う。人間は目的と製品判断を担当し、AIは調査・実装・検証方法を提案する。

## 例：バグ修正

```mermaid
flowchart TD
    A["バグ修正の依頼"] --> B["bug-fix.md を読む"]
    B --> C["症状を再現し原因を特定"]
    C --> D["必要なら why・architect・tdd"]
    D --> E["修正と再現条件での再検証"]
    E --> F["blast-radius で影響範囲を確認"]
    F --> G["検証結果を報告"]
```

使うSkillは課題に応じて選ぶ。[依頼の書き方](prompting.md) と [Skills・Playbooks一覧](../README.md) を参照する。
