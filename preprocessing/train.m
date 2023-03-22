clc;
clear;

inpath='E:\data\all';
outpath='E:\data\train';
a = dir(inpath);
b = {a.name};
b = b(3:length(b));
c=[];
c=randperm(77,77);
for i=1:77
    j = c(i);
    movefile(fullfile(inpath,b{j}),outpath);
end