clc;
clear all;
inpath = '';
a = dir(inpath);
b = {a.name};
b = b(3:length(b));
age = cell(1,100);
id = cell(1,100);
for i =1:100
    c = dir(fullfile(inpath,b{i}));
    d = {c.name};
    e = dir(fullfile(inpath,b{i},d{3}));
    f = {e.name};
    path = fullfile(inpath,b{i},d{3},f{3});
    info = dicominfo(path);
    age{i} = info.PatientAge;
    id{i} = info.StudyID
end