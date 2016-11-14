# 課題3 閾値処理

## 課題内容
閾値を4パターン設定し，閾値処理した画像を示せ．

## 実施方法

以下では閾値処理を行う画像として，次の朝顔の写真(筆者撮影)を使用する．この画像は縦480画素，横480画素による正方形のディジタルカラー画像であり，名前は「asagao.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai03/asagao.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('asagao.png'); % 原画像の読み込み
```

本報告書では，閾値処理の中で輝度についての閾値処理を行う．
輝度とは，画像データが持つ色の情報の表し方の1つで特にグレイスケールに変換を行ったときには黒に近いほど大きな値に，白に近いほど小さな値となる．
まず，例として上記で読み込んだ画像の輝度の最大値が255のとき，輝度51について閾値処理を行う方法を考える．
これを達成するには，まず，1つの軸により輝度の閾値を調整できるよう元画像をグレイスケールに変換する．
次に，以下の処理を行うことによって，画像データの持つ輝度が51より大きな値は1に，輝度が51以下の値は0に変換される．
```matlab
% 輝度が 51 より大きい画素を1，それ以外を0に
thr_img = org_gray > 51;
```
これは，MatLabにおける文法として条件式が真であるならば数値をして1を持つことを利用した操作である．

この操作によって，輝度51を閾値とした閾値処理された画像は以下のようになった．
![輝度51を閾値とした閾値処理](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai03/thr51.png)

図2 輝度51を閾値とした閾値処理

さらに，同様の操作をfor文により行って，輝度を102，153，204としたときの閾値処理を行った画像を次の図3から図5に示す．

![輝度102を閾値とした閾値処理](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai03/thr102.png)

図3 輝度102を閾値とした閾値処理

![輝度153を閾値とした閾値処理](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai03/thr153.png)

図4 輝度153を閾値とした閾値処理

![輝度204を閾値とした閾値処理](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai03/thr204.png)

図5 輝度204を閾値とした閾値処理

以上の結果から，MatLabによる条件演算子の利用によって，グレイスケール画像に対して簡単に閾値処理を行えるということが理解できた．
特に，今回閾値処理を行った各画像は白，もしくは黒，すなわち各画素データとしては0もしくは1しか持たない画像であり，
2階調への変換であることが言える．
これらから，課題2で行った階調変換では閾値の指定によってより詳細な変換が行えるということが考察できる．

## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai3.m
```matlab
% 課題3 閾値処理
% 閾値を4パターン設定し，閾値処理した画像を示せ．

clear;      % 変数のクリア
close all;  % 図表のクリア

BIT_MAX = 255;                  % 画素の最大値

org_img = imread('asagao.png'); % 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化

for i = 1:4
    figure(i);                  
    
    % 輝度が (BIT_MAX * (i/5)) より大きい画素を1，それ以外を0に
    % 閾値には51，102，153，204の4パターンを選択
    thr_img = org_gray > (BIT_MAX * (i/5));
    imagesc(thr_img);           % 画像の表示
    colormap(gray);             % グレースケールの範囲で表示
    colorbar;                   % カラーバーの表示
    axis image;                 % 正方比率に
end

return;
```

