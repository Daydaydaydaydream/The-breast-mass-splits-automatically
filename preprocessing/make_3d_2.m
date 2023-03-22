clc
clear;
inpath1='E:\2023_3\exp_3_21_u2net\result_2';
outpath='E:\2023_3\exp_3_21_u2net\result_3d';

a = dir(inpath1);
b = sort_nat({a.name});
b = b(3:length(b));
e = cell(33,1);
%将每个文件夹的mask切片拼接成3维数组
for i = 1:length(b)
    c = dir(fullfile(inpath1,b{i}));
    d = sort_nat({c.name});
    f = [];
    d = d(3:length(d));
    for j=1:length(d)
        A = load(fullfile(inpath1,b{i},d{j}));
        %根据对象确定mask还是result
        f(:,:,j) = A.img_result;
    end
    save(fullfile(outpath,b{i},[b{i},'_3d.mat']),"f");
end
