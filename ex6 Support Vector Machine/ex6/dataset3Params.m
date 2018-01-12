function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
range=[0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
C = 0.01;
sigma = 3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
m=0;
n=0;
error=100;
min=error;
prediction=zeros(8,8);
error=zeros(8,8);
for i=1:8
for j=1:8
C=range(i);
sigma=range(j);
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions= svmPredict(model, Xval);
error=mean(double(predictions ~= yval));
if(error < min)
min=error;
m=i;
n=j;
end
end
end
C=range(m);
sigma=range(n);


% =========================================================================

end
