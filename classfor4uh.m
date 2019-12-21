%this file allows four different classifications of randomly generated data
% 8.11.2018
% Musa Tugrul Yılmaz

clc
clear all
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
plot(C(1,:),C(2,:),'*')
plot(D(1,:),D(2,:),'-')

P=[A B C D];

T=[ones(1,100) ones(1,100)*.2 ones(1,100).*3 ones(1,100).*4];

net=feedforwardnet([10 10]);
net.divideParam.trainRatio=0.8;
net.divideParam.valRatio=0.1;
net.divideParam.testRatio=0.1;

nettrainParam.Goal=10^-6;

[net,tr,Y,E]=train(net,P,T);

%span=-1:0.025:2;
%[P1,P2]=meshgrid(span,span);
%[P3 P4]=meshgrid(span,span);
%PP=[P1(:) P2(:) P3(:) P4(:)]';
%aa=net(PP);

span=-1:0.025:2;
[P1,P2]=meshgrid(span,span);

PP=[P1(:) P2(:)]';
aa=net(PP);
surf(P1,P2,reshape(aa,length(span),length(span))-5)
colormap hot
