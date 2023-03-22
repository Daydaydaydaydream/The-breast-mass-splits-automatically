clc
clear;

testpath='E:\2023_3\exp_3_17\data\test_2';
resultpath='E:\2023_3\exp_3_17\test_output';
a_1=dir(testpath);
b_1=sort_nat({a_1.name});
a_2=dir(resultpath);
b_2=sort_nat({a_2.name});
dice = [];
dice_average = [];

for i = 3:length(b_1)
    img = load(fullfile(testpath,b_1{i}));
    img_mask = img.img_mask;
    img_result = imread(fullfile(resultpath,b_2{i}));
    img_result = rgb2gray(img_result);
    %归一化
    img_result_max=max(max(img_result));
    img_result_min=min(min(img_result));
    img_result=(img_result-img_result_min+1)./(img_result_max-img_result_min+1);
    %dice 计算
    %相交面积
    img_mask_double = double(img_mask);
    img_result_double = double(img_result);
    img_intersect = img_result_double.*img_mask_double;
    intersect = sum(img_intersect,'all');
    mask = sum(img_mask_double,'all');
    result = sum(img_result_double,'all');
    %smooth = 1
    dice(i) = (2.*intersect)./(mask+result);
end