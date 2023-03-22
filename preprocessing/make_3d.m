clc
clear;
inpath='E:\2023_3\exp_3_17\test_output';
outpath='E:\2023_3\exp_3_17\test_output_3d';
%����id�ļ���׼��
a = dir(inpath);
b = sort_nat({a.name});
b = b(3:length(b));
d = cell(length(b),2);
for i = 1:length(b)
    c = regexp(b{i},'\d*\.?\d*','match');
    d{i,1} = c{1};
    d{i,2} = erase(c{2},'.');
end
%��result�����ļ��в���һ���Ҵ洢Ϊ.mat�ļ�
for i = 1:length(b)
    img_result = imread(fullfile(inpath,b{i}));
    img_result = rgb2gray(img_result);
    %��һ��
    img_result_max=max(max(img_result));
    img_result_min=min(min(img_result));
    img_result=(img_result-img_result_min)./(img_result_max-img_result_min);
    save(fullfile(outpath,d{i,1},[d{i,1},'_',d{i,2},'.result.mat']),'img_result');
end





