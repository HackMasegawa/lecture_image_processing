% �ۑ�3 臒l����
% 臒l��4�p�^�[���ݒ肵�C臒l���������摜�������D

clear;      % �ϐ��̃N���A
close all;  % �}�\�̃N���A

BIT_MAX = 255;                  % ��f�̍ő�l

org_img = imread('asagao.png'); % ���摜�̓���
org_gray = rgb2gray(org_img);   % �O���C�X�P�[����

for i = 1:4
    figure(i);                  
    
    % �P�x�� (BIT_MAX * (i/5)) ���傫����f��1�C����ȊO��0��
    % 臒l�ɂ�51�C102�C153�C204��4�p�^�[����I��
    thr_img = org_gray > (BIT_MAX * (i/5));
    imagesc(thr_img);           % �摜�̕\��
    colormap(gray);             % �O���[�X�P�[���͈̔͂ŕ\��
    colorbar;                   % �J���[�o�[�̕\��
    axis image;                 % �����䗦��
end

return;