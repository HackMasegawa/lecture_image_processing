% �ۑ�7 �_�C�i�~�b�N�����W�̊g��
% ��f�̃_�C�i�~�b�N�����W��0����255�ɂ���D 

clear;      % �ϐ��̃N���A
close all;  % �}�\�̃N���A

org_img = imread('oage.png');   % ���摜�̓���
org_gray = rgb2gray(org_img);   % �O���C�X�P�[����

imagesc(org_gray);      % �摜�̕\��
colormap(gray);         % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;               % �J���[�o�[�̕\��
axis image;             % ���摜�̔䗦��

figure;
imhist(org_gray);       % �q�X�g�O�����̕\��

org_gray = double(org_gray);    % �v�f�𕂓������_�^��
min_pix = min(min(org_gray));   % �v�f�̍ŏ��l
max_pix = max(max(org_gray));   % �v�f�̍ő�l
% �_�C�i�~�b�N�����W��0����255��
org_gray2 = (org_gray - min_pix) / (max_pix - min_pix) * 7;
org_gray2 = uint8(org_gray2);   % �v�f��8�r�b�g�����^��(���̑���ɂ��čl�@)

figure;
imagesc(org_gray2);     % �摜�̕\��
colormap(gray);         % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;               % �J���[�o�[�̕\��
axis image;             % ���摜�̔䗦��

figure;
org_gray2 = uint8(org_gray2);   % �v�f��8�r�b�g�����^��(���̑���ɂ��čl�@)
imhist(org_gray2);              % �q�X�g�O�����̕\��

return;