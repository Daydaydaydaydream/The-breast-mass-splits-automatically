clc;
clear;
inpath1 = 'E:\2023_3\exp_3_17\data\test_2';
inpath2 = 'E:\2023_3\exp_3_21_u2net\result_mat';
a1 = dir(inpath1);
a2 = dir(inpath2);
b1 = sort_nat({a1.name});
b2 = sort_nat({a2.name});
dice = [];
for i =3:length(b2)
    A1 = load(fullfile(inpath1,b1{i}));
    A2 = load(fullfile(inpath2,b2{i}));
    mask = A1.img_mask;
    result = A2.img_result;
    result = logical(result);
    intersect = mask.*result;
    s1 = sum(mask,'all');
    s2 = sum(result,'all');
    s3 = sum(intersect,'all');
    dice(i) = (2.*s3)./(s1+s2+1);
end
