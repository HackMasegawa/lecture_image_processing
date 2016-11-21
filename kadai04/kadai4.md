# 課題4 画像のヒストグラム

## 課題内容
画素の濃度ヒストグラムを生成せよ．

## 実施方法

以下では濃度ヒストグラムの生成を行う画像として，次の朝顔の写真(筆者撮影)を使用する．この画像は縦480画素，横480画素による正方形のディジタルカラー画像であり，名前は「asagao.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai04/asagao.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('asagao.png'); % 原画像の読み込み
```

濃度ヒストグラムとは，読み込んだ画像全体の濃度の分布のことである．
Matlabにて，濃度ヒストを表示するには濃度ヒストグラムの表示を行いたい画像を，
1次元の軸で表すためにグレイスケールに変換したのち，用意された関数である`imhist`関数を利用すれば良い．
具体的には，次のような操作から濃度ヒストグラムの表示が行える．
```matlab
org_gray = rgb2gray(org_img);   % グレイスケール化
imhist(org_gray);               % ヒストグラムの表示
```

まず，図1で示した原画像をグレイスケール化したとき，次の図2のような画像となった．

![グレイスケール変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai04/gray.png)

図2 グレイスケール変換画像

さらに，このグレイスケール化した画像の濃度ヒストグラムは次の図3のようになった．

![グレイスケール変換画像の濃度ヒストグラム](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai04/hist_gray.png)

図3 グレイスケール変換画像の濃度ヒストグラム

この結果より，画像全体にて花びらの白の部分が多いため，濃度を表す指標が25~75あたりの画素が多いことがヒストグラムからも確認できる．

さらに比較のために，課題2にて変換を行った元画像の8階調変換画像のヒストグラムの表示を考える．8階調変換画像は次の図4で表されるような画像であった．

![8階調変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai04/pos8.png)

図4 8階調変換画像

この画像の濃度ヒストグラムは次の図5のようになった．

![8階調変換画像の濃度ヒストグラム](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai04/hist_pos8.png)

図5 8階調変換画像の濃度ヒストグラム

8階調の変換とは，すなわち色を8色に限定する操作と言える．
このヒストグラムの結果からも白(濃度指標0)，黒(濃度指標255)を含めた8つの濃度が特に多数の画素になっているということが確認できる．

以上の結果から，濃度ヒストグラムは画像全体の分布であるため，
本報告書で示した8階調変換などの階調変換のように色数を限定する変換を行うことで，
図5で確認できたような特に一部の濃度の高いヒストグラムが表示できることが考察できる．

## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai3.m
```matlab
% 課題4 画像のヒストグラム
% 画素の濃度ヒストグラムを生成せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png'); % 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化

imagesc(org_gray);          % 画像の表示
colormap(gray);             % グレイスケールの範囲で表示
colorbar;                   % カラーバーの表示
axis image;                 % 正方比率に

figure(2);
imhist(org_gray);           % ヒストグラムの表示

figure(3);
pos8_img = imread('pos8.png');      % 8階調化画像の入力

pos8_gray = rgb2gray(pos8_img);	% グレイスケール化
imagesc(pos8_gray);             % 画像の表示
colormap(gray);                 % グレイスケールの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 正方比率に

figure(4);
imhist(pos8_gray);           % ヒストグラムの表示

return;
```