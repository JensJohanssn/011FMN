function plotStewart(X_T, X_P, Y_P, h, b, d)

% Plot base
X_B = [sqrt(3)/6*(2*b + d) -sqrt(3)/6*(b - d) -sqrt(3)/6*(b + 2*d) ...
    -sqrt(3)/6*(b + 2*d) -sqrt(3)/6*(b - d) sqrt(3)/6*(2*b + d)];
Y_B = [d/2 (b + d)/2 b/2 ...
    -b/2 -(b + d)/2 -d/2];
Z_B = [0 0 0 0 0 0];

fill3(X_B, Y_B, Z_B, [146/255, 146/255, 146/255])
axis([-10 10 -10 10 0 15])
xlabel('x (m)')
ylabel('y (m)')
zlabel('z (m)')
grid on
hold on

% Plot upper frame
Y_T(1) = sqrt(3)*X_T(1) - (sqrt(3)*X_P(1) - Y_P(1));
Y_T(2) = Y_P(2);
Y_T(3) = -sqrt(3)*X_T(3) + (sqrt(3)*X_P(3) + Y_P(3));

Z_T(1) = sqrt(h(1)^2 - 4*(X_T(1) - X_P(1))^2);
Z_T(2) = sqrt(h(2)^2 - (X_T(2) - X_P(2))^2);
Z_T(3) = sqrt(h(3)^2 - 4*(X_T(3) - X_P(3))^2);

fill3(X_T, Y_T, Z_T, [98/255, 161/255, 225/255])

% Plot legs
t = 1;
for i = 1:6
    if (i == 3 || i == 5)
        t = t + 1;
    end
    
    X_L = [X_B(i) X_T(t)];
    Y_L = [Y_B(i) Y_T(t)];
    Z_L = [Z_B(i) Z_T(t)];
    plot3(X_L, Y_L, Z_L, 'black', 'Linewidth', 1.5)
end
end


