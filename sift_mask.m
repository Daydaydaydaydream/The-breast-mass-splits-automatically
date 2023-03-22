clc;
clear;

inpath = 'E:\data\exp_3_14\train_2';
outpath = 'E:\data\exp_3_14\train_cancer';
a = dir(inpath);
b = {a.name};

for i = 3:length(b)
    img = load(fullfile(inpath,b{i}));
    s = sum(img.img_mask,'all');
    if s~=0
        movefile(fullfile(inpath,b{i}),outpath)
    end
end