%% Summary
%The purpose of this script is to extract the images with the "ith"
%attribute from the sample of images i am using. In this case 308 total
%images.
%% How to run
% Cell config:
%   Each Column will correspond to an attribute.
function AttributeList = getAttributes()
    run('C:\Users\Alejandro\Desktop\Yelp-Code\AddPaths.m');
% load files
% %     if numKeyPoints == 5
        load('C:\Users\Alejandro\Desktop\Yelp-Code\Output\Yelp_5_keypoints.mat');
% %     elseif numKeyPoints == 10
% %         load('C:\Users\Alejandro\Desktop\Yelp-Code\Output\Yelp_10_keypoints.mat');
% %     elseif numKeyPoints == 15
% %         load('C:\Users\Alejandro\Desktop\Yelp-Code\Output\Yelp_15_keypoints.mat');
% %     elseif numKeyPoints == 20
% %         load('C:\Users\Alejandro\Desktop\Yelp-Code\Output\Yelp_20_keypoints.mat');
% %     end
    % Iterate through each attribute (0-8) and append the filename to the
    % a list.
    % ATTRIBUTE_1_IMAGES:
    % ATTRIBUTE_2_IMAGES: blah blah.
    AttributeList={};
    for yelp_attribute = 0:9
        row=1;
        for k=1:yelp_info.totImages
            if ismember(yelp_attribute,yelp_info.SurfMat{k,5})
                AttributeList{row,yelp_attribute+1} = yelp_info.SurfMat{k,1};
                row=row+1;
            end
        end
    end
end