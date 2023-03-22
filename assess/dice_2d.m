clc
clear all;
testpath='E:\data\test_png';
resultpath='E:\2023_3\exp_3_13\data\test_output';
a_1=dir(testpath);
b_1={a_1.name};
a_2=dir(resultpath);
b_2={a_2.name};
dice = [];
dice_average = [];
for i = 3:1053
    c_1=dir(fullfile(testpath,b_1{i}));
    c_2=dir(fullfile(resultpath,b_2{i}));
    e_1={c_1.name};
    e_2={c_2.name};
    f_1={c_1.folder};
    f_2={c_2.folder};
    for j = 3:length(e_1)
        load(fullfile(f_1{j},e_1{j}));
        img_result = imread(fullfile(f_2{j},e_2{j}));
        img_result = rgb2gray(img_result);
        %归一化
        img_result_max=max(max(img_result));
        img_result_min=min(min(img_result));
        img_result=(img_result-img_result_min)/(img_result_max-img_result_min);
        %dice 计算
        %相交面积
        img_mask_double = double(img_mask);
        img_result_double = double(img_result);
        img_intersect = img_result_double.*img_mask_double;
        intersect = sum(img_intersect);
        mask = sum(img_mask);
        result = sum(img_result);
        %smooth = 1
        dice(i-2,j-2) = (2.*intersect+1)/(mask+result+1);
    end
end
%个人平均dice计算
% for i=3:25
%     c_1=dir(fullfile('E:\2023_1\graduation_project\2_27_dice\test_3d',b_1{i}));
%     c_2=dir(fullfile('E:\2023_1\graduation_project\2_27_dice\result_3d',b_2{i}));
%     e_1={c_1.name};
%     e_2={c_2.name};
%     A = sum(dice,2);
%     dice_average(i)=A(i-2)/(length(e_1)-2);
% end    
