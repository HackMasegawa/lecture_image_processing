% 課題8 ラベリング
% 2値化された画像の連結成分にラベルをつけよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png');	% 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化
imagesc(org_gray);              % 画像の表示
colormap(gray);                 % グレイスケールの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 元画像の比率に

figure;
thr128_img = org_gray > 128;    % 閾値128で2値化
imagesc(thr128_img);            % 画像の表示
colormap(gray);                 % グレイスケールの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 元画像の比率に

figure;
bwl_img = bwlabeln(thr128_img); % 連結成分のラベル付け
imagesc(bwl_img);               % 画像の表示
colormap(jet);                  % jetの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 元画像の比率に

return;