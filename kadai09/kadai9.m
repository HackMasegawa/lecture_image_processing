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