# 課題7 ダイナミックレンジの拡大

## 課題内容
画素のダイナミックレンジを0から255にせよ．

## 実施方法
以下ではダイナミックレンジの変更を行う画像として，次の油揚げの写真([https://www.pakutaso.com/20160708193post-8376.html](https://www.pakutaso.com/20160708193post-8376.html))を使用する．
この画像は縦1066画素，横1600画素による長方形のディジタルカラー画像であり，名前は「oage.png」とする．

![原画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai07/oage.png)

図1 原画像

Matlabにより，図1で挙げた画像を読み込むには以下の操作を行えば良い．
```matlab
org_img = imread('oage.png'); % 原画像の読み込み
```

まず，図1で示した原画像をグレイスケール化したとき，次の図2のような画像となった．

![グレイスケール変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai07/oage_gray.png)

図2 グレイスケール変換画像

さらに，このグレイスケール化した画像の濃度ヒストグラムは次の図3のようになった．

![グレイスケール変換画像の濃度ヒストグラム](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai07/oage_gray_hist.png)

図3 グレイスケール変換画像の濃度ヒストグラム

次に，このグレイスケール化した画像のダイナミックレンジを0から255の幅に変更することを考える
図3で示した画素の値について最小値と最大値を調べたところ，最小値は74，最大値は255であった．
これについて画素の値の全体の最小値を0，最大値を255にすればよいから，
次のような操作を行えばダイナミックレンジを0から255の幅に変更が行える．
```matlab
org_gray = double(org_gray);    % 要素を浮動小数点型に
min_pix = min(min(org_gray));   % 要素の最小値
max_pix = max(max(org_gray));   % 要素の最大値
% ダイナミックレンジを0から255に
org_gray2 = (org_gray - min_pix) / (max_pix - min_pix) * 255;
org_gray2 = uint8(org_gray2);   % 要素を8ビット整数型に(この操作について考察)
```
ここで，考察を行うように指示された操作である`uint8`関数について考える．
`unit8`関数は引数とした行列の要素を8ビット整数型にした行列を返す関数である．
この変換により，画像データの各画素を示す値が整数となる．
それ以前の操作が画像全体の画素の値を0から1の幅で表すようにしたのち，
定数255を掛けて0から255の幅で表示するような操作であったから，各値は小数のままである．
濃度ヒストグラムの表示には画素の値は整数でないとならないため，このような操作を行っているということが考えられる．

また，この操作によって，ダイナミックレンジの変換を行った画像は次の図4のようになった．

![ダイナミックレンジ変換画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai07/oage_gray2.png)

図4 ダイナミックレンジ変換画像

さらに，このダイナミックレンジ画像の濃度ヒストグラムは次の図5のようになった．

![ダイナミックレンジ変換画像の濃度ヒストグラム](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai07/oage_gray2_hist.png)

図5 ダイナミックレンジ変換画像の濃度ヒストグラム

本報告書では，画像のダイナミックレンジの変更を行った．
画像におけるダイナミックレンジとは，画像の持つ濃度に対して，表現する色の幅のことである．
そのため，このダイナミックレンジが大きいほど，幅広い画像の濃度の出力が行える．
今回使用した図2のグレイスケール化した元画像の画素について，最小値は74，最大値は255であり，これがダイナミックレンジと言える．
これに対して，ダイナミックレンジを0から，255に変換した画像が図4である．
図3と図5のヒストグラムを見比べると，値の分布が，形はそのままにより広域になっていることが分かる．
しかし，それらに対応する図2，図4を見比べても一見した違いは見られない．
これは，元々の画像と変換した画像について，ダイナミックレンジがほぼ同じであったことが理由として言える．
そのため，例えば次の図6のようにダイナミックレンジを0から7，すなわち8値化変換すると違いが分かりやすくなる．

![0から7のダイナミックレンジに変換した画像](https://raw.githubusercontent.com/HackMasegawa/lecture_image_processing/img/img/kadai07/oage_pos8.png)

図6 0から7のダイナミックレンジに変換した画像


## 付録

本報告書の作成にあたって，実際に実行したMatlabソースコードを次に示す．

ソースコード1 kadai7.m
```matlab
% 課題7 ダイナミックレンジの拡大
% 画素のダイナミックレンジを0から255にせよ． 

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('oage.png');   % 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化

imagesc(org_gray);      % 画像の表示
colormap(gray);         % グレイスケールの範囲で表示
colorbar;               % カラーバーの表示
axis image;             % 元画像の比率に

figure;
imhist(org_gray);       % ヒストグラムの表示

org_gray = double(org_gray);    % 要素を浮動小数点型に
min_pix = min(min(org_gray));   % 要素の最小値
max_pix = max(max(org_gray));   % 要素の最大値
% ダイナミックレンジを0から255に
org_gray2 = (org_gray - min_pix) / (max_pix - min_pix) * 255;

figure;
imagesc(org_gray2);     % 画像の表示
colormap(gray);         % グレイスケールの範囲で表示
colorbar;               % カラーバーの表示
axis image;             % 元画像の比率に

figure;
org_gray2 = uint8(org_gray2);   % 要素を8ビット整数型に(この操作について考察)
imhist(org_gray2);              % ヒストグラムの表示

return;
```