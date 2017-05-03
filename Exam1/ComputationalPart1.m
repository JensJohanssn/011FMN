%% Task 1
clc
clear all

% Given input values for geval
b = 15;
d = 1;

% Testing for different prismatic leg lengths
L = [3 3 3 3 3 3];
result = geval(L, b, d);
h = result(1,:)

L = [8 8 8 8 8 8];
result = geval(L, b, d);
h = result(1,:)

%% Task 2

% Given input values for geval and stf
a = 10;
b = 15;
d = 1;
L = [11.5 11.5 11.5 11.5 11.5 11.5];

% We calculate required inputs h, X P, X P, using geval, for stf
G = geval(L, b ,d);
h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);

% We provide an a guess for X T

X_T = [1 2 3];

% stf function result
res = stf(a, h , X_P, Y_P, X_T)

%% Task 3

% Given input values for geval and stf
a = 10;
b = 15;
d = 1;
L = [11.5 11.5 11.5 11.5 11.5 11.5];

G = geval(L, b ,d);

% We calculate required inputs h, X P, X P, using geval, for stf
h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);

% We try and solve the equations with provided arbitrary points
[X_T, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), [100 22 311])
[X_T, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), [-2 3 3])
[X_T, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), [3 -5 3])

%% Task 4

% Given input values for geval and stf
a = 10;
b = 15;
d = 1;
L = [11.5 11.5 11.5 11.5 11.5 11.5];

% We calculate required inputs h, X P, X P, using geval, for stf
G = geval(L, b ,d);
h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);

% Chosen acceptable starting point, equation taken from Figure
% 1.2 in assignment
X_T = [sqrt(3)/6*a -sqrt(3)/3*a sqrt(3)/6*a]

% Solution using fsolve
[X_T, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), [sqrt(3)/6*a -sqrt(3)/3*a sqrt(3)/6*a])

%% Task 5
clc
clf

a = 10;
b = 15;
d = 1;

%  a) The Stewart platform is in its lowest position
L = [8 8 8 8 8 8];
G = geval(L, b ,d);

h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);

[X_Tmin, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), ...
    [sqrt(3)/6*a -sqrt(3)/3*a sqrt(3)/6*a])

subplot(2,2,1)
plotStewart(X_Tmin, X_P, Y_P, h, b, d)
title('Lowest position')

% b) The Stewart platform is in its highest position
L = [15 15 15 15 15 15];
G = geval(L, b ,d);

h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);

[X_Tmax, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), ...
    [sqrt(3)/6*a -sqrt(3)/3*a sqrt(3)/6*a])

subplot(2,2,2)
plotStewart(X_Tmax, X_P, Y_P, h, b, d)
title('Highest position')

% c) The platform is in its most tilted position
L = [15 15 8 8 8 8];
G = geval(L, b ,d);

h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);

[X_Ttilt, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), ...
    [sqrt(3)/6*a -sqrt(3)/3*a sqrt(3)/6*a])

subplot(2,2,3)
plotStewart(X_Ttilt, X_P, Y_P, h, b, d)
title('Tilted')

% d) The platform is in its most twisted position
L = [8 15 8 15 8 15];
G = geval(L, b ,d);

h = G(1,:);
X_P = G(2,:);
Y_P = G(3,:);

[X_Ttwist, fval] = fsolve(@(X_T) stf(a, h, X_P, Y_P, X_T), ...
    [sqrt(3)/6*a -sqrt(3)/3*a sqrt(3)/6*a])

subplot(2,2,4)
plotStewart(X_Ttwist, X_P, Y_P, h, b, d)
title('Twisted')

