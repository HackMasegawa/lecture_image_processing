% �ۑ�10 �摜�̃G�b�W���o 
% ���̃v���O�������Q�l�ɂ��āC�G�b�W���o��̌�����D

clear;      % �ϐ��̃N���A
close all;  % �}�\�̃N���A

org_img = imread('asagao.png');	% ���摜�̓���
org_gray = rgb2gray(org_img);   % �O���C�X�P�[����
imagesc(org_gray);              % �摜�̕\��
colormap(gray);                 % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                       % �J���[�o�[�̕\��
axis image;                     % ���摜�̔䗦��

figure;
pre_edge = edge(org_gray, 'prewitt');   % �G�b�W���o(�v���E�B�b�g�@)
imagesc(pre_edge);                      % �摜�̕\��
colormap(gray);                         % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                               % �J���[�o�[�̕\��
axis image;                             % ���摜�̔䗦��

figure;
sob_edge = edge(org_gray, 'sobel');     % �G�b�W���o(�\�x���@)
imagesc(sob_edge);                      % �摜�̕\��
colormap(gray);                         % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                               % �J���[�o�[�̕\��
axis image;                             % ���摜�̔䗦��

figure;
can_edge = edge(org_gray, 'canny');     % �G�b�W���o(�L���j�[�@)
imagesc(can_edge);                      % �摜�̕\��
colormap(gray);                         % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                               % �J���[�o�[�̕\��
axis image;                             % ���摜�̔䗦��

return;