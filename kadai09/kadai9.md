# 課題9 メディアンフィルタと先鋭化

## 課題内容
メディアンフィルターを適用し，ノイズ除去を体験せよ．

## 実施方法

以下ではノイズの付加および除去を行う画像として，次の朝顔の写真(筆者撮影)を使用する．この画像は縦480画素，横480画素による正方形のディジタルカラー画像であり，名前は「asagao.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai09/asagao.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('asagao.png'); % 原画像の読み込み
```

まず，図1で示した原画像をグレイスケール化したとき，次の図2のような画像となった．

![グレイスケール変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai09/org_gray.png)

図2 グレイスケール変換画像

次に，Matlabにおいて画像にノイズの付加を行うには用意された`imnoise`関数を利用して，以下のような操作を行えばよい．ただし，今回画像に付加するノイズには`salt & pepper`を選択する．

```matlab
noise_img = imnoise(org_gray, 'salt & pepper', 0.02);	% ノイズの添付
```

この操作によって，ノイズを付加した画像は次の図3のようになった．以降ではこの付加されたノイズのフィルタリングによる除去を考える．

![ノイズ付加画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai09/noise_img.png)

図3 ノイズ付加画像

まず，平滑化フィルタによるノイズの除去を考える．本報告書では以下のような操作により，画像の平滑化を行う．

```matlab
ave_img = filter2(fspecial('average', 3), noise_img);   % 平滑化フィルタ適用
```
このとき，フィルタとして用意した変数`fspecial('average', 3)`は以下のような行列である．

```matlab
>> fspecial('average', 3)

ans =

    0.1111    0.1111    0.1111
    0.1111    0.1111    0.1111
    0.1111    0.1111    0.1111
```

これは，画像の各ピクセルについて，自身とその周囲8個のピクセルの輝度の平均値に変換していることを示す．この操作によって，画像の平滑化が行なえ，画像は次の図4のようになる．

![平滑化フィルタ適用画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai09/ave_img.png)

図4 平滑化フィルタ適用画像

次に，メディアンフィルタによるノイズの除去を考える．本報告書では以下のような操作により，フィルタの適用を行う．

```matlab
med_img = medfilt2(noise_img, [3 3]);	% メディアンフィルタ適用
```

メディアンフィルタとは，名前の通り各ピクセルについて，そこからある特定の範囲のピクセルの中央値に変換するようなフィルタである．上の操作では与えている値`[3 3]`から，3*3範囲の輝度の中央値を選択していることが分かる．このフィルタの適用後の画像は次の図5のようになった．

![メディアンフィルタ適用画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai09/med_img.png)

図5 メディアンフィルタ適用画像

--

最後に，自作フィルタによるノイズの除去を考える．本報告書では以下のような操作により，フィルタの適用を行う．

```matlab
fil = [0, -1, 0; -1, 5, -1; 0, -1, 0];      % 自作フィルタの設計
fil_img = filter2(fil, noise_img, 'same');  % 自作フィルタの適用
```

用意した自作フィルタ`fil`は以下のような値の変数である．

```matlab
>> fil

fil =

     0    -1     0
    -1     5    -1
     0    -1     0
```


操作については，平滑化フィルタのフィルタに対応する値を変数`fil`に変えたものと言える．このフィルタでは各ピクセルについて，上下左右の4ピクセルの輝度の合計を自身から減算するフィルタと言える．すなわち，自身のピクセルの輝度が上下左右4つのピクセルの輝度の値から遠いほど強調されることになるため，ノイズ強調フィルタであることが分かる．このフィルタの適用後の画像は次の図6のようになった．

![自作フィルタ適用画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai09/fil_img.png)

図6 自作フィルタ適用画像

以上より，図3のノイズ付加画像と図6の自作フィルタ適用画像を比較すると付加したノイズ部分以外が灰色となり，一方，ノイズは白，もしくは黒となって強調されていることが確認できる．

本報告書ではノイズ除去を考えたフィルタ適用について，平滑化フィルタとメディアンフィルタの2種類の方法について検討を行った．図5の平滑化フィルタ適用画像と図6のメディアンフィルタ適用画像を比較すると，今回の画像についてはメディアンフィルタ適用画像のが，充分なノイズ除去を行えていることが分かる．ただし，これは今回画像に付加したノイズが`salt & pepper`により選択したごま塩状のノイズであったため，より有効であったということが言える．そのため，実際のノイズ除去については，除去すべきノイズがどのような特性のノイズであるかを踏まえて，それに有効なフィルタを選択すべきであることが考察できる．

## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai9.m
```matlab
% 課題9 メディアンフィルタと先鋭化
% メディアンフィルターを適用し，ノイズ除去を体験せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png');	% 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化
imagesc(org_gray);              % 画像の表示
colormap(gray);                 % グレイスケールの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 元画像の比率に

figure;
noise_img = imnoise(org_gray, 'salt & pepper', 0.02);	% ノイズの添付
imagesc(noise_img);                                     % 画像の表示
colormap(gray);                                         % グレイスケールの範囲で表示
colorbar;                                               % カラーバーの表示
axis image;                                             % 元画像の比率に

figure;
ave_img = filter2(fspecial('average', 3), noise_img);   % 平滑化フィルタ適用
imagesc(ave_img);                                       % 画像の表示
colormap(gray);                                         % グレイスケールの範囲で表示
colorbar;                                               % カラーバーの表示
axis image;                                             % 元画像の比率に

figure;
med_img = medfilt2(noise_img, [3 3]);	% メディアンフィルタ適用
imagesc(med_img);                       % 画像の表示
colormap(gray);                         % グレイスケールの範囲で表示
colorbar;                               % カラーバーの表示
axis image;                             % 元画像の比率に

figure;
fil = [0, -1, 0; -1, 5, -1; 0, -1, 0];      % 自作フィルタの設計
fil_img = filter2(fil, noise_img, 'same');  % 自作フィルタの適用
imagesc(fil_img);                           % 画像の表示
colormap(gray);                             % グレイスケールの範囲で表示
colorbar;                                   % カラーバーの表示
axis image;                                 % 元画像の比率に

return;
```