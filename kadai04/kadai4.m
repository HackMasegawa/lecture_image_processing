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