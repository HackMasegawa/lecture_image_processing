% 課題1　標本化間隔と空間解像度
% 画像をダウンサンプリングして(標本化間隔を大きくして)表示せよ．

clear;      % 変数のクリア
close all;  % 図表のクリア

org_img = imread('asagao.png'); % 原画像の読み込み
subplot(231);
image(org_img);                 % 原画像の表示
axis image;                     % 正方形比率に
xlabel('Original Image');       

for i = 2:6
    ratio = 2^(i-1);        % ダウンサンプリング比率
    % 1/ratio 倍に縮小後，ratio倍に拡大することで
    % 1/ratio 倍のダウンサンプリング操作を行える
    res_img = imresize(imresize(org_img, 1/ratio), ratio, 'box');
    subplot(2, 3, i);
    image(res_img);         % ダウンサンプリング画像の表示
    axis image;             % 正方形比率に
    xlabel(['1/', num2str(ratio), ' Sampling']);
    
    imwrite(res_img, ['asagao_', num2str(i), '.png']);  % 画像の保存
end

return;