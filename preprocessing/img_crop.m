inpath='E:\data\maligment_mat';
outpath='E:\data\maligment_286';
pngout='E:\data\maligment_286_png';
a = dir(inpath);
b = {a.name};
b = b(3:length(b));
for i =1:length(b)
    load(fullfile(inpath,b{i}));
    
    if size(img_face,1) ~= 285 | size(img_face,2) ~=285
        img_face1=img_face;
        img_mask1=img_mask;
        img_face=double(zeros(285,285));
        img_mask=double(zeros(285,285));
        s1=size(img_face1,1);
        s2=size(img_face1,2);
        img_face=img_face1(round(s1-285)/2:round(s1-285)/2+285,s2-285:s2);
        img_mask=img_mask1(round(s1-285)/2:round(s1-285)/2+285,s2-285:s2);
        save(fullfile(outpath,b{i}),'img_face','img_mask');
        imwrite(img_face,fullfile(pngout,[b{i} '_img.png']));
        imwrite(img_mask,fullfile(pngout,[b{i} '_mask.png']));
    else
        save(fullfile(outpath,b{i}),'img_face','img_mask');
    end
end