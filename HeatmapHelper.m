clear
clc
I1 = imread('heatmap.png');
I2 = rgb2gray(I1);
I2 = double(I2) / 255;
[h,w] = size(I2);
rowsum = zeros(h,1);
colsum = zeros(w,1);
sum = 0;
for i = 1:1:h
    for j = 1:1:w
        rowsum(i) = rowsum(i) + I2(i,j);
        sum = sum + I2(i,j);
    end
end

for i = 1:1:w
    for j = 1:1:h
        colsum(i) = colsum(i) + I2(j,i);
    end
end

for i = 1:1:h
    rowsum(i) = rowsum(i) / sum;
end

for i = 1:1:w
    colsum(i) = colsum(i) / sum;
end

% read and write files
% for each latitude, the access probability
% x-axis should be in range [-90,90)
fid = fopen('lat.txt','wt');
fprintf(fid,'%g\n',rowsum);
fclose(fid);

% for each longtitude, the access probability
% x-axis should be in range [-180,180)
fid = fopen('lng.txt','wt');
fprintf(fid,'%g\n',colsum);
fclose(fid);



