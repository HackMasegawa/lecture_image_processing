% 課題10 画像のエッジ抽出 
% 次のプログラムを参考にして，エッジ抽出を体験せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png');	% 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化
imagesc(org_gray);              % 画像の表示
colormap(gray);                 % グレイスケールの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 元画像の比率に

figure;
pre_edge = edge(org_gray, 'prewitt');   % エッジ検出(プレウィット法)
imagesc(pre_edge);                      % 画像の表示
colormap(gray);                         % グレイスケールの範囲で表示
colorbar;                               % カラーバーの表示
axis image;                             % 元画像の比率に

figure;
sob_edge = edge(org_gray, 'sobel');     % エッジ検出(ソベル法)
imagesc(sob_edge);                      % 画像の表示
colormap(gray);                         % グレイスケールの範囲で表示
colorbar;                               % カラーバーの表示
axis image;                             % 元画像の比率に

figure;
can_edge = edge(org_gray, 'canny');     % エッジ検出(キャニー法)
imagesc(can_edge);                      % 画像の表示
colormap(gray);                         % グレイスケールの範囲で表示
colorbar;                               % カラーバーの表示
axis image;                             % 元画像の比率に

return;