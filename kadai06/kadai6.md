# 課題6 画像の2値化

## 課題内容
画像を2値化せよ．

## 実施方法

以下では2値化を行う画像として，次の朝顔の写真(筆者撮影)を使用する．この画像は縦480画素，横480画素による正方形のディジタルカラー画像であり，名前は「asagao.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai06/asagao.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('asagao.png'); % 原画像の読み込み
```

Matlabにて，特定の閾値による画像の2値化を行うには「>」演算子を利用して各画素を0または1の数値に変換すればよい．
具体例として上記で読み込んだ画像の画素値の最大値が255のとき，閾値128について閾値処理を行う方法を考える．
これを達成するには，まず，1つの軸により輝度の閾値を調整できるよう元画像をグレイスケールに変換する．
次に，以下の処理を行うことによって，画像データの持つ画素値が128より大きな値は1に，輝度が128以下の値は0に変換される．
```matlab
org_gray = rgb2gray(org_img);   % グレイスケール化
org_bin = org_gray > 128;       % しきい値128による2値化
```

まず，図1で示した原画像をグレイスケール化したとき，次の図2のような画像となった．

![グレイスケール変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai06/org_gray.png)

図2 グレイスケール変換画像

さらに，このグレイスケール化した画像を閾値128により2値化を行ったとき，次の図3のようになった．

![128を閾値とした2値化画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai06/org_bin.png)

図3 128を閾値とした2値化画像

これは，方法が同一のものであることから分かるように，課題3にて行った輝度128を閾値とした画像の2階調化変換と同等の操作であることが分かる．
これは，n階調操作が色数をn[種類]に変換する操作であることからも明らかである．

続いて，ディザ法による2値化変換を考える．
ディザ化とは，低階調(少色数)の画像において，プロット点の密度から中間色を表すための方法であり，それにより表す表現はハーフトーンとも呼ばれる．
原理は，縦横がそれぞれランダムな数値になるような行列であるディザマトリクスを用意したのち，ディザマトリクスの最大値と読み込み画像のの最大値を合わせ，その比較からマトリクス以上の値にはプロットを行う，という方法である．
Matlabにおいては，用意された関数「dither」より実現可能である．
```matlab
org_dith = dither(org_gray);% ディザ法による二値化
```
この操作によって，2値化変換を行った画像は次の図4のようになった．

![ディザ法による2値化画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai06/org_dith.png)

図4 ディザ法による2値化画像

以上より，実際の描画色は白(0)と黒(1)の2値だけであるにも関わらず，中間色の表現を行えていることが確かめられる．

本報告書では2値化の方法として閾値の分類による方法と，ディザ法の2つを利用した．
こういった2値化の行われた画像というのは，特にモノクロプリンタによる出力に利用することが考えられる．
このとき，閾値による変換である図3と，ディザ法による変換である図4を比較すると，
写真などのモノクロ出力では中間色の表現が行える，ディザ法による出力のほうが適していることが考察できる．

## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai6.m
```matlab
% 課題6 画像の2値化
% 画像を2値化せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png'); % 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化

imagesc(org_gray);          % 画像の表示
colormap(gray);             % グレイスケールの範囲で表示
colorbar;                   % カラーバーの表示
axis image;                 % 正方比率に

figure;
org_bin = org_gray > 128;   % しきい値128による2値化
imagesc(org_bin);           % 画像の表示
colormap(gray);             % グレイスケールの範囲で表示
colorbar;                   % カラーバーの表示
axis image;                 % 正方比率に

figure;
org_dith = dither(org_gray);% ディザ法による二値化
imagesc(org_dith);          % 画像の表示
colormap(gray);             % グレイスケールの範囲で表示
colorbar;                   % カラーバーの表示
axis image;                 % 正方比率に

return;
```