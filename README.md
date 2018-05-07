# 3d-pose-baseline-vmd

このプログラムは、[3d-pose-baseline](https://github.com/ArashHosseini/3d-pose-baseline/) \(ArashHosseini様\) を miu(miu200521358) がfork して、改造しました。

動作詳細等は上記URL、または [README-ArashHosseini.md](README-ArashHosseini.md) をご確認ください。

## 機能概要

- [OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose) で検出された人体の骨格構造から、3Dの人体モデルを生成します。
- 3Dの人体モデルを生成する際に、関節データを出力します
    - 関節データを [VMD-3d-pose-baseline-multi](https://github.com/miu200521358/VMD-3d-pose-baseline-multi) で読み込む事で、vmd(MMDモーションデータ)ファイルを生成できます
- 複数人数のOpenPoseデータを解析（正確には、解析対象人物INDEXを指定）できます。

## 準備

詳細は、[Qiita](https://qiita.com/miu200521358/items/d826e9d70853728abc51)を参照して下さい。

### 依存関係

python3系 で以下をインストールして下さい

* [h5py](http://www.h5py.org/)
* [tensorflow](https://www.tensorflow.org/) 1.0 or later

### H36Mデータ

3D骨格情報は、[Human3.6M](http://vision.imar.ro/human3.6m/description.php) に基づいて作成されます。 
以下より圧縮ファイルをダウンロードして、解凍後、`data`以下に配置して下さい。

[H36Mデータzip (Dropbox)](https://www.dropbox.com/s/e35qv3n6zlkouki/h36m.zip) 

### 学習データ

オリジナルの学習データは、Windowsの260文字パス制限にひっかかるため、パスを簡略化して再生成しました。
以下より圧縮ファイルをダウンロードして、解凍後、`experiments`以下に配置して下さい。

[学習データzip (GoogleDrive)](https://drive.google.com/file/d/1v7ccpms3ZR8ExWWwVfcSpjMsGscDYH7_/view?usp=sharing) 

## 実行方法

1. Openpose で jsonデータを出力する
1. [OpenposeTo3D.bat](OpenposeTo3D.bat) を実行する
1. `OpenPoseのjsonディレクトリパス` が聞かれるので、1.の出力パスを指定する
1. `出力対象人物INDEX` が聞かれるので、Openposeで読み取った人物のうち、何番目の人物を出力したいか、1始まりで指定する。
1. 処理開始
1. 処理が終了すると、`result/{jsonデータフォルダ名}_{実行日時}_{人物INDEX}` のディレクトリ以下に結果が出力される。
    - pos.txt … 全フレームの関節データ([VMD-3d-pose-baseline-multi](https://github.com/miu200521358/VMD-3d-pose-baseline-multi) に読み込ませるファイル)
    - movie_smoothing.gif … フレームごとの姿勢を結合したアニメーションGIF
    - dirty_plot.png　… 移動量のグラフ
    - smooth_plot.png … 移動量をなめらかにしたグラフ
    - tmp_0000000000xx.png … 各フレームの3D姿勢
    - tmp_0000000000xx_xxx.png … 各フレームの角度別3D姿勢(デバッグ時のみ)

## 注意点

- Openpose のjson任意ファイル名に12桁の数字列は使わないで下さい。
    - `short02_000000000000_keypoints.json` のように、`{任意ファイル名}_{フレーム番号}_keypoints.json` というファイル名のうち、12桁の数字をフレーム番号として抽出するため

## ライセンス
MIT

以下の行為は自由に行って下さい

- モーションの調整・改変
- このツールを使用したモーションの不特定多数への配布
    - ただし、必ず踊り手様や権利者様に失礼のない形に調整してください

以下の行為は必ず行って下さい。ご協力よろしくお願いいたします。

- クレジットへの記載（記載場所は不問）
- コンテンツツリーへの動画(sm33161300)登録
- twitter等、SNSへの投稿はOKですが、クレジットとして `miu200521358` を入れて下さい

以下の行為はご遠慮願います

- 自作発言
- 権利者様のご迷惑になるような行為
- 営利目的の利用
- 他者の誹謗中傷目的の利用（二次元・三次元不問）
- 過度な暴力・猥褻・恋愛・猟奇的・政治的・宗教的表現を含む（R-15相当）作品への利用
- その他、公序良俗に反する作品への利用

## 免責事項

- 自己責任でご利用ください
- ツール使用によって生じたいかなる問題に関して、作者は一切の責任を負いかねます
