clc
clear all;
inpath = 'E:\data\maligment\maligment_contour';

a=dir(inpath);
b={a.name};
for k=3:length(b)
    temp=dir(fullfile(inpath,b{k}));
    filename = {temp.name};
    %解压gz文件
    %unpackfile_1 = gunzip (fullfile('E:\2023_1\graduation_project\DataSet\maligment\maligment_contour',b{k},filename{4}));
    %read the tumor label
    %nii=load_nii(unpackfile_1{1});
    unpackfile_1 = fullfile(inpath,b{k},filename{5})
    nii=load_nii(unpackfile_1);
    
    imgcon=double(nii.img);
    max(imgcon(:))
    imgcon=imgcon>0;
    %解压gz文件
    %unpackfile_2 = gunzip (fullfile('E:\2023_1\graduation_project\DataSet\maligment\maligment_contour',b{k},filename{3}));
    %read the original images
    %nii=load_nii(unpackfile_2{1});
    unpackfile_2 = fullfile(inpath,b{k},filename{3})
    nii=load_nii(unpackfile_2);
    img=double(nii.img);
    img=img/max(img(:));
    
    %切片数量
    sliceno=size(imgcon,3);
    for i=1:sliceno%sliceno
        img_mask = imgcon(:,:,i);
        img_face = img(:,:,i);
        save(['E:\data\maligment_mat\' b{k} '_' num2str(i)  '.mat'],'img_mask','img_face');
    end
end
