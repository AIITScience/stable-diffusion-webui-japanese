# Stable Diffusion web UI
Gradioライブラリを使って実装されたStable Diffusionのウェブインターフェース。

![](screenshot.png)

## Features
[画像付き詳細機能ショーケース](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Features)：
- [stable diffusion easier](https://aiitscience.github.io/Stable-Diffusion-Easier-Japanese/)の後継ソフト
- オリジナルの txt2img と img2img モード
- ワンクリックインストールでスクリプトを実行 
- アウトペインティング
- インペインティング
- カラースケッチ
- プロンプトマトリックス
- Stable Diffusion Upscale
- Attention, モデルがより注意を払うべきテキストの部分を指定
    - a man in a `((tuxedo))` - タキシードにより注意を払う
    - a man in a `((tuxedo:1. 21))` - 代替構文
    - テキストを選択して `Ctrl+Up` または `Ctrl+Down` (MacOS の場合は `Command+Up` または `Command+Down`) を押すと、選択したテキストの注目度を自動的に調整する (匿名ユーザーによるコード)
- ループバック、img2img の処理を複数回実行する
- X/Y/Z プロット、 異なるパラメータを持つ画像の3次元プロットを描画する方法
- テキストの反転
    - 好きなだけ埋め込みを持ち、好きな名前を使うことができる
    - トークンごとに異なるベクトル数を持つ複数の埋め込みを使うことができる
    - 半精度浮動小数点数で動作する
    - 8GBで埋め込みを学習することができる（6GBで動作したという報告もある）
- Extras タブ：
    - GFPGAN, 顔を修正するニューラルネットワーク
    - CodeFormer, GFPGAN の代替となる顔復元ツール
    - RealESRGAN, ニューラルネットワークアップスケーラ
    - ESRGAN, サードパーティ製モデルを多数含むニューラルネットワークアップスケーラ
    - SwinIR and Swin2SR ([こちらを参照](https://github.com/AUTOMATIC1111/stable-diffusion-webui/pull/2092)), ニューラルネットワークアップスケーラ
    - LDSR, latent diffusion超解像アップスケーリング
- アスペクト比のリサイズオプション
- サンプリング方法の選択
- サンプラーのエータ値（ノイズ乗数）の調整
- より高度なノイズ設定オプション
- いつでも処理の中断が可能
- 4GBビデオカードのサポート（2GBでも動作報告あり)
    - バッチの正しいシード
- ライブプロンプトトークンの長さの検証
- 生成パラメータ
    - 画像生成に使用したパラメータはその画像と共に保存される
    - PNGの場合はPNG chunks、 PNG の場合は PNG チャンクに、JPEG の場合は EXIF に
    - 画像を PNG 情報タブにドラッグすると、生成パラメータが復元され、自動的に UI にコピーされます
    - 設定で無効にできます
    - 画像/テキストパラメータをプロンプトボックスにドラッグ＆ドロップ
- 生成パラメータの読み込みボタン、 プロンプトボックスのパラメータを UI にロード
- 設定ページ
- UI から任意の python コードを実行（有効にするには `--allow-code` で実行する必要があります）
- ほとんどの UI 要素のマウスオーバーヒント
- テキスト設定により UI 要素のデフォルト値/ミックス値/最大値/ステップ値を変更可能
- タイリングのサポート、 テクスチャのようにタイル化できる画像を作成するためのチェックボックス
- プログレスバーとライブ画像生成プレビュー
    - 別個のニューラルネットワークを使用して、VRAMや計算量をほとんど必要とせずにプレビューを生成できます
- ネガティブプロンプト、生成された画像で見たくないものをリストアップできる追加のテキストフィールド
- スタイル、プロンプトの一部を保存して、後でドロップダウンから簡単に適用する方法
- バリエーション、同じ画像を生成する方法ですが、小さな違いがあります
- Seed resizing: 同じ画像を少し異なる解像度で生成する方法
- CLIP interrogator: 画像からプロンプトを推測しようとするボタン
- Prompt Editing: 生成の途中でプロンプトを変更する方法、例えばスイカを作り始めて途中でアニメの女の子に切り替える
- Batch Processing: img2img
- Img2img Alternative、逆オイラー法による交差注意制御
- Highres Fix, 通常の歪みなしにワンクリックで高解像度の画像を生成する便利なオプション
- Reloading checkpoints on the fly
- Checkpoint Merger, 最大3つのチェックポイントを1つにマージできるタブ
- [Custom scripts](https.//github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Custom-Scripts)、コミュニティからの多くの拡張機能付き
- [Composable-Diffusion](https://energy-based-model.github.io/Compositional-Visual-Generation-with-Composable-Diffusion-Models/), 複数のプロンプトを同時に使用する方法
    - 大文字の `AND` を使ってプロンプトを分ける
    - プロンプトの重み付けもサポート： `a cat :1.2 AND a dog AND a penguin :2.2`
- プロンプトのトークン制限なし (オリジナルの stable diffusion では 75 トークンまで使用可能)
- DeepDanbooru の統合、アニメのプロンプトに danbooru スタイルのタグを作成
- [xformers](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Xformers), select cards の大幅な速度向上: (`--xformers` をコマンドラインの引数に追加)
- 拡張機能経由： [履歴タブ](https://github.com/yfszzx/stable-diffusion-webui-images-browser)：UI内で便利に画像を表示、直接表示、削除
- Generate foreverオプション
- Trainingタブ
    - ハイパーネットワークとエンベッディングオプション
    - 画像の前処理： トリミング、ミラーリング、BLIPまたはdeepdanbooru（アニメ用）を使った自動タグ付け
- クリップスキップ
- ハイパーネットワーク
- Loras（Hypernetworks と同じですが、よりきれいです）
- プロンプトに追加するエンベッディング、ハイパーネットワーク、Lorasをプレビュー付きで選択できる独立したUI
- 設定画面から別のVAEを読み込むように選択可能
- プログレスバーに表示される推定完了時間
- API
- 専用[インペインティングモデル](https://github.com/runwayml/stable-diffusion#inpainting-with-stable-diffusion)のサポート by RunwayML
- 拡張機能経由： [Aesthetic Gradients](https://github.com/AUTOMATIC1111/stable-diffusion-webui-aesthetic-gradients)、クリップ画像を埋め込むことで特定の美的感覚を持った画像を生成する方法 ([https://github.com/vicgalle/stable-diffusion-aesthetic-gradients](https://github.com/vicgalle/stable-diffusion-aesthetic-gradients)の実装)
- [Stable Diffusion 2.0](https://github.com/Stability-AI/stablediffusion)をサポート - 使い方は[wiki](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Features#stable-diffusion-20)を参照
- [Alt-Diffusion](https://arxiv.org/abs/2211.06679)のサポート - 使い方は[wiki](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Features#alt-diffusion)を参照
- 悪い文字がなくなりました！
- Safetensors フォーマットでチェックポイントをロード
- 解像度の制限を緩和: 生成されるイメージの寸法は 64 ではなく 8 の倍数でなければなりません
- ライセンスが付きました！
- 設定画面からUIの要素を並び替える
- [Segmind Stable Diffusion](https://huggingface.co/segmind/SSD-1B)をサポート。

## Installation and Running
[オンラインサービス一覧](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Online-Services)
### Installation on Windows 10/11

[![Static Badge](https://img.shields.io/badge/%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89-green)](https://github.com/AIITScience/stable-diffusion-webui-japanese/releases/download/v1/sdwebuiSetup.exe)

又は、以下の方法でできます。
1. Gitをインストール。
```
winget install --id Git.Git -e --source winget
```
2. このリポジトリをクローン。
```
git clone https://github.com/AIITScience/stable-diffusion-webui-japanese.git
```
3. Pythonをインストール。`pyinstall`
4. オプションをセット。

例:
```bash
# CPU mode
set COMMANDLINE_ARGS=--use-cpu all --precision full --no-half --skip-torch-cuda-test
# xformers
set COMMANDLINE_ARGS=--xformers
# model change
set COMMANDLINE_ARGS=--no-download-sd-model --ckpt <pathtockpt>
# auto update
set COMMANDLINE_ARGS=--update-check --update-all-extensions
```
5. 実行。`webui.bat`
### Installation on Linux
1. 依存関係をインストールする：
```bash
# Debianベース:
sudo apt install wget git python3 python3-venv libgl1 libglib2. 0-0
# Red Hat ベース:
sudo dnf install wget git python3 gperftools-libs libglvnd-glx
# openSUSE ベース:
sudo zypper install wget git python3 libtcmalloc4 libglvnd
# Arch ベース:
sudo pacman -S wget git python3
```
システムが新しい場合、python3. 11 or python3.10:
```bash
# Ubuntu 24.04
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11

# Manjaro/Arch
sudo pacman -S yay
yay -S python311 # python3.11 パッケージと混同しないように
```
3.11 用のみ
```bash
# その後起動スクリプトで env 変数を設定
export python_cmd="python3.11"
```
2. webui をインストールしたいディレクトリに移動し、以下のコマンドを実行します：
```bash
git clone https://github.com/AIITScience/stable-diffusion-webui-japanese
```

3. `webui.sh` を実行する。
4. `webui-user.sh` のオプションを確認してください。

### Installation on Apple Silicon

1. Homebrewをインストール。
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
2. 依存関係をインストール。
```
brew install cmake protobuf rust python@3.10 git wget
```
3. リポジトリのクローン。
```
git clone https://github.com/AIITScience/stable-diffusion-webui-japanese
```
4. モデルをダウンロード。

例:
- [Stable Diffusion 1.4](https://huggingface.co/CompVis/stable-diffusion-v-1-4-original)の[sd-v-1-4.ckpt](https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt)
- [Stable Diffusion 1.5](https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-v1-5)の[v1-5-pruned-emaonly.safetensors](https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors)
- [Stable-Diffusion-1.5-Inpainting](https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-inpainting)の[sd-v-1-5-inpainting.ckpt](https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-inpainting/resolve/main/sd-v1-5-inpainting.ckpt)

⚠️以下のモデルは、[このページ](https://github.com/Stability-AI/stablediffusion/raw/main/configs/stable-diffusion/v2-inference-v.yaml)をyamlファイルとして保存してモデルと一緒に置かないといけません。
- [Stable Diffusion 2](https://huggingface.co/stabilityai/stable-diffusion-2)の[768-v-ema.safetensors](https://huggingface.co/stabilityai/stable-diffusion-2/resolve/main/768-v-ema.safetensors)
- [Stable Diffusion 2.1](https://huggingface.co/stabilityai/stable-diffusion-2-1)の[v2-1_768-ema-pruned.safetensors](https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.safetensors)

⚠️以下のモデルは、[このページ](https://github.com/Stability-AI/stablediffusion/raw/main/configs/stable-diffusion/v2-midas-inference.yaml)をyamlファイルとして保存してモデルと一緒に置かないといけません。
- [Stable Diffusion 2 Depth](https://huggingface.co/stabilityai/stable-diffusion-2-depth)の[512-depth-ema.safetensors](https://huggingface.co/stabilityai/stable-diffusion-2-depth/resolve/main/512-depth-ema.safetensors)

5. WebUIのディレクトリに移動。
```
cd stable-diffusion-webui-japanese
```
6. WebUIを実行。`./webui.sh`

## Contributing
このリポジトリにコードを追加する方法は以下の通りです： [貢献](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Contributing)

## Documentation
- 本家の[wiki](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki)

Googleや他の検索エンジンにwikiをクロールしてもらうために、ここに（人間用ではない）[クロール可能なwiki](https://github-wiki-see.page/m/AUTOMATIC1111/stable-diffusion-webui/wiki)へのリンクがあります。
## Credits
借用したコードのライセンスは `Settings -> Licenses` 画面、および `html/licenses.html` ファイルで確認できます。

- Stable Diffusion - https://github.com/Stability-AI/stablediffusion, https://github.com/CompVis/taming-transformers, https://github.com/mcmonkey4eva/sd3-ref
- k-diffusion - https://github.com/crowsonkb/k-diffusion.git
- Spandrel - https://github.com/chaiNNer-org/spandrel implementing
    - GFPGAN - https://github.com/TencentARC/GFPGAN.git
    - CodeFormer - https://github.com/sczhou/CodeFormer
    - ESRGAN - https://github.com/xinntao/ESRGAN
    - SwinIR - https://github.com/JingyunLiang/SwinIR
    - Swin2SR - https://github.com/mv-lab/swin2sr
- LDSR - https://github.com/Hafiidz/latent-diffusion
- MiDaS - https://github.com/isl-org/MiDaS
- Ideas for optimizations - https://github.com/basujindal/stable-diffusion
- クロスアテンションレイヤーの最適化 - Doggettx - https://github.com/Doggettx/stable-diffusion　、迅速な編集のためのオリジナルアイデア。
- クロスアテンションレイヤーの最適化 - InvokeAI, lstein - https://github.com/invoke-ai/InvokeAI (元々は http://github.com/lstein/stable-diffusion)
- サブ2次クロスアテンションレイヤーの最適化 - Alex Birch (https://github.com/Birch-san/diffusers/pull/1), Amin Rezaei (https://github.com/AminRezaei0x443/memory-efficient-attention)
- テキストの反転 - Rinon Gal - https://github.com/rinongal/textual_inversion (彼のコードは使っていないが、彼のアイデアは使っている)。
- SDアップスケールのアイデア - https://github.com/jquesnelle/txt2imghd
- ノイズ生成 for アウトペインティング mk2 - https://github.com/parlance-zz/g-diffuser-bot
- CLIP interrogator idea and borrowing some code - https://github.com/pharmapsychotic/clip-interrogator
- Idea for Composable Diffusion - https://github.com/energy-based-model/Compositional-Visual-Generation-with-Composable-Diffusion-Models-PyTorch
- xformers - https://github.com/facebookresearch/xformers
- DeepDanbooru - interrogator for anime diffusers https://github. com/KichangKim/DeepDanbooru
- float16 UNetからfloat32精度でサンプリング - アイデアはmarunineさん、Diffusersの実装例はBirchさん (https://github.com/Birch-san/diffusers-play/tree/92feee6)
- pix2pixを教える - Tim Brooks (star), Aleksander Holynski (star), Alexei A. Efros (no star) - https://github.com/timothybrooks/instruct-pix2pix
- セキュリティアドバイス - RyotaK
- UniPCサンプラー - Wenliang Zhao - https://github.com/wl-zhao/UniPC
- TAESD - Ollin Boer Bohan - https://github.com/madebyollin/taesd
- LyCORIS - KohakuBlueleaf
- Restart sampling - lambertae - https://github.com/Newbeeer/diffusion_restart_sampling
- Hypertile - tfernd - https://github.com/tfernd/HyperTile
- Initial Gradio script - Anonymous userによって4chanに投稿されました。匿名ユーザーさん、ありがとうございます。
- (あなた)
