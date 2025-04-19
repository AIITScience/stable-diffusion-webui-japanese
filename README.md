# Stable Diffusion web UI
Gradioライブラリを使って実装されたStable Diffusionのウェブインターフェース。

![](screenshot.png)

## Features
[画像付き詳細機能ショーケース](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Features)：
- オリジナルの txt2img と img2img モード
- ワンクリックインストールでスクリプトを実行 (ただし python と git のインストールは必要)
- アウトペインティング
- インペインティング
- カラースケッチ
- プロンプトマトリックス
- Stable Diffusion Upscale
- Attention, モデルがより注意を払うべきテキストの部分を指定
    - a man in a `((tuxedo))` - タキシードにより注意を払う
    - a man in a `((tuxedo:1. 21)` - 代替構文
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
必要な[dependencies](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Dependencies)が満たされていることを確認し、利用可能な指示に従ってください：
- [NVidia](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-NVidia-GPUs) (推奨)
- [AMD](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-AMD-GPUs) GPU。
- [Intel CPUs, Intel GPUs (integrated and discrete both)](https://github.com/openvinotoolkit/stable-diffusion-webui/wiki/Installation-on-Intel-Silicon) (external wiki page)
- [Ascend NPUs](https://github.com/wangshuai09/stable-diffusion-webui/wiki/Install-and-run-on-Ascend-NPUs) (external wiki page)

あるいは、オンラインサービス (Google Colab など) を利用する：

- [オンラインサービス一覧](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Online-Services)

### Automatic Installation on Linux
1. Install the dependencies:
```bash
# Debian-based:
sudo apt install wget git python3 python3-venv libgl1 libglib2.0-0
# Red Hat-based:
sudo dnf install wget git python3 gperftools-libs libglvnd-glx
# openSUSE-based:
sudo zypper install wget git python3 libtcmalloc4 libglvnd
# Arch-based:
sudo pacman -S wget git python3
```
If your system is very new, you need to install python3.11 or python3.10:
```bash
# Ubuntu 24.04
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11

# Manjaro/Arch
sudo pacman -S yay
yay -S python311 # do not confuse with python3.11 package

# Only for 3.11
# Then set up env variable in launch script
export python_cmd="python3.11"
# or in webui-user.sh
python_cmd="python3.11"
```
2. Navigate to the directory you would like the webui to be installed and execute the following command:
```bash
wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
```
Or just clone the repo wherever you want:
```bash
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
```

3. Run `webui.sh`.
4. Check `webui-user.sh` for options.
### Installation on Apple Silicon

Find the instructions [here](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Installation-on-Apple-Silicon).

## Contributing
このリポジトリにコードを追加する方法は以下の通りです： [貢献](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Contributing)

## Documentation
ドキュメントはこのREADMEからプロジェクトの[wiki](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki)に移動しました。

Googleや他の検索エンジンにwikiをクロールしてもらうために、ここに（人間用ではない）[クロール可能なwiki](https://github-wiki-see.page/m/AUTOMATIC1111/stable-diffusion-webui/wiki)へのリンクがあります。
## Credits
借用したコードのライセンスは `Settings -> Licenses` 画面、および `html/licenses.html` ファイルで確認できます。

- Stable Diffusion - https://github.com/Stability-AI/stablediffusion, https://github.com/CompVis/taming-transformers, https://github.com/mcmonkey4eva/sd3-ref
- k-diffusion - https://github.com/crowsonkb/k-diffusion.git
- Spandrel - https://github.com/chaiNNer-org/spandrel implementing
    - GFPGAN - https://github.com/TencentARC/GFPGAN.git
    - CodeFormer - https://github.com/sczhou/CodeFormer
    - ESRGAN - https://github.com/xinntao/ESRGAN
    - SwinIR - https://github.com/JingyunLiang/SwinIR - Swin2SR -
- LDSR - https://github.com/Hafiidz/latent-diffusion
- MiDaS - https://github.com/isl-org/MiDaS
- Ideas for optimizations - https://github.com/basujindal/stable-diffusion
- Cross Attention la.
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
- UniPCサンプラー - Wenliang Zhao - https://github. com/wl-zhao/UniPC
- TAESD - Ollin Boer Bohan - https://github.com/madebyollin/taesd
- LyCORIS - KohakuBlueleaf
- Restart sampling - lambertae - https://github.com/Newbeeer/diffusion_restart_sampling
- Hypertile - tfernd - https://github.com/tfernd/HyperTile
- Initial Gradio script - Anonymous userによって4chanに投稿されました。匿名ユーザーさん、ありがとうございます。
- (あなた)
