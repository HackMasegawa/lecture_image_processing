# 課題8 ラベリング

## 課題内容
2値化された画像の連結成分にラベルをつけよ．

## 実施方法

以下では連結成分のラベル付加を行う画像として，次の朝顔の写真(筆者撮影)を使用する．この画像は縦480画素，横480画素による正方形のディジタルカラー画像であり，名前は「asagao.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai08/asagao.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('asagao.png'); % 原画像の読み込み
```

まず，図1で示した原画像をグレイスケール化したとき，次の図2のような画像となった．

![グレイスケール変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai08/org_gray.png)

図2 グレイスケール変換画像

さらに，このグレイスケール化した画像を閾値128により2値化を行ったとき，次の図3のようになった．

![128を閾値とした2値化画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai08/thr128_img.png)

図3 128を閾値とした2値化画像

以上の操作は課題6で行った画像の2値化処理ど共通の処理より行っている．

さらに，この2値化画像について，2種類の色(白黒)に対応する色のラベル付を行う．これを実現するにはMatlabにて用意された`bwlabeln`関数を利用し，以下のような操作を適用すればよい．

```matlab
bwl_img = bwlabeln(thr128_img); % 連結成分のラベル付け
```
この操作によって，ラベルの付加を行った2値化変換画像は次の図4のようになった．

![ラベル付加2値画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai08/bwl_img.png)

図4 ラベル付加2値画像

以上より，2値化画像に対して，白が薄い青色に，黒が濃い青色にそれぞれ対応してラベル付けを行えたことが確認できた．ただし，狭い白色の領域については中間色と扱われ薄い青，および濃い青以外の色が対応付けられていることに注意する．

本報告書により行ったラベリング操作は，ある画像における特定色の抽出などに利用できることが考察できる．

## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai8.m
```matlab
% 課題8 ラベリング
% 2値化された画像の連結成分にラベルをつけよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png');	% 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化
imagesc(org_gray);              % 画像の表示
colormap(gray);                 % グレイスケールの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 元画像の比率に

figure;
thr128_img = org_gray > 128;    % 閾値128で2値化
imagesc(thr128_img);            % 画像の表示
colormap(gray);                 % グレイスケールの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 元画像の比率に

figure;
bwl_img = bwlabeln(thr128_img); % 連結成分のラベル付け
imagesc(bwl_img);               % 画像の表示
colormap(jet);                  % jetの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 元画像の比率に

return;
```