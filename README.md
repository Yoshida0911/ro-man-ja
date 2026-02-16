# 研究室ゼミ用 LaTeX テンプレート

研究室ゼミ用の LaTeX テンプレート ( LuaLaTeX + luatexja + biblatex )

**ディレクトリ構成**
```
.
├── main.tex                  # メインファイル
├── refs.bib                  # 文献データベース
├── figures/                  # 画像
├── styles
│   └── ozakilab_seminar.cls  # LaTeX クラスファイル
├── latexmkrc                 # latexmk 設定ファイル
├── Makefile                  # ビルドスククリプト
```

---

## ローカルでの利用方法

### 1. Tex Live のインストール (Ubuntu) [参考](https://texwiki.texjp.org/Linux)
apt 経由だと最新バージョンがインストールされないらしい

1. `wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz`

2. `tar xvf install-tl-unx.tar.gz`

3. `cd install-tl-2*`

4. `sudo ./install-tl -no-gui`

5. `S`でインストールするスキームを指定 ( デフォルトでは scheme-full )
   `I`を入力してインストール開始

6. `sudo /usr/local/texlive/????/bin/*/tlmgr path add`

7. `lualatex --version`
   `biber --version`

その他，必要パッケージのインストール
```bash
sudo tlmgr update --self --all
sudo tlmgr install <package>
```

### 2. GitHub からテンプレート作成
テンプレートを個人のリポジトリにコピーして，バックアップをとってください

1. 「**Use this templete**」ボタンをクリックし，「**Create a new repository**」を選択
   - Owner: 自身のGitHubアカウント
   - Repository name: 任意のプロジェクト名 (例: B4_8zemi)

2. ローカルにクローン
```bash
git clone <https://github.com/YourUsername/your-repository-name.git>
cd your-repository-name
```

### 3. コンパイル方法
```
make           # PDFを作成します
make view      # PDFを作成して，ビューアで開きます
make clean     # 成果物を削除します
```

- VS Codeの拡張機能 **LaTeX Workshop** と併用するのがおすすめ
  - ctrl + S で自動コンパイル
  - TeX -> PDF: `Ctrl + Alt + J`
  - PDF -> TeX: `Ctrl + クリック`
  - Snippets から記号を探せる

---

## Overleaf での利用方法

### 1. GitHub から ZIPファイル取得
「**Code**」ボタンをクリックし，「**Download ZIP**」を選択してテンプレート全体をダウンロード

### 2. Overleaf にアップロード
Overleaf ログインし，「**New Project**」から「**Upload Project**」を選択し，ダウンロードしたZIPファイルをアップロード

### 3. コンパイル設定
「**Menu**」を開いて，コンパイラを選択
- Compiler: LuaLaTeX
- Tex Live Version: 最新