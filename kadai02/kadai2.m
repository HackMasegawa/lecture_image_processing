% 課題2 階調数と疑似輪郭
% 2階調，4階調，8階調の画像を生成せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

BIT_MAX = 255;                  % 画素の最大値

org_img = imread('asagao.png'); % 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化
imagesc(org_gray);              % 画像の表示
colormap(gray);                 % グレースケールの範囲で表示
colorbar;                       % カラーバーの表示
axis image;                     % 正方比率に

for i = 1:3
    figure(i);                  
    
    color = 2^i;                % 階調数(2, 4, 8)
    % (color-1)個のしきい値を作ることで(color)階調に変換
    pos_img = org_gray ./ (BIT_MAX/(color-1)) * (BIT_MAX/(color-1));
    imagesc(pos_img);          % 画像の表示
    colormap(gray);             % グレースケールの範囲で表示
    colorbar;                   % カラーバーの表示
    axis image;                 % 正方比率に
end

return;