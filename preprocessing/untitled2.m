clc
clear
path1 = 'E:\data\exp_3_14\test_3';
path2 = 'E:\data\exp_3_14\result_3d';

a1 = dir(path1);
a2 = dir(path2);
b1 = sort_nat({a1.name});
b2 = sort_nat({a2.name});
b1 = b1(3:length(b1));
b2 = b2(3:length(b2));

for i = 1:length(b1)
    c1 = dir(fullfile(path1,b1{i}));
    c2 = dir(fullfile(path2,b2{i}));
    d1 = sort_nat({c1.name});
    d2 = sort_nat({c2.name});
    d1 = d1(3:length(d1));
    d2 = d2(3:length(d2));
    e1 = split(d1,'.');
    e2 = split(d2,'.');
    for j = 1:length(e2)
        
    end
end
