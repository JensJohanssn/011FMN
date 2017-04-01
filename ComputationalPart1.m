%% Task 1
clc
clear all

b = 15;
d = 1;
L = [3 3 3 3 3 3];

geval(L, b, d)

L = [8 8 8 8 8 8];

geval(L, b, d)

% h(i) = sqrt(L(2*i-1)^2 - P(i)^2) 
% => L(2*i-1)^2 - P(i)^2 >= 0 
% => L(2*i-1)^2 >= P(i)^2 
% => L(2*i-1)^2 >= ((1/(2*b))*(b^2 + L(2*i-1)^2 - L(2*i)^2))^2
% => L(2*i-1) >= (1/(2*b))*(b^2 + L(2*i-1)^2 - L(2*i)^2)
% ... (L(2*i-1) = L(2*i)) = L
% ... (wolfram)
% => L >= 15/2

L = [7.5 7.5 7.5 7.5 7.5 7.5];

geval(L, b, d)

%% Task 2
clc
clear all

a = 10;
b = 15;
d = 1;
L = [11.5 11.5 11.5 11.5 11.5 11.5];

G = geval(L, b ,d)

h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);

X_T = [2.5 3.2 -1.9] %Hittar inte bra värden
stf(a, h , X_P, Y_P, X_T)












