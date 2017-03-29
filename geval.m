function F = geval(L, b, d)
P = [0 0 0];
h = [0 0 0];

for i = [1 2 3]
    P(i) = (1/(2*b))*(b^2 + L(2*i-1)^2 - L(2*i)^2);
end

for i = [1 2 3]
    h(i) = sqrt(L(2*i-1)^2 - P(i)^2);
end

X_P1 = sqrt(3)/6*(2*b + d -3*P(1));
X_P2 = -sqrt(3)/6*(b+2*d);
X_P3 = -sqrt(3)/6*(b -d -3*P(3));

X_P = [X_P1 X_P2 X_P3];

Y_P1 = 1/2*(d + P(1));
Y_P2 = 1/2*(b + 2*P(2));
Y_P3 = -1/2*(b + d + P(3));

Y_P = [Y_P1 Y_P2 Y_P3];

F = [h ; X_P ; Y_P];
end