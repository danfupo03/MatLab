clc; clear all;

%These constant variables are assigned.
g = 9.81;

%These are both the time in x and y, 
% we are going to assign it 0 so that we can calculate it later.
C2 = 0; %Time in x
C4 = 0; %Time in y

%Data assigned by the user
E = input("Enter the electric field: ");
Qm = input("Enter Q/m: ");
C1 = input("Enter your initial speed on the x-axis: ");
C3 = input("Enter your initial speed on the y-axis: ");
y = -(abs(input("Enter the height at which you want to know the length (in meters): ")));

%Here we calculate time
t = (C3 + sqrt(C3^2 - 2*g*y))/g;

%To later substitute it in our equation to calculate the distance.
x = @(t) abs(((Qm * E * t^2)/2) + (C1 * t) + C2);
y = @(t) -g*(t^2/2) + (C3 * t) + C4;
d = @(t) 2 * x(t);
x_text = "Your distance between charges is " + d(t) + "m";
disp(x_text);

%Graph in which you can see the fall of the charges.
figure(1)
hold on
for i = linspace(0,t,100)
    plot(x(i),y(i), "ok")
    plot(-x(i),y(i), "ok")
    pause(0.001)
end
title(['x = ' num2str(d(t)) 'm'])
xlabel('x')
ylabel('y')
hold off

%Graph of x with respect to t.
figure(2)
fplot(d)
title(['x = ' num2str(d(t)) ' m'])
grid
xline(0, 'k')
yline(0, 'k')
xlim([0 inf])
ylim([0 inf])