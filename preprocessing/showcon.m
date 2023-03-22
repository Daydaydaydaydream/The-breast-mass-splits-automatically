%read the tumor label
nii=load_nii('E:\2023_1\graduation_project\DataSet\begin\special_sketching\1660744_2\1660744_t1_vibe_tra_dyn_R.nii');
imgcon=nii.img;
max(imgcon(:))
imgcon=imgcon>0;
%read the original images
nii=load_nii('E:\2023_1\graduation_project\DataSet\begin\special_sketching\1660744_2\1660744_t1_vibe_tra_dyn.nii');
img=nii.img;
img=uint8(img*255/max(img(:)));
sliceno=size(imgcon,3);
for i=1:sliceno;%sliceno
    subplot(121);
    imshowpair(imgcon(:,:,i),img(:,:,i));
    title(i)
    subplot(122);
    imshow(labeloverlay(img(:,:,i),imgcon(:,:,i)));
    title(i)
    pause(0.1);
end