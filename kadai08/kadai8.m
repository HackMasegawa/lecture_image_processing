% �ۑ�8 ���x�����O
% 2�l�����ꂽ�摜�̘A�������Ƀ��x��������D

clear;      % �ϐ��̃N���A
close all;  % �}�\�̃N���A

org_img = imread('asagao.png');	% ���摜�̓���
org_gray = rgb2gray(org_img);   % �O���C�X�P�[����
imagesc(org_gray);              % �摜�̕\��
colormap(gray);                 % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                       % �J���[�o�[�̕\��
axis image;                     % ���摜�̔䗦��

figure;
thr128_img = org_gray > 128;    % 臒l128��2�l��
imagesc(thr128_img);            % �摜�̕\��
colormap(gray);                 % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                       % �J���[�o�[�̕\��
axis image;                     % ���摜�̔䗦��

figure;
bwl_img = bwlabeln(thr128_img); % �A�������̃��x���t��
imagesc(bwl_img);               % �摜�̕\��
colormap(jet);                  % jet�͈̔͂ŕ\��
colorbar;                       % �J���[�o�[�̕\��
axis image;                     % ���摜�̔䗦��

return;