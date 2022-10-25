function BW = FillLayer(X)
%BW image thresholiding, followed by binary image closing, fill holes and eroding
%functions.
if islogical(X)== 1
     BW = X;
 else
     % Threshold image - global threshold
     BW = imbinarize(X);
 end

% Close mask with disk
radius = 2;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imclose(BW, se);

% Fill holes
BW = imfill(BW, 'holes');

% Erode mask with disk
radius = 2;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imerode(BW, se);
BW = imfill(BW, 'holes');
end


