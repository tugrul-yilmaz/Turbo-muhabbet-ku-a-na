%this file allows the classification of two randomly generated species
% 11.10.2018
% Musa Tugrul Yılmaz

clc
clear
close all

K=100;  %samples
q=0.6;  %value of offset

A=[rand(1,K)-q;rand(1,K)+q];
B=[rand(1,K)+q;rand(1,K)+q];
C=[rand(1,K)+q;rand(1,K)-q];
D=[rand(1,K)-q;rand(1,K)-q];
figure,plot(A(1,:),A(2,:),'rx')
hold on
plot(B(1,:),B(2,:),'go')
plot(C(1,:),C(2,:),'rx')
plot(D(1,:),D(2,:),'go')

P=[A B C D];

T=[ones(1,100) -ones(1,100) ones(1,100) -ones(1,100)];

net=feedforwardnet([5 3]);
net.divideParam.trainRatio=0.8;
net.divideParam.valRatio=0.1;
net.divideParam.testRatio=0.1;

nettrainParam.Goal=10^-6;

[net,tr,Y,E]=train(net,P,T);

span=-1:0.025:2;
[P1,P2]=meshgrid(span,span);
PP=[P1(:) P2(:)]';
aa=net(PP);
surf(P1,P2,reshape(aa,length(span),length(span))-5)
colormap bone
