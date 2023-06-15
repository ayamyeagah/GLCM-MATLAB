clc

load model %load file .mat

tes = INPUT(:,:);
y=OUTPUT';
yp=(sim(netWr,tes))';
hasil = [y yp]