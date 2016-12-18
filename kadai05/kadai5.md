# 課題5 判別分析法

## 課題内容
判別分析法を用いて画像二値化せよ．

## 実施方法

以下では判別分析を用いた2値化を行う画像として，次の朝顔の写真(筆者撮影)を使用する．この画像は縦480画素，横480画素による正方形のディジタルカラー画像であり，名前は「asagao.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai05/asagao.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('asagao.png'); % 原画像の読み込み
```

まず，図1で示した原画像をグレイスケール化したとき，次の図2のような画像となった．

![グレイスケール変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai05/org_gray.png)

図2 グレイスケール変換画像

さらに，このグレイスケール化した画像を閾値128により2値化を行ったとき，次の図3のようになった．

ここで，判別分析法とは与えられた画像において適切な閾値を決定する方法のことである．

画像全体をある閾値`t`によりクラス`C1`とクラス`C2`に分割することを考える．
クラス`Ci (i = 1, 2)`の画素数を`ωi`，平均値を`mi`，分散を`σi^2`とすると，
クラス内分散`σw^2`は次のように定義される．
```
σw^2 = (ω1 * σi^2 + ω2 + σi^2) / (ω1 + ω2)
```
また，画像全体における平均値を`mt`として，クラス間分散`σb^2`は次のように定義される．
```
σb^2 = (ω1 * (m1 - mt)^2 + ω2 * (m2 - mt)^2) / (ω1 + ω2)
```

このとき，`σt = σw^2 / σb^2`が最大となるような閾値`t`が判別分析法によって得られる閾値tである．このとき，`σw^2`，`σb^2`の分母に注目すると，分子だけを考えればよいことが分かる．

この手法をMatlabにより実装し，図2を2値化したとき次の図3の画像が得られた．また，このとき得られた閾値`t`は71であった．

![判別分析法を利用した2値化画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai05/thr_img.png)

図3 判別分析法を利用した2値化画像

以上より，判別分析法を用いることで，与えられた画像に対して適切な閾値を設けて画像の2値化を行えることが確認できた．特に，この判別分析法は閾値を機械的に決定できるため，輝度の偏った画像の入力に対しても十分な2値化が行えるということが考察できる．以下にその例として図4，図5，図6を示す．画像はそれぞれ[https://www.pakutaso.com/20161203351post-9863.html](https://www.pakutaso.com/20161203351post-9863.html)，[https://www.pakutaso.com/20130859234post-3194.html](https://www.pakutaso.com/20130859234post-3194.html)，[https://www.pakutaso.com/20161207350pc-16.html](https://www.pakutaso.com/20161207350pc-16.html)より参照している．

![様々な画像の2値化(閾値179)](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai05/thr179_img1.png)

図4 様々な画像の2値化(閾値179)

![様々な画像の2値化(閾値188)](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai05/thr188_img2.png)

図5 様々な画像の2値化(閾値188)

![様々な画像の2値化(閾値252)](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai05/thr252_img3.png)

図6 様々な画像の2値化(閾値252)

## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai5.m
```matlab
% 課題5 判別分析法
% 判別分析法を用いて画像二値化せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png'); % 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化

imagesc(org_gray);          % 画像の表示
colormap(gray);             % グレイスケールの範囲で表示
colorbar;                   % カラーバーの表示
axis image;                 % 正方比率に

hist = imhist(org_gray);    % グレイスケールのヒストグラム
mean_h = mean(hist);
sigmas = zeros(1, 255);     % クラス間分散を格納する配列
% クラス間分散が最大になるような閾値を探す
for i = 1:255
    class_b = hist(1:i);    % 輝度の低い黒クラス
    class_w = hist(i:255);  % 輝度の高い白クラス
    
    n_b = sum(class_b);     % 黒クラスの画素数
    n_w = sum(class_w);     % 白クラスの画素数
    mean_b = mean(class_b); % 黒クラスの平均
    mean_w = mean(class_w); % 白クラスの平均
    var_b = var(class_b);   % 黒クラスの分散
    var_w = var(class_w);   % 白クラスの分散
    
    
    sigma_w = (n_b * var_b + n_w * var_w);                              % クラス内分散
    sigma_b = (n_b *(mean_b - mean_h)^2 + n_w * (mean_w - mean_h)^2);   % クラス間分散
    sigmas(i) = sigma_b / sigma_w;
end

figure;
[val, t] = max(sigmas);     % sigmasが最大であるインデックスが最適な閾値
thr_img = org_gray > t;     % 閾値tによる2値化
imagesc(thr_img);           % 画像の表示
colormap(gray);             % グレイスケールの範囲で表示
colorbar;                   % カラーバーの表示
axis image;                 % 正方比率に

return;
```