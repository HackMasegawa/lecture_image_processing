# 課題2 階調数と疑似輪郭

## 課題内容
2階調，4階調，8階調の画像を生成せよ．

## 実施方法

以下では階調の変換を行う画像として，次の朝顔の写真(筆者撮影)を使用する．この画像は縦480画素，横480画素による正方形のディジタルカラー画像であり，名前は「asagao.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai02/asagao.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('asagao.png'); % 原画像の読み込み
```

まず，例として上記で読み込んだ画像を2階調に変換する方法を考える．
これを達成するには，まず，1つの軸により階調数を調整できるよう元画像をグレイスケールに変換する．
次に，階調数を格納する変数colorを用意した上で，(color-1)[個]のしきい値を持たせることで，(color)階調の画像に変換できることが考えられる．
このとき，しきい値の持たせ方としては各画素の数値を([画素の最大値] / (color-1))で除算して整数にしたあと，
再び ([画素の最大値] / (color-1)) の値を各画素に掛ければよい．
実際の操作としては，以下より行える．
```matlab
org_gray = rgb2gray(org_img);   % グレイスケール化
color = 2;                      % 階調数(2)
% (color-1)個のしきい値を作ることで(color)階調に変換
pos_img = org_gray ./ (BIT_MAX/(color-1)) * (BIT_MAX/(color-1));
```

この操作によって，2階調に変換された画像は以下のようになった．
![2階調変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai02/pos2.png)

図2 2階調変換画像

さらに，同様の操作をfor文により行って，4階調，8階調に変換したときの画像を次の図3，図4に示す．

![4階調変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai02/pos4.png)

図3 4階調変換画像

![8階調変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai02/pos8.png)

図4 8階調変換画像

以上の結果から，今回のような階調の変換の操作によって，画像中の色数の任意の変更を行うことができることが確認できる．
特に，2階調，4階調などの低い階調に変換する操作では，原画像に対して疑似的に輪郭の抽出操作が行えることが分かる．

## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai2.m
```matlab
% 課題2 階調数と疑似輪郭
% 2階調，4階調，8階調の画像を生成せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

BIT_MAX = 255;                  % 画素の最大値

org_img = imread('asagao.png'); % 原画像の入力
org_gray = rgb2gray(org_img);   % グレースケール化

for i = 1:3
    figure(i);                  
    
    color = 2^i;                % 階調数(2, 4, 8)
    % (color-1)個のしきい値を作ることで(color)階調に変換
    pos_img = org_gray ./ (BIT_MAX/(color-1)) * (BIT_MAX/(color-1));
    imagesc(pos_img);          % 画像の表示
    colormap(gray);             % グレースケールの範囲で表示
    colorbar;                   % カラーバーの表示
    axis image;                 % 正方比率に
end

return;
```

