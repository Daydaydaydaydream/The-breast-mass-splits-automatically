clc;
clear;

inpath1 = 'E:\2023_3\exp_3_17\test_output_3d_3';
inpath2 = 'E:\2023_3\exp_3_21_u2net\result_3d_2';
a1 = dir(inpath1);
a2 = dir(inpath2);
b1 = sort_nat({a1.name});
b2 = sort_nat({a2.name});
b1 = b1(3:length(b1));
b2 = b2(3:length(b2));
dice = [];
%载入两个矩阵
for i =1:length(b1)
    img1 = load(fullfile(inpath1,b1{i}));
    img2 = load(fullfile(inpath2,b2{i}));
    intersect = img1.f.*img2.f;
    s1 = sum(img1.f,"all");
    s2 = sum(img2.f,"all");
    s3 = sum(intersect,"all");
%dice计算
    dice(i) = (2.*s3)./(s1+s2);
end