clc;
clear all;
%read the tumor label
nii=load_nii('E:\2023_1\graduation_project\DataSet\begin\special_sketching\2281322_2\2281322_t1_vibe_tra_dyn_contour_R.nii');
imgcon_1=nii.img;
max(imgcon_1(:))
imgcon_1=imgcon_1>0;

nii=load_nii('E:\2023_1\graduation_project\DataSet\begin\special_sketching\2281322_2\2281322_t1_vibe_tra_dyn_L.nii');
imgcon_2=nii.img;
max(imgcon_2(:))
imgcon_2=imgcon_2>0;

imgcon = imgcon_1+imgcon_2;
%read the original images
nii=load_nii('E:\2023_1\graduation_project\DataSet\begin\special_sketching\2281322_2\2281322_t1_vibe_tra_dyn.nii');
img=nii.img;
img=uint8(img*255/max(img(:)));

%ÇÐÆ¬ÊýÁ¿
sliceno=size(imgcon,3);
for i=1:sliceno%sliceno
     img_mask = imgcon(:,:,i);
     img_face = img(:,:,i);
     s = sum(imgcon(:,:,i),'all');
     if s~=0
        save(['E:\data\2281322_' num2str(i)  '.mat'],'img_mask','img_face');
     end
end