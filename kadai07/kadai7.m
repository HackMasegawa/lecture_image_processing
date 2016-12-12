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
org_gray2 = (org_gray - min_pix) / (max_pix - min_pix) * 7;
org_gray2 = uint8(org_gray2);   % 要素を8ビット整数型に(この操作について考察)

figure;
imagesc(org_gray2);     % 画像の表示
colormap(gray);         % グレイスケールの範囲で表示
colorbar;               % カラーバーの表示
axis image;             % 元画像の比率に

figure;
org_gray2 = uint8(org_gray2);   % 要素を8ビット整数型に(この操作について考察)
imhist(org_gray2);              % ヒストグラムの表示

return;