% �ۑ�2 �K�����Ƌ^���֊s
% 2�K���C4�K���C8�K���̉摜�𐶐�����D

clear;      % �ϐ��̃N���A
close all;  % �}�\�̃N���A

BIT_MAX = 255;                  % ��f�̍ő�l

org_img = imread('asagao.png'); % ���摜�̓���
org_gray = rgb2gray(org_img);   % �O���C�X�P�[����
imagesc(org_gray);              % �摜�̕\��
colormap(gray);                 % �O���[�X�P�[���͈̔͂ŕ\��
colorbar;                       % �J���[�o�[�̕\��
axis image;                     % �����䗦��

for i = 1:3
    figure(i);                  
    
    color = 2^i;                % �K����(2, 4, 8)
    % (color-1)�̂������l����邱�Ƃ�(color)�K���ɕϊ�
    pos_img = org_gray ./ (BIT_MAX/(color-1)) * (BIT_MAX/(color-1));
    imagesc(pos_img);          % �摜�̕\��
    colormap(gray);             % �O���[�X�P�[���͈̔͂ŕ\��
    colorbar;                   % �J���[�o�[�̕\��
    axis image;                 % �����䗦��
end

return;