# CLI Tools

開発環境で使用するCLIツールの基本的な使い方。

## mise

Node.jsなどのランタイムのバージョン管理。

### インストール可能なバージョンを確認

```bash
mise ls-remote node
```

### Node.jsをインストール

```bash
mise install node@24
```

### mise.tomlを作成

プロジェクトルートに作成する。

```toml
[tools]
node = "24"
```

設定したバージョンをインストールする。

```bash
mise install
node -v
```

### バージョンを切り替える

プロジェクトルートで実行する。

```bash
mise use node@22
```

`mise.toml` のNode.jsバージョンが22に更新される。

```toml
[tools]
node = "22"
```

```bash
node -v
mise ls --current
```

### グローバルのデフォルトを設定

```bash
mise use --global node@24
```

### 一時的に別バージョンを使用

```bash
mise exec node@22 -- node -v
```

プロジェクトの設定を変更せず、指定したバージョンでコマンドを実行できる。

## ripgrep (rg)

ファイルの中身から文字列を高速検索する。

### 文字列を検索

```bash
rg "TODO"
```

カレントディレクトリ以下のファイルから `TODO` を含む行を検索し、ファイル名・行番号・該当箇所を表示する。

### ファイルの種類を指定

```bash
rg "console.log" -g "*.ts"
```

TypeScriptファイルだけを対象に `console.log` を検索する。

## fd

ファイル名やディレクトリ名を検索する。

### ファイル名を検索

```bash
fd "config"
```

名前に `config` を含むファイルやディレクトリを一覧表示する。

### 拡張子で検索

```bash
fd -e ts
```

TypeScriptファイルを一覧表示する。

## fzf

候補を対話的に絞り込むためのツール。

### コマンド履歴を検索

`Ctrl + R`

過去に実行したコマンドを検索し、選択して再利用する。

### ファイルを検索

`Ctrl + T`

ファイルを対話的に検索し、選択したパスをコマンドラインに挿入する。

### パイプで使用

```bash
fd -e ts | fzf
```

TypeScriptファイルの一覧から、目的のファイルを対話的に選択できる。

## eza

`ls` の代替として使用する。

`.zshrc` に以下のエイリアス・関数を設定している。

- `ls`：通常の一覧表示
- `ll`：詳細表示
- `la`：隠しファイルを含む詳細表示
- `lt`：ツリー表示

### ツリー表示

```bash
lt
```

デフォルトでは2階層まで表示する。

```text
.
├── src
│   ├── components
│   └── pages
├── tests
│   └── unit
└── package.json
```

### 表示階層を指定

```bash
lt 3
```

3階層まで表示する。

### ディレクトリを指定

```bash
lt 2 src
```

`src` ディレクトリを起点に2階層まで表示する。

## Lazygit

ターミナルでGitの操作を行うためのTUIツール。

### 起動

Gitリポジトリ内で実行する。

```bash
lg
```

`lg` は `.zshrc` で設定した `lazygit` のエイリアス。

### 基本操作

| キー | 操作 |
| --- | --- |
| `↑` / `↓` | 項目を選択 |
| `←` / `→` | パネルを移動 |
| `Space` | ファイルをステージ・解除 |
| `c` | コミット |
| `p` | Pull |
| `P` | Push |
| `?` | キーバインドのヘルプ |
| `q` | 終了 |
