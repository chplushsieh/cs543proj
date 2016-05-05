function [error] = load_error(network_name)
%
path = ['results/exp/cifar-100-inception-v1-' network_name '/net-epoch-81.mat'];
result = load(path);
error = [result.stats.val.error];
end
