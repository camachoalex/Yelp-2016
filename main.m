%% Log of what's been done.
run('AddPaths.m');
% ATTRIBUTES:
% 0: good_for_lunch
% 1: good_for_dinner
% 2: takes_reservations
% 3: outdoor_seating
% 4: restaurant_is_expensive
% 5: has_alcohol
% 6: has_table_service
% 7: ambience_is_classy
% 8: good_for_kids
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A long time ago.
% Before running any code we need to filter the data.
% All images are converted to grayscale.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SURFMat CELL DESCRIPTION:
%1. FileName,
%2. Five feature vectors for the image
%3. Business ID
%4. Photo ID
%5. Yelp- Assigned Attributes
%6. Cluster Round 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 06-12-2016
% I grouped images in yelp_attributes. Each column corresponds to a
% yelp-assigned attribute (0-8). Output is saved as yelp_attributes
% Next step, create a "mean image" for each column.
%% 06-25-2016
%Group all the images with the same attributes. Meaning group the the
%images with attributes [0, 1 ,2 ,3].
%Next, calculate the how many images per restaurant.
%
%
%% IGNORE BELOW.
%% Import photo_id && business Id
% run CheckTrain.m 
%% Import business_id && labels
% run readTRAINCSV.m
%% Beginning of the script
run('AddPaths.m')
