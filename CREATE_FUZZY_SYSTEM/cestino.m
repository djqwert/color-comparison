%%%

output = evalfis(input(:,1:4),sFuzzy)';
diff = D20 - output';
%ans = [LCHm,LCHc,D76,D20,diff];
g = [];
index = 1;
for i = 1:1269
    if abs(diff(i)) >= 1
        g(index) = i;
        index = index + 1;        
    end
end
diffR = diff(g,:);

%input = LCHm(1:888,:);
%test = LCHm(889:end,:);

% Correggi quell'area con la logica Fuzzy
g = 1;
vettore = [];
vinput = zeros(4,339);
for i = 1:1269
   % violetto
   if LCH(i,3) >= 240 && LCH(i,3) <= 300 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       vettore(g) = i;
       vinput(:,g) = input(:,i);
       g = g + 1;
       target(i) = 0.5;
   % scuro
   elseif LCH(i,1) >= 0 && LCH(i,1) < 10 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       vettore(g) = i;
       vinput(:,g) = input(:,i);
       g = g + 1;
       target(i) = 0.5;
   % chiaro
   elseif LCH(i,1) > 90 && LCH(i,1) <= 100 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       vettore(g) = i;
       vinput(:,g) = input(:,i);
       g = g + 1;
       target(i) = 0.5;
   % saturo
   elseif LCH(i,2) >= 0 && LCH(i,2) < 10 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       vettore(g) = i;
       vinput(:,g) = input(:,i);
       g = g + 1;
       target(i) = 0.5;
    end
end
input = [vinput,input,vinput];
target = [target(:,vettore),target,target(:,vettore)];

%NewTarget = evalfis(LCH(vettore,:),fis)';
%r = size(vettore,2);
%Ntarget = target;
%for i = 1:r
%    index = vettore(i);
%    Ntarget(:,index) = NewTarget(i);
%end
%target = evalfis(LCH,fis)';

%%%



g = 1;
vettore = [];
for i = 1:1269
   % violetto
   if LCH(i,3) >= 240 && LCH(i,3) <= 300 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       input(i,5) = 0.5;
       vettore(g) = i;
       g = g + 1;
   % scuro
   elseif LCH(i,1) >= 0 && LCH(i,1) < 10 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       input(i,5) = 0.5;
       vettore(g) = i;
       g = g + 1;
   % chiaro
   elseif LCH(i,1) > 90 && LCH(i,1) <= 100 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       input(i,5) = 0.5;
       vettore(g) = i;
       g = g + 1;
   % saturo
   elseif LCH(i,2) >= 0 && LCH(i,2) < 10 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       input(i,5) = 0.5;
       vettore(g) = i;
       g = g + 1;
    end
end
targetNew = evalfis(LCH(vettore,:),fis)';
load('./data.mat');
r = size(vettore,2);
for i = 1:r
    index = vettore(i);
    target(:,index) = targetNew(i);
end

%fis = mam2sug(fis);

%target = evalfis(LCH,sugFIS)';

%save ../CREATE_NN/target.mat target;

%input = LCH(1:800,:);

%input = LCH(:,[1 2 3 4 4]);

%inputtr = input(1:800,:);
%inputch = input(801:end,:);

%inputTest = [Mmenoscuro;Mmenochiaro;Mnonsaturo;Mnviolasx;Mnvioladx];

%Minput = input(vettore,:);
Mestratto = input(vettore,:);

for i = 1:1000
    Mscuro(i,:) = [(10-rand()*10),100-rand()*90,180+(1-rand())*25,rand()*3.5,0]; % campioni scuri
    val = (1-rand())*5;
    Mmenoscuro(i,:) = [20-rand()*10,100-rand()*90,180+(1-rand())*25,val,val]; % campioni meno scuri
    Mchiaro(i,:) = [100-rand()*10,100-rand()*90,180+(1-rand())*25,rand()*3.5,0]; % campioni meno scuri
    val = (1-rand())*5;
    Mmenochiaro(i,:) = [90-rand()*10,100-rand()*90,180+(1-rand())*25,val,val]; % campioni meno scuri
    Msaturo(i,:) = [100-rand()*90,(10-rand()*10),180+(1-rand())*25,rand()*3.5,0]; % campioni meno scuri
    val = (1-rand())*5;
    Mnonsaturo(i,:) = [100-rand()*90,100-rand()*90,180+(1-rand())*25,val,val]; % campioni meno scuri
    Mbviola(i,:) = [100-rand()*90,100-rand()*90,300-rand()*60,rand()*3.5,0];
    val = (1-rand())*5;
    Mnviolasx(i,:) = [100-rand()*90,100-rand()*90,360-rand()*60,val,val];
    val = (1-rand())*5;
    Mnvioladx(i,:) = [100-rand()*90,100-rand()*90,240-rand()*60,val,val];
end

input = [Mscuro;Mchiaro;Msaturo;Mbviola;];

for i = 1:1000
    Mscuro(i,:) = [(10-rand()*10),100-rand()*90,180+(1-rand())*25,rand()*3.5,0.5]; % campioni scuri
    val = (1-rand())*5;
    Mmenoscuro(i,:) = [20-rand()*10,100-rand()*90,180+(1-rand())*25,val,val]; % campioni meno scuri
    Mchiaro(i,:) = [100-rand()*10,100-rand()*90,180+(1-rand())*25,rand()*3.5,0.5]; % campioni meno scuri
    val = (1-rand())*5;
    Mmenochiaro(i,:) = [90-rand()*10,100-rand()*90,180+(1-rand())*25,val,val]; % campioni meno scuri
    Msaturo(i,:) = [100-rand()*90,(10-rand()*10),180+(1-rand())*25,rand()*3.5,0.5]; % campioni meno scuri
    val = (1-rand())*5;
    Mnonsaturo(i,:) = [100-rand()*90,100-rand()*90,180+(1-rand())*25,val,val]; % campioni meno scuri
    Mbviola(i,:) = [100-rand()*90,100-rand()*90,300-rand()*60,rand()*3.5,0.5];
    val = (1-rand())*5;
    Mnviolasx(i,:) = [100-rand()*90,100-rand()*90,360-rand()*60,val,val];
    val = (1-rand())*5;
    Mnvioladx(i,:) = [100-rand()*90,100-rand()*90,240-rand()*60,val,val];
end

input = [Mmenoscuro;Mmenochiaro;Mnonsaturo;Mnviolasx;Mnvioladx];

for i = 1:3000
    val = rand()*5;
    if val <= 1 || val >= 3.5
        Mscuro(i,:) = [10-rand()*10,100-rand()*90,rand()*240,val,val]; % campioni scuri
    else
        Mscuro(i,:) = [10-rand()*10,100-rand()*90,rand()*240,val,val/10];
    end
    val = rand()*5;
    Mmenoscuro(i,:) = [10+rand()*80,100-rand()*90,rand()*240,val,val]; % campioni meno scuri
    val = rand()*3.5;
    if val <= 1 || val >= 3.5
        Mchiaro(i,:) = [100-rand()*10,100-rand()*90,rand()*240,val,val]; % campioni meno scuri
    else
        Mchiaro(i,:) = [100-rand()*10,100-rand()*90,rand()*240,val,val/10]; % campioni meno scuri
    end
    val = rand()*5;
    Mmenochiaro(i,:) = [90-rand()*80,100-rand()*90,rand()*240,val,val]; % campioni meno scuri
    val = rand()*5;
    if val <= 1 || val >= 3.5
        Msaturo(i,:) = [10+rand()*80,10-rand()*10,rand()*240,val,val]; % campioni meno scuri
    else
        Msaturo(i,:) = [10+rand()*80,10-rand()*10,rand()*240,val,val/10]; % campioni meno scuri
    end
    val = rand()*5;
    Mnonsaturo(i,:) = [10+rand()*80,10+rand()*90,rand()*240,val,val]; % campioni meno scuri
    val = rand()*5;
    if val <= 1 || val >= 3.5
        Mbviola(i,:) = [10+rand()*80,10+rand()*90,300-rand()*60,val,val];
    else
        Mbviola(i,:) = [10+rand()*80,100-rand()*90,300-rand()*60,val,val/10];
    end
    val = rand()*5;
    Mnviolasx(i,:) = [10+rand()*80,100-rand()*90,360-rand()*60,val,val];
    val = rand()*5;
    Mnvioladx(i,:) = [10+rand()*80,100-rand()*90,rand()*240,val,val];
end
input = [Mscuro;Mchiaro;Mmenoscuro;Mmenochiaro;Msaturo;Mnonsaturo;Mbviola;Mnviolasx;Mnvioladx];
%input = input(:,[1 2 4 5]);
input = input(randperm(3000*9),:);



for i = 1:100
    val = rand()*5;
    if val <= 1 || val >= 3.5
        Mscuro(i,:) = [10-rand()*10,100-rand()*90,rand()*240,val,val]; % campioni scuri
    else
        Mscuro(i,:) = [10-rand()*10,100-rand()*90,rand()*240,val,val/10];
    end
    val = rand()*5;
    Mmenoscuro(i,:) = [10+rand()*80,100-rand()*90,rand()*240,val,val]; % campioni meno scuri
    val = rand()*3.5;
    if val <= 1 || val >= 3.5
        Mchiaro(i,:) = [100-rand()*10,100-rand()*90,rand()*240,val,val]; % campioni meno scuri
    else
        Mchiaro(i,:) = [100-rand()*10,100-rand()*90,rand()*240,val,val/10]; % campioni meno scuri
    end
    val = rand()*5;
    Mmenochiaro(i,:) = [90-rand()*80,100-rand()*90,rand()*240,val,val]; % campioni meno scuri
    val = rand()*5;
    if val <= 1 || val >= 3.5
        Msaturo(i,:) = [10+rand()*80,10-rand()*10,rand()*240,val,val]; % campioni meno scuri
    else
        Msaturo(i,:) = [10+rand()*80,10-rand()*10,rand()*240,val,val/10]; % campioni meno scuri
    end
    val = rand()*5;
    Mnonsaturo(i,:) = [10+rand()*80,10+rand()*90,rand()*240,val,val]; % campioni meno scuri
    val = rand()*5;
    if val <= 1 || val >= 3.5
        Mbviola(i,:) = [10+rand()*80,10+rand()*90,300-rand()*60,val,val];
    else
        Mbviola(i,:) = [10+rand()*80,100-rand()*90,300-rand()*60,val,val/10];
    end
    val = rand()*5;
    Mnviolasx(i,:) = [10+rand()*80,100-rand()*90,360-rand()*60,val,val];
    val = rand()*5;
    Mnvioladx(i,:) = [10+rand()*80,100-rand()*90,rand()*240,val,val];
end
test = [Mscuro;Mchiaro;Mmenoscuro;Mmenochiaro;Msaturo;Mnonsaturo;Mbviola;Mnviolasx;Mnvioladx];
%input = input(:,[1 2 4 5]);
test = test(randperm(100*9),:);

















for i = 1:1269
   if LCH(i,3) >= 240 && LCH(i,3) <= 300 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       target(i) = 0.5;
   elseif LCH(i,1) >= 0 && LCH(i,1) <= 10 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       target(i) = 0.5;
   elseif LCH(i,1) >= 90 && LCH(i,1) <= 100 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       target(i) = 0.5;
   elseif LCH(i,2) >= 0 && LCH(i,2) <= 10 && LCH(i,4) >= 1 && LCH(i,4) <= 3.5
       target(i) = 0.5;
    end
end

inputtr = input(1:800,:);
inputch = input(801:end,:);

input = zeros(5000,5);
mc = [30.3209457259283 6.78075885640278 250.527213648743 2.52265300084465];
for i = 1:5000
   val = (2*rand()+mc(:,4));
   input(i,:) = [(rand()+mc(:,1)),(rand()+mc(:,2)),(30*(rand()-1)+mc(:,3)),val, val];
   if val > 1 && val < 3.5
    input(i,5) = 0.5;
   end
end

inputt = input(1:4000,[3 4 5]);
inputr = input(4001:5000,[3 4 5]);