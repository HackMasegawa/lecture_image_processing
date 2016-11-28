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
org_bin = org_gray > 128;   % 閾値128による2値化
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