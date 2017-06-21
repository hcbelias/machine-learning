function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


sol = sigmoid(X * theta);
firstTerm = -y' * log(sol);
secondTerm = -((1 - y)' * log(1-sol));
costFunc = firstTerm + secondTerm;


shift = theta(2:size(theta));
regTheta = [0;shift];

J = (1/m) * costFunc  + (lambda/(2*m))* regTheta' * regTheta;
grad = (1/m)* X' * (sol - y) + lambda/m * regTheta;




% =============================================================

end
