%% (train_photo_to_biz_ids.csv)
% The purpose of this file is to create a new list of the images that we
% will feed into our algorithm. On first approach we will only use one
% image from each businessID. This means that we will use 2000 images for
% our training set.
run readTrain_photo_to_biz_ids.m

uPID = unique(photo_id); % all photos are unique
uBID = unique(business_id); % We know that there are 2000 unique business (:.



