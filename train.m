clc;
clear all;

a = load('input');
b = a.input;
INPUT = b;
INPUT = INPUT';

c = load('target');
d = c.target;
OUTPUT = d;
OUTPUT = OUTPUT';

% Batasan error sebagai target trainning
    error_max=1e-8;         
 
% Membentuk jaringan NN
    net=newff(minmax(INPUT), [32 64 4], {'tansig','tansig','tansig'},'trainlm')
% trainlm,traingd,traingda,traingdm, traingdx 

% Define parameters
    net.trainParam.epochs =1000;
    net.trainParam.goal = error_max;
    net.trainParam.max_fail = 5000;
    
% Train network
    netWr = train(net, INPUT, OUTPUT);

% Simulate result
    Wr= sim(netWr,INPUT);
    prediksi = Wr';
    hasil = [OUTPUT' prediksi]
    
% Simpan data 
    save model