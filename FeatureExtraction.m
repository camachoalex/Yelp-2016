%% Reshape images into nx1 vector and concatenate into  nxn mat.
%=============================
function [SURFMat]=FeatureExtraction(numStrPts, train_path, fileContents, numFiles)

n = 20000; %% Number of images being read in!!!!
idx =0;
% Imat = zeros(500*375,n);
Imat=[];
im_idx = zeros(100,1);  %% Not important because im_idx exceeds 100 images.


for i=1:n
    I=double(rgb2gray(imread(strcat(train_path,fileContents(i).name))));
    if (length(I(:,1)) == 500  && length(I(1,:)) == 375)
        idx=idx+1;
        im_idx(idx) = i;
        Imat(:,i) = reshape(I, length(I(:,1))* length(I(1,:)), 1);
        if idx == 1000 
            break
        end
    end
end
%% Get SURF Point Features (need to use uint8, why? )
loc=0;
SURFMat = {};
run CheckTrain.m 
for i=1:length(im_idx)
   I = uint8(reshape(Imat(:,i),500,375));
   tmp_photo_id = strsplit(fileContents(im_idx(i)).name, '.jpg');
   points = detectSURFFeatures(I); % get SURF pts
   %Select strongest SURF points
   Spt = points.selectStrongest(numStrPts); 
   if Spt.Count < numStrPts
       continue;
   else
       % get features from SURF pts. validPoints crrsponds to the SURF pts.
       [features,validPoints]=extractFeatures(I,Spt);
       loc=loc+1; 
       SURFMat{loc,1} = strcat(train_path,fileContents(im_idx(i)).name);
       SURFMat{loc,2} =  features';
       SURFMat{loc,3} = business_id(photo_id == str2double(tmp_photo_id(1)));
       SURFMat{loc,4} = photo_id(photo_id == str2double(tmp_photo_id(1)));
%        SURFMat{loc,8} = validPoints;
   end
   clear features validPoints
end
run readTRAINCSV.m
loc=0;
for i=1:length(SURFMat)
   loc = loc+1;
   SURFMat{loc,5} = (cell2mat(labels(business_id == SURFMat{loc,3})) );
    
end
% save(outputFileName, 'SURFMat');
end % End Functin
