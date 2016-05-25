%% Create bar plot of Unique BusinessID Attributes (train.csv)
% We have 2000 unique business IDS.
%
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
run readTRAINCSV.m

bins = zeros(1,9); % Categories 0:8
for i=1:length(labels)
    I = str2num(labels{i});
    for k = 1:numel(I)
        bins(I(k)+1)= bins(I(k)+1)+1;
    end
end
bar(bins); title('Unique BusinessID Attributes')
shg