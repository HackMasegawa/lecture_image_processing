# 課題1 標本化間隔と空間解像度

## 課題内容
画像をダウンサンプリングして(標本化間隔を大きくして)表示せよ．

## 実施方法

以下ではダウンサンプリングを行う画像として，次の朝顔の写真(筆者撮影)を使用する．この画像は縦480画素，横480画素による正方形のディジタルカラー画像であり，名前は「asagao.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai01/asagao.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('asagao.png'); % 原画像の読み込み
```

まず，例として上記で読み込んだ画像を1/2倍にダウンサンプリングする方法を考える．
これを達成するには，Matlabの関数を利用して，画像を1/2倍に縮小した後，2倍に拡大することで，サンプリング数は240画素*240画素となる．すなわち，縦横の各比率は1/2倍となり，画素数は1/4倍にすることができる．実際の操作としては，以下より行える．このとき，注意として拡大操作では，単純補間するために「box」オプションを設定している．
```matlab
% 1/2 倍に縮小後，2倍に拡大することで
% 1/2 倍のダウンサンプリング操作を行える
res_img = imresize(imresize(org_img, 1/2), 2, 'box');
```

この操作によって，ダウンサプリングされた画像は以下のようになった．
![1/2倍ダウンサンプリング結果](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai01/asagao_2.png)

図2 1/2 倍ダウンサンプリング結果

さらに，同様の操作を行って，1/4 倍，1/8 倍，1/16倍，1/32倍にダウンサンプリングしたときの画像を次の図3から図6に示す．

![1/4倍ダウンサンプリング結果](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai01/asagao_3.png)

図3 1/4 倍ダウンサンプリング結果

![1/8倍ダウンサンプリング結果](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai01/asagao_4.png)

図4 1/8 倍ダウンサンプリング結果

![1/16倍ダウンサンプリング結果](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai01/asagao_5.png)

図5 1/16 倍ダウンサンプリング結果

![1/32倍ダウンサンプリング結果](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai01/asagao_6.png)

図6 1/32 倍ダウンサンプリング結果

最後に，本報告書における図1から図6を比較のために並べた画像を次の図7に示す．
![ダウンサンプリング結果の比較](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai01/compare.png)

図7 ダウンサンプリング結果の比較

以上の結果から，ダウンサンプリング操作によって標本数を少なくしたとき，画像にはモザイク状のサンプリング歪みが発生することが理解できた．

## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai1.m
```matlab
% 課題1　標本化間隔と空間解像度
% 画像をダウンサンプリングして(標本化間隔を大きくして)表示せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png'); % 原画像の読み込み
subplot(231);
image(org_img);                 % 原画像の表示
axis image;                     % 正方形比率に
xlabel('Original Image');       

for i = 2:6
    ratio = 2^(i-1);        % ダウンサンプリング比率
    % 1/ratio 倍に縮小後，ratio倍に拡大することで
    % 1/ratio 倍のダウンサンプリング操作を行える
    res_img = imresize(imresize(org_img, 1/ratio), ratio, 'box');
    subplot(2, 3, i);
    image(res_img);         % ダウンサンプリング画像の表示
    axis image;             % 正方形比率に
    xlabel(['1/', num2str(ratio), ' Sampling']);
    
    imwrite(res_img, ['asagao_', num2str(i), '.png']);  % 画像の保存
end

return;
```

