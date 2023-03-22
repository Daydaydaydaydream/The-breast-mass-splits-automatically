clc;
clear;
inpath='E:\2023_3\exp_3_21_u2net\result_mat';
outpath='E:\2023_3\exp_3_21_u2net\result_2';
%将dice和病人id配准
a = dir(inpath);
b = {a.name};
b = b(3:length(b));
c = split(b,'.');
c = c(:,:,1);
%对每个病人新建文件夹
f = split(b,'_');
f = f(:,:,1);
name = [];
for i =2:length(f)
    name1 = cell2mat(f(i));
    name2 = str2double(name1);
    name(i) = name2;
    if name(i) ~= name(i-1)
        mkdir(fullfile(outpath,name1));
    end
end
%将有病灶切片放入文件夹
for i=1:length(b)
    img = load(fullfile(inpath,b{i}));
%     s = sum(img.img_mask,'all');
%     if s~=0
%        copyfile(fullfile(inpath,b{i}),fullfile(outpath,f{i}));
%     end
    copyfile(fullfile(inpath,b{i}),fullfile(outpath,f{i}));
end