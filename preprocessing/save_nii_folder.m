clc
clear all;
inpath = 'E:\data\all_286';
a=dir(inpath);
b={a.name};
c={a.folder};
filename = [];
for i =3:length(b)
    id = split(b{i},'_');
    name = cell2mat(id(1));
    name2 = str2double(name);
    filename(i) = name2;
    if filename(i) ~= filename (i-1)
        mkdir(fullfile('E:\data\all',name));
        movefile(fullfile(c{i-1},b{i}),fullfile('E:\data\all',name));
    else
        movefile(fullfile(c{i-1},b{i}),fullfile('E:\data\all',name));
    end
end