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

a = 10;
b = 15;
d = 1;
L = [11.5 11.5 11.5 11.5 11.5 11.5];

G = geval(L, b ,d)

h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);


%Vill slumpa fram bra v�rden
X_T = -5 + 10*rand(1,3);
res = stf(a, h , X_P, Y_P, X_T);

tol = 0.2; 
while (abs(res(1)) > tol || abs(res(2)) > tol || abs(res(3)) > tol || isreal(res(1)) == 0 || isreal(res(2)) == 0 || isreal(res(3)) == 0)
    a = -5;
    b = 5;
    X_T = a + (b-a)*rand(1,3);
    res = stf(a, h , X_P, Y_P, X_T);
end 

X_T
res

%% Task 3
clc

a = 10;
b = 15;
d = 1;
L = [11.5 11.5 11.5 11.5 11.5 11.5];

G = geval(L, b ,d)

h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);

[X_T, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), [1.4402 -2.9032 1.4425])
[X_T, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), [sqrt(3)/6*a -sqrt(3)/3*a sqrt(3)/6*a])
