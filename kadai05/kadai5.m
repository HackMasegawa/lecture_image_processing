% �ۑ�5 ���ʕ��͖@
% ���ʕ��͖@��p���ĉ摜��l������D

clear;      % �ϐ��̃N���A
close all;  % �}�\�̃N���A

org_img = imread('asagao.png'); % ���摜�̓���
org_gray = rgb2gray(org_img);   % �O���C�X�P�[����

imagesc(org_gray);          % �摜�̕\��
colormap(gray);             % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                   % �J���[�o�[�̕\��
axis image;                 % �����䗦��

hist = imhist(org_gray);    % �O���C�X�P�[���̃q�X�g�O����
mean_h = mean(hist);
sigmas = zeros(1, 255);     % �N���X�ԕ��U���i�[����z��
% �N���X�ԕ��U���ő�ɂȂ�悤��臒l��T��
for i = 1:255
    class_b = hist(1:i);    % �P�x�̒Ⴂ���N���X
    class_w = hist(i:255);  % �P�x�̍������N���X
    
    n_b = sum(class_b);     % ���N���X�̉�f��
    n_w = sum(class_w);     % ���N���X�̉�f��
    mean_b = mean(class_b); % ���N���X�̕���
    mean_w = mean(class_w); % ���N���X�̕���
    var_b = var(class_b);   % ���N���X�̕��U
    var_w = var(class_w);   % ���N���X�̕��U
    
    
    sigma_w = (n_b * var_b + n_w * var_w);                              % �N���X�����U
    sigma_b = (n_b *(mean_b - mean_h)^2 + n_w * (mean_w - mean_h)^2);   % �N���X�ԕ��U
    sigmas(i) = sigma_b / sigma_w;
end

figure;
[val, t] = max(sigmas);     % sigmas���ő�ł���C���f�b�N�X���œK��臒l
thr_img = org_gray > t;     % 臒lt�ɂ��2�l��
imagesc(thr_img);           % �摜�̕\��
colormap(gray);             % �O���C�X�P�[���͈̔͂ŕ\��
colorbar;                   % �J���[�o�[�̕\��
axis image;                 % �����䗦��

return;