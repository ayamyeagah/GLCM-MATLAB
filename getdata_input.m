clc;
% total dataset = 400
% index Agaricus 0 
% index Boletus 100
% index Entoloma 200
% index Russula 300

%jika yang di cari nilai GLCM agaricus ganti posisi = 0;
%jika yang dicari nilai GLCM boletus ganti posisi = 100;
% dst


posisi = 300; 
path = 'F:\6\Praktikum Machine Vision\matlab\glmc_4class\dataset\preprocessing\russula'; %change to path result from convert
if ~isdir(path)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', path);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(path, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = sprintf('%d.jpg',k);%jpegFiles(k).name;
  fullFileName = fullfile(path, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  d = graycoprops(imageArray); %fungsi GLCM
  d1 = d.Contrast; %mendapatkan nilai Contrast
  d2 = d.Correlation; %mendapatkan nilai Correlation
  d3 = d.Energy; %mendapatkan nilai Energy
  d4 = d.Homogeneity; %mendapatkan nilai Homogeneity
  input(posisi+k,:) = [d1 d2 d3 d4]; %menyimpan nilai GLCM dalam matrix input
  fprintf(1, '%d %d %d %d\n',d1,d2,d3,d4)
  imshow(imageArray);  
  drawnow; 
end
%jika sudah running ke empat aktifkan program save agar data variable 
%matrix input.mat dapat di extract
save('input.mat')   