% clear everything
close all;
clearvars;

% load errors
kl = load_error('kl'); % KL*+BNorm+weighted
kl_l2 = load_error('kl-l2'); % KL*+BNorm+weighted+L2
kl_nobn = load_error('kl-noBN'); % KL*+weighted
kl_nobn_uni = load_error('kl-noBN-uni'); % KL*+uniform
kl_uni = load_error('kl-uni'); % KL*+BNorm+uniform
log = load_error('log'); % BNorm
loge = load_error('loge'); % BNorm+uniform
nothing = load_error('nothing'); % L2

% set saved file path
savedir = './figures/';
if ~exist(savedir, 'dir')
    mkdir(savedir)
end

% --------------------------------------------------------------------
%                                -kl-l2, -log, -loge
% --------------------------------------------------------------------
x = 1:size(kl, 2);
y1 = kl_l2;
y2 = log;
y3 = loge;

figure
plot(x,y1,x,y2,'--', x, y3, '-.')
title('Loss Functions Comparison')
xlabel('epoch')
ylabel('error')
legend('KL*+BNorm+weighted+L2','BNorm', 'BNorm+uniform')
saveas(gcf,[savedir 'loss.png'])

% --------------------------------------------------------------------
%                                -nothing, -kl-noBM-uni, -log
% --------------------------------------------------------------------
x = 1:size(kl, 2);
y1 = nothing;
y2 = kl_nobn_uni;
y3 = log;

figure
plot(x,y1,x,y2,'--', x, y3, '-.')
title('KL vs Batch Normalization')
xlabel('epoch')
ylabel('error')
legend('L2','KL*+uniform', 'BNorm')
saveas(gcf,[savedir 'kl_bn.png'])

% --------------------------------------------------------------------
%                                kl, kl-uni
% --------------------------------------------------------------------
x = 1:size(kl, 2);
y1 = kl;
y2 = kl_uni;

figure
plot(x,y1,x,y2,'--')
title('Class Weighted vs Uniform')
xlabel('epoch')
ylabel('error')
legend('KL*+BNorm+weighted','KL*+BNorm+uniform')
saveas(gcf,[savedir 'uni.png'])

% --------------------------------------------------------------------
%                                kl, kl-l2
% --------------------------------------------------------------------
x = 1:size(kl, 2);
y1 = kl;
y2 = kl_l2;

figure
plot(x,y1,x,y2,'--')
title('Effect of L2 Regulation')
xlabel('epoch')
ylabel('error')
legend('KL*+BNorm+weighted','KL*+BNorm+weighted+L2')
saveas(gcf,[savedir 'l2.png'])
