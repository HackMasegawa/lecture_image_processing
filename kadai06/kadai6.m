% �ۑ�6 �摜��2�l��
% �摜��2�l������D

clear;      % �ϐ��̃N���A
close all;  % �}�\�̃N���A

org_img = imread('asagao.png'); % ���摜�̓���
org_gray = rgb2gray(org_img);   % �O���C�X�P�[����

imagesc(org_gray);          % �摜�̕\��
colormap(gray);             % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                   % �J���[�o�[�̕\��
axis image;                 % �����䗦��

figure;
org_bin = org_gray > 128;   % 臒l128�ɂ��2�l��
imagesc(org_bin);           % �摜�̕\��
colormap(gray);             % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                   % �J���[�o�[�̕\��
axis image;                 % �����䗦��

figure;
org_dith = dither(org_gray);% �f�B�U�@�ɂ���l��
imagesc(org_dith);          % �摜�̕\��
colormap(gray);             % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                   % �J���[�o�[�̕\��
axis image;                 % �����䗦��

return;