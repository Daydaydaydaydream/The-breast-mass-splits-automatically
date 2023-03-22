clc
clear;

inpath = 'E:\data\maligment_mat';
outpath = 'E:\data\maligment_png';
a = dir(inpath);
b = {a.name};
for i =3:length(b)
    load(b{i});
    img = labeloverlay(img_face,img_mask);
    imwrite(img,fullfile(outpath,[b{i},'.png']))
%     subplot(111);
%     imshow(labeloverlay(img_face,img_mask));
%     title(i)
end