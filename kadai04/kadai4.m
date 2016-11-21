% �ۑ�4 �摜�̃q�X�g�O����
% ��f�̔Z�x�q�X�g�O�����𐶐�����D

clear;      % �ϐ��̃N���A
close all;  % �}�\�̃N���A

org_img = imread('asagao.png'); % ���摜�̓���
org_gray = rgb2gray(org_img);   % �O���C�X�P�[����

imagesc(org_gray);          % �摜�̕\��
colormap(gray);             % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                   % �J���[�o�[�̕\��
axis image;                 % �����䗦��

figure(2);
imhist(org_gray);           % �q�X�g�O�����̕\��

figure(3);
pos8_img = imread('pos8.png');      % 8�K�����摜�̓���

pos8_gray = rgb2gray(pos8_img);	% �O���C�X�P�[����
imagesc(pos8_gray);             % �摜�̕\��
colormap(gray);                 % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                       % �J���[�o�[�̕\��
axis image;                     % �����䗦��

figure(4);
imhist(pos8_gray);           % �q�X�g�O�����̕\��

return;