% clear everything
close all;
clearvars;

% load errors
kl = load_error('kl');
kl_l2 = load_error('kl-l2');
kl_nobn = load_error('kl-noBN');
kl_nobn_uni = load_error('kl-noBN-uni');
kl_uni = load_error('kl-uni');
log = load_error('log');
loge = load_error('loge');
nothing = load_error('nothing');

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
title('Loss functions')
xlabel('epoch')
ylabel('error')
legend('kl_l2','log', 'loge')
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
title('KL and Batch Normalization')
xlabel('epoch')
ylabel('error')
legend('nothing','kl_nobn_uni', 'log')
saveas(gcf,[savedir 'kl_bn.png'])

% --------------------------------------------------------------------
%                                kl, kl-uni
% --------------------------------------------------------------------
x = 1:size(kl, 2);
y1 = kl;
y2 = kl_uni;

figure
plot(x,y1,x,y2,'--')
title('Uniform')
xlabel('epoch')
ylabel('error')
legend('kl','kl_uni')
saveas(gcf,[savedir 'uni.png'])

% --------------------------------------------------------------------
%                                kl, kl-l2
% --------------------------------------------------------------------
x = 1:size(kl, 2);
y1 = kl;
y2 = kl_l2;

figure
plot(x,y1,x,y2,'--')
title('L2 Regulation')
xlabel('epoch')
ylabel('error')
legend('kl','kl_l2')
saveas(gcf,[savedir 'l2.png'])
