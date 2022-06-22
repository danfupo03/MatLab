%Author: Daniel Fuentes Portaluppi
%Description: This code calculates the angle of two charges
% hanging from threads

clc; clear all;

%These constant variables are assigned.
g = 9.81;
eps0 = 8.854e-12;

%Here the parameters that are going to change are assigned and 
% they are the ones that the user is going to assign.
m = input("Enter the mass of the charges: " );
l = input("Enter the length of the rope: ");
Q = input("Enter the charge: ");

%Formula when angle is assumed to be small (-10 degrees)
alfa = rad2deg((Q^2/(16 * pi * eps0 * m * g * (l^2)))^(1/3)); %Es una aproximación

f = @(alfa) 16 * pi * eps0 * m * g * (l^2) * sind(alfa)^2 * tand(alfa) - Q^2;

%Here you give it a function and a point, so it starts looking
% for 0 and returns alpha
alfa2 = fzero(f,alfa);

%All the grafication code 
%First graph our function.
figure(1)
fplot(f)
grid
xline(0, 'k')
yline(0, 'k')
xlabel('alpha (DEG)')
hold on

%Here you put a title and a point where alpha is located.
title(['alfa = ' num2str(alfa2) 'º'])
plot((alfa2),f(alfa),'ro','MarkerSize',6,'LineWidth',2)
hold off

%The limits to be able to notice the part of the graph that interests us.
xlim([-30 + alfa2 30 + alfa2])
ylim([-1e-8 1e-8])
