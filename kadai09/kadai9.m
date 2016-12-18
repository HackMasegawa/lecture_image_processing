% �ۑ�9 ���f�B�A���t�B���^�Ɛ�s��
% ���f�B�A���t�B���^�[��K�p���C�m�C�Y������̌�����D

clear;      % �ϐ��̃N���A
close all;  % �}�\�̃N���A

org_img = imread('asagao.png');	% ���摜�̓���
org_gray = rgb2gray(org_img);   % �O���C�X�P�[����
imagesc(org_gray);              % �摜�̕\��
colormap(gray);                 % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                       % �J���[�o�[�̕\��
axis image;                     % ���摜�̔䗦��

figure;
noise_img = imnoise(org_gray, 'salt & pepper', 0.02);	% �m�C�Y�̓Y�t
imagesc(noise_img);                                     % �摜�̕\��
colormap(gray);                                         % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                                               % �J���[�o�[�̕\��
axis image;                                             % ���摜�̔䗦��

figure;
ave_img = filter2(fspecial('average', 3), noise_img);   % �������t�B���^�K�p
imagesc(ave_img);                                       % �摜�̕\��
colormap(gray);                                         % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                                               % �J���[�o�[�̕\��
axis image;                                             % ���摜�̔䗦��

figure;
med_img = medfilt2(noise_img, [3 3]);	% ���f�B�A���t�B���^�K�p
imagesc(med_img);                       % �摜�̕\��
colormap(gray);                         % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                               % �J���[�o�[�̕\��
axis image;                             % ���摜�̔䗦��

figure;
fil = [0, -1, 0; -1, 5, -1; 0, -1, 0];      % ����t�B���^�̐݌v
fil_img = filter2(fil, noise_img, 'same');  % ����t�B���^�̓K�p
imagesc(fil_img);                           % �摜�̕\��
colormap(gray);                             % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                                   % �J���[�o�[�̕\��
axis image;                                 % ���摜�̔䗦��

return;