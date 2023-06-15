nSamples = 400;  % Jumlah total sampel dalam dataset
numClasses = 4;   % Jumlah kelas yang berbeda

target = zeros(nSamples, numClasses);

% Mengisi nilai target berdasarkan indeks kelas yang telah Anda berikan
target(1:100, 1) = 1;   % agaricus
target(101:200, 2) = 1; % boletus
target(201:300, 3) = 1; % entoloma
target(301:400, 4) = 1; % russula

save('target.mat', 'target');