% 課題3 閾値処理
% 閾値を4パターン設定し，閾値処理した画像を示せ．

clear;      % 変数のクリア
close all;  % 図表のクリア

BIT_MAX = 255;                  % 画素の最大値

org_img = imread('asagao.png'); % 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化

for i = 1:4
    figure(i);                  
    
    % 輝度が (BIT_MAX * (i/5)) より大きい画素を1，それ以外を0に
    % 閾値には51，102，153，204の4パターンを選択
    thr_img = org_gray > (BIT_MAX * (i/5));
    imagesc(thr_img);           % 画像の表示
    colormap(gray);             % グレースケールの範囲で表示
    colorbar;                   % カラーバーの表示
    axis image;                 % 正方比率に
end

return;