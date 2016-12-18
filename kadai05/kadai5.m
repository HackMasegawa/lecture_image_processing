% 課題5 判別分析法
% 判別分析法を用いて画像二値化せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png'); % 原画像の入力
org_gray = rgb2gray(org_img);   % グレイスケール化

imagesc(org_gray);          % 画像の表示
colormap(gray);             % グレイスケールの範囲で表示
colorbar;                   % カラーバーの表示
axis image;                 % 正方比率に

hist = imhist(org_gray);    % グレイスケールのヒストグラム
mean_h = mean(hist);
sigmas = zeros(1, 255);     % クラス間分散を格納する配列
% クラス間分散が最大になるような閾値を探す
for i = 1:255
    class_b = hist(1:i);    % 輝度の低い黒クラス
    class_w = hist(i:255);  % 輝度の高い白クラス
    
    n_b = sum(class_b);     % 黒クラスの画素数
    n_w = sum(class_w);     % 白クラスの画素数
    mean_b = mean(class_b); % 黒クラスの平均
    mean_w = mean(class_w); % 白クラスの平均
    var_b = var(class_b);   % 黒クラスの分散
    var_w = var(class_w);   % 白クラスの分散
    
    
    sigma_w = (n_b * var_b + n_w * var_w);                              % クラス内分散
    sigma_b = (n_b *(mean_b - mean_h)^2 + n_w * (mean_w - mean_h)^2);   % クラス間分散
    sigmas(i) = sigma_b / sigma_w;
end

figure;
[val, t] = max(sigmas);     % sigmasが最大であるインデックスが最適な閾値
thr_img = org_gray > t;     % 閾値tによる2値化
imagesc(thr_img);           % 画像の表示
colormap(gray);             % グレイスケールの範囲で表示
colorbar;                   % カラーバーの表示
axis image;                 % 正方比率に

return;