inputImage = imread('clock_tower_image.jpg');
binningfactor = 2;
[rows, cols, colours] = size(inputImage);
newrows = floor(rows / binningfactor);
newcols = floor(cols / binningfactor);
outputImage = zeros(newrows, newcols, colours);
for i = 1:newrows
    for j = 1:newcols
        rowstart = (i - 1) * binningfactor + 1;
        rowend = min(rowstart + binningfactor - 1, rows);
        colstart = (j - 1) * binningfactor + 1;
        colend = min(colstart + binningfactor - 1, cols);
        block = inputImage(rowstart:rowend, colstart:colend, :);
        outputImage(i, j, :) = mean(block, [1, 2]);
    end
end
imshow(uint8(outputImage));
