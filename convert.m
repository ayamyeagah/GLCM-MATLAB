path = 'F:\6\Praktikum Machine Vision\matlab\glmc_4class\dataset\raw\russula'; % raw image (rgb)
result = 'F:\6\Praktikum Machine Vision\matlab\glmc_4class\dataset\preprocessing\russula'; % result image (grayscale)
if ~isdir(path)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', path);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(path, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(path, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  imageArray = rgb2gray(imageArray);
  imageArray = imsharpen(imageArray,'Radius',10,'Amount',2);
  imageArray = imresize(imageArray,[224 224]);
  baseFileName = sprintf('%d.jpg',k); % create file name
  fullFileName = fullfile(result, baseFileName);
  imwrite(imageArray, fullFileName); % create citra file on ready dir

  imshow(imageArray);  % Display image.
  drawnow; % Force display to update immediately.
end