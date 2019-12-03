clc
clear all
close all
load('net.mat'); %import net.mat(previously created)
load('ysa.mat'); %import ysa.mat
a=ysa; %ysa matrix assigned to variable a
imshow(a) 

span1 =1:200; 
span2 =1:75; 
[x1,y1]=meshgrid(span1,span2); 
p1 = [x1(:) y1(:)]'; 
for num=1:length(p1) 
    t1(1,num) = a(p1(1,num),p1(2,num),1)/255; 
     t1(2,num) = a(p1(1,num),p1(2,num),2)/255;
      t1(3,num) = a(p1(1,num),p1(2,num),3)/255;
end

span3 =1:75;  
span4 =76:125;
[x2,y2]=meshgrid(span3,span4);
p2 = [x2(:) y2(:)]';
for num=1:length(p2)
    t2(1,num) = a(p2(1,num),p2(2,num),1)/255;
     t2(2,num) = a(p2(1,num),p2(2,num),2)/255;
      t2(3,num) = a(p2(1,num),p2(2,num),3)/255;
end

span5 =126:200; 
span6 =76:125;
[x3,y3]=meshgrid(span5,span6);
p3 = [x3(:) y3(:)]';
for num=1:length(p3)
    t3(1,num) = a(p3(1,num),p3(2,num),1)/255;
     t3(2,num) = a(p3(1,num),p3(2,num),2)/255;
      t3(3,num) = a(p3(1,num),p3(2,num),3)/255;   
end

span7 =1:200; 
span8 =126:200;
[x4,y4]=meshgrid(span7,span8);
p4 = [x4(:) y4(:)]';

for num=1:length(p4)
    t4(1,num) = a(p4(1,num),p4(2,num),1)/255;
     t4(2,num) = a(p4(1,num),p4(2,num),2)/255;
      t4(3,num) = a(p4(1,num),p4(2,num),3)/255;
end
%upper left and lower parts of the image scanned, pixel values taken
%valuables divided by 255 because we don't want high pixel valuable
      
p8=[p1 p2 p3 p4]; %parts merged
t=[t1 t2 t3 t4];
t = double(t); %valuables tubled to integer

span9=76:125; 
span10=76:125;
[x5,y5]=meshgrid(span9,span10);
test=[x5(:) y5(:)]'; %the black part created



% net = feedforwardnet([40 30 20 10]); 
% net.divideFcn=''; 
% net.trainParam.Goal = 10^-6; 
% net.trainParam.epochs = 1000; 
% net=train(net,p8,t);  

%artifical neural networks created
%you must several times try for the best result

p=[p8,test]; %new p variable created and the missing part included all coordinate valuables
y=net(p); %new p matrix enter training
a_ysa = zeros(size(a,1),size(a,2),3); 
for num = 1:length(y)
    a_ysa(p(1,num),p(2,num),1)=double(y(1,num))*255; %
    a_ysa(p(1,num),p(2,num),2)=double(y(2,num))*255;
    a_ysa(p(1,num),p(2,num),3)=double(y(3,num))*255;
end
%40000 samples point product by rgb valuables for recover image
a_ysa = uint8(a_ysa); %double compare to uint8
figure,imshowpair(a,a_ysa,'montage')


