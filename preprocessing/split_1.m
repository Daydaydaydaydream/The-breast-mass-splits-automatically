clc;
clear all;
a = dir('E:\data\all_group');
b = {a.name};
b = b(3:length(b));
N = 81;
%Ëæ»ú»®·Ö
s =randperm(N);
for i =1:N
    ss = s(i);
    movefile(fullfile('E:\data\all_group',b{ss}),'E:\data\train\')
end
