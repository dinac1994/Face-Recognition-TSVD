# Main program

# Preprocessing data

imagefiles = dir('*.png');      
nfiles = length(imagefiles); 

for i = 1:nfiles
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename); # Loading images
   currentimage = rgb2gray(currentimage); # Translating from RGB to greyscale channel
   currentimage = imresize(currentimage, [56, 56]); # Resizing to 56x56
   temp{i} = currentimage; # Images
   # images(:,i) = temp{1}(:); # Vectorized images
endfor

# Commands for displaying certain image
#figure
#imshow(temp{10})

# Database is a tensor 56 x 3 x 56 

training_tensor = zeros(56, 9, 56);
training_tensor(:,1,:) = temp{1};
training_tensor(:,2,:) = temp{2};
training_tensor(:,3,:) = temp{3};
training_tensor(:,4,:) = temp{6};
training_tensor(:,5,:) = temp{7};
training_tensor(:,6,:) = temp{8};
training_tensor(:,7,:) = temp{11};
training_tensor(:,8,:) = temp{12};
training_tensor(:,9,:) = temp{13};

# T-SVD I method

# Loading testing image
test_photograph = temp{30};
result = tsvd_I(training_tensor, test_photograph);

if result == 1
  fprintf("Person is in the database!");
endif
if result == 0
  fprintf("Person is not in the database!");
endif












