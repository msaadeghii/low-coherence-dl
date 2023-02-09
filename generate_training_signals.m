function Y=generate_training_signals(L)

x=im2double(imread('barbara.png'));
d1 = im2col(x,[8 8],'sliding');

x=im2double(imread('boat.png'));
d2 = im2col(x,[8 8],'sliding');

x=im2double(imread('lena.png'));
d3 = im2col(x,[8 8],'sliding');

x=im2double(imread('cameraman.tif'));
d4 = im2col(x,[8 8],'sliding');

Data=[d1 d2 d3 d4];
Data=bsxfun(@minus,Data,mean(Data,2));
Data=normc(Data);

N=size(Data,2);
ind=randperm(N);

Y=Data(:,ind(1:L));