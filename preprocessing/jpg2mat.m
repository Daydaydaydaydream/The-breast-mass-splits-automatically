clc;
clear;

inpath = 'E:\2023_3\exp_3_21_u2net\result';
outpath = 'E:\2023_3\exp_3_21_u2net\result_mat';
a = dir(inpath);
b = sort_nat({a.name});
b = b(3:length(b));

for i=1:length(b)
    c =split(b{i},'.');
    img = imread(fullfile(inpath,b{i}));
    img_result = rgb2gray(img);
    save(fullfile(outpath,[c{1},'.mat']),'img_result');
end