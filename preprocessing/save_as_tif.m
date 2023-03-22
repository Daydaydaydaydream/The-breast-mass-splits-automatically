clc;
clear;

inpath='E:\data\test_2';
outpath='E:\data\test_jpg';
a = dir(inpath);
b = {a.name};

for i = 3:length(b)
    img = load(fullfile(inpath,b{i}));
    imwrite(img.img_face,fullfile(outpath,[b{i},'.jpg']));
end