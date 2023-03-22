clc;
clear;
inpath='E:\data\begin\begin_contour';
a = dir(inpath);
b = {a.name};
%dpi
dpi = [];
for i = 3:4
    c = dir(fullfile(inpath,b{i}));
    d = {c.name};
    nii = load_nii(fullfile(inpath,b{i},d{3}));
    dpi(i,1) = nii.original.hdr.dime.pixdim(2);
    dpi(i,2) = nii.original.hdr.dime.pixdim(3);
    %插值
    samplesize = dpi(i,1)/1.0227;
    im = imresize(img,[imgsize1*samplesize,imsize2*samplesie]);
end