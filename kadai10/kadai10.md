# 課題10 画像のエッジ抽出 

## 課題内容
次のプログラムを参考にして，エッジ抽出を体験せよ．

## 実施方法

以下ではエッジ抽出を行う画像として，次の朝顔の写真(筆者撮影)を使用する．この画像は縦480画素，横480画素による正方形のディジタルカラー画像であり，名前は「asagao.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai06/asagao.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('asagao.png'); % 原画像の読み込み
```

まず，図1で示した原画像をグレイスケール化したとき，次の図2のような画像となった．

![グレイスケール変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai10/org_gray.png)

図2 グレイスケール変換画像


Matlabにて，画像のエッジ抽出を行うには用意された`edge`関数を利用すればよい．このとき，エッジ抽出の方法としてプレウィット法，ソベル法，キャニー法の3種類について体験をする．それぞれの方法は，以下のような操作を行えばよい．

```matlab
pre_edge = edge(org_gray, 'prewitt');   % エッジ検出(プレウィット法)
sob_edge = edge(org_gray, 'sobel');     % エッジ検出(ソベル法)
can_edge = edge(org_gray, 'canny');     % エッジ検出(キャニー法)
```
以上の操作によって，行ったプレウィット法，ソベル法，キャニー法によるエッジ抽出を行った画像をそれぞれ，次の図3，図4，図5に示す．

![プレウィット法によるエッジ抽出](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai10/pre_edge.png)

図3 プレウィット法によるエッジ抽出

![ソベル法によるエッジ抽出](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai10/sob_edge.png)

図4 ソベル法によるエッジ抽出

![キャニー法によるエッジ抽出](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai10/can_edge.png)

図5 キャニー法によるエッジ抽出

以上より，それぞれの方法によって，エッジ抽出を実現できていることが確認できた．

今回利用したエッジ検出において，プレウィット法とは縦方向および横方向について差分を取る操作，すなわち平滑化操作を行うことによって実現しており，対してソベル法はガウシアン平滑化処理を行っている．そのため，図3と図4を比べると近しいエッジ抽出が行えていることが確認できる．

また，キャニー法とはプレウィット法にさらにいくつかの行列演算を加えた処理であり，詳細なエッジ検出に利用される．このとき，図5を確認すると図3および図4と比べて細やかなエッジの検出が行えていることが確かめられた．

## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai10.m
```matlab
% 課題10 画像のエッジ抽出 
% 次のプログラムを参考にして，エッジ抽出を体験せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png');	% 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化
imagesc(org_gray);              % 画像の表示
colormap(gray);                 % グレイスケールの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 元画像の比率に

figure;
pre_edge = edge(org_gray, 'prewitt');   % エッジ検出(プレウィット法)
imagesc(pre_edge);                      % 画像の表示
colormap(gray);                         % グレイスケールの範囲で表示
colorbar;                               % カラーバーの表示
axis image;                             % 元画像の比率に

figure;
sob_edge = edge(org_gray, 'sobel');     % エッジ検出(ソベル法)
imagesc(sob_edge);                      % 画像の表示
colormap(gray);                         % グレイスケールの範囲で表示
colorbar;                               % カラーバーの表示
axis image;                             % 元画像の比率に

figure;
can_edge = edge(org_gray, 'canny');     % エッジ検出(キャニー法)
imagesc(can_edge);                      % 画像の表示
colormap(gray);                         % グレイスケールの範囲で表示
colorbar;                               % カラーバーの表示
axis image;                             % 元画像の比率に

return;
```