clc
clear all
load('net.mat');
load('ysa.mat');  %mat dosyası matlab ortamına yüklüyoruz.
a=ysa; %a isimli değişkene ysa isimli değişken atıyoruz.
imshow(a) %resmi görüp oluşturalacak parçaların sınır değerlerini elde etmek için kullanıyoruz.
span1 =1:200; %resmin üst kısmında ki dikdörtgen parçayı almak için kullanıldı.(satır)
span2 =1:75; %resmin üst kısmında ki dikdörtgen parçayı almak için kullanıldı (sütun)
[x1,y1]=meshgrid(span1,span2); % belirtilen bölgenin taranmasını sağlar.
p1 = [x1(:) y1(:)]'; % satır tabanlı bir algoritma elde etmek için transpoz alındı.
for num=1:length(p1) %1'den başlayarak p1'in boyutu kadar yapılan işlemi döndürür.
    t1(1,num) = a(p1(1,num),p1(2,num),1)/255; %1 red 2 green 3 blue temsil etmektedir.
     t1(2,num) = a(p1(1,num),p1(2,num),2)/255;
      t1(3,num) = a(p1(1,num),p1(2,num),3)/255;
      %belirlenen koordinat değerlerinde piksel değerleri elde edildi.
      %255'e bölünmesinin değeri büyük değerlerle uğraşmamak.
      
end

span3 =1:75;  %sol kısımo
span4 =76:125;
[x2,y2]=meshgrid(span3,span4);
p2 = [x2(:) y2(:)]';
for num=1:length(p2)
    t2(1,num) = a(p2(1,num),p2(2,num),1)/255;
     t2(2,num) = a(p2(1,num),p2(2,num),2)/255;
      t2(3,num) = a(p2(1,num),p2(2,num),3)/255;
end

span5 =126:200; %sağ kısım
span6 =76:125;
[x3,y3]=meshgrid(span5,span6);
p3 = [x3(:) y3(:)]';
for num=1:length(p3)
    t3(1,num) = a(p3(1,num),p3(2,num),1)/255;
     t3(2,num) = a(p3(1,num),p3(2,num),2)/255;
      t3(3,num) = a(p3(1,num),p3(2,num),3)/255;   
end

span7 =1:200; %alt kısım
span8 =126:200;
[x4,y4]=meshgrid(span7,span8);
p4 = [x4(:) y4(:)]';

for num=1:length(p4)
    t4(1,num) = a(p4(1,num),p4(2,num),1)/255;
     t4(2,num) = a(p4(1,num),p4(2,num),2)/255;
      t4(3,num) = a(p4(1,num),p4(2,num),3)/255;
end
      
p8=[p1 p2 p3 p4]; %elde edilen parçalar birleştirildi.
t=[t1 t2 t3 t4];
t = double(t); %değerler tam sayılara yuvarlandı.

span9=76:125; %eksik kısmın tanımlanması
span10=76:125;
[x5,y5]=meshgrid(span9,span10);
test=[x5(:) y5(:)]'; %değerleri alınmadı çünkü eksik kısmın '0' değerinde olduğu açıktır.




% net = feedforwardnet([40 30 20 10]); %4 gizli katman alındı
% net.divideFcn=''; %verileri rastgele alarak öğreniyor.
% net.trainParam.Goal = 10^-6; %hedeflenen hata oranı 
% net.trainParam.epochs = 1000; %yapılan işlem 1000 kez tekrarlansın.
% net=train(net,p8,t); %p8'i t'ye göre eğit 

p=[p8,test]; %yeni bir p fonksiyonu tanımlanarak tüm koordinat değerlerine eksik bölge dahil edildi.
y=net(p); %oluşturulan matrisi yapay sinir ağına soktuk.
a_ysa = zeros(size(a,1),size(a,2),3); %0'lar matrisi oluşturuldu.
for num = 1:length(y)
    a_ysa(p(1,num),p(2,num),1)=double(y(1,num))*255; %resimi geri elde etmek için 40.000 veri RGB değerleri 255 ile çarpıldı.
    a_ysa(p(1,num),p(2,num),2)=double(y(2,num))*255;
    a_ysa(p(1,num),p(2,num),3)=double(y(3,num))*255;
end
a_ysa = uint8(a_ysa); %double olan resim uint8 formatına çevrildi.
figure,imshowpair(a,a_ysa,'montage')% iki resmin aynı anda kıyaslanması için kullanıldı.


