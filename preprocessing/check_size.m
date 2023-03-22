inpath='E:\data\all_286';
a = dir(inpath);
b = {a.name};
b = b(3:length(b));
img_size = [];
for i =1:length(b)
    load(fullfile(inpath,b{i}));
    img_size(i,1)=size(img_mask,1);
    img_size(i,2)=size(img_mask,2);
end