close all;
clear;
clc;

% load HIs
load 'WT_HIs.mat';
[row, col] = size(feas);
index = 1 : col;
% the number of the front normal epochs for thresholds calculation
cnt = 50;
num = 4;
% names of different HIs
names = {'Kurtosis', 'RMS', 'L2/L1 norm', 'Negative entropy', 'Smoothness index', 'Gini index',...
    'Approximate entropy', 'Negative complexity', 'CCA', 'PCA', 'Auto-Encoder', 'Proposed HI'};
figure;
for i = 1 : row
    HI = feas(i, :);
    meanV = mean(HI(1, 1 : cnt));
    sigV = std(HI(1, 1 : cnt));
    subplot(row/num, num, i);
    plot(index, HI, 'b'); hold on;
    % the 3sigma interval
    plot([1, col], [meanV + 3*sigV, meanV + 3*sigV], '--r', 'Linewidth', 0.8); hold on;
    plot([1, col], [meanV - 3*sigV, meanV - 3*sigV], '--r', 'Linewidth', 0.8); hold off;
    xlabel('Time (Day)');
    ylabel('Value');
    xlim([0, col]);
    title(names(i));
    set(gca,'FontName','Times new roman');
    set(gcf,'Position',[300,300,800,420]);
    % adjust the range for better illustration
    if i == 7
        ylim([1.5, 2.5]);
    elseif i == 9
        ylim([-0.1, inf]);
    elseif i == 10
        ylim([-0.3, inf]);
    elseif i == 11
        ylim([-0.1, inf]);
    elseif i == 12
        ylim([-0.02, inf]);
    end
end