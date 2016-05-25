function [ yelp_data_struct ] = InitVar(featPerImage, numWords  )
% outputs a struct with the path and other stuff about the yelp data.
%
%
train_path = 'C:\Users\Alejandro\Dropbox (CSU Fullerton)\Alejandro - Yelp\train_photos\train1\';
% % train_path = '/Users/lausmith/Dropbox (CSU Fullerton)/Alejandro - Yelp/train_photos/train1/';
fileContents = dir(train_path);
fileContents = fileContents(3:end);
numFiles = length(fileContents);
outputFilePath = './Output';

yelp_data_struct = struct('train_path',train_path,...
                          'fileContents',fileContents,...
                          'numFiles',numFiles,...
                          'numWords',numWords,...
                          'featPerImage',featPerImage,...
                          'SurfMat',[],...
                          'outputFilePath',outputFilePath);

end

