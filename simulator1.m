clear all; clc;

%Constant variables
a = true;
S = 0;

%Requests the initial charge in addition to the initial vector.
Q = input("Enter your main charge: ");
Rx = input("Enter 'x' of your vector: ");
Ry = input("Enter 'y' of your vector: ");
Rz = input("Enter 'z' of your vector: ");
R1 = [Rx,Ry,Rz];

%Here begins a loop that performs the summation
while a == true

    %Request the other vector and its charge
    QK = input("Enter your other charge: ");
    R2x = input("Enter 'x' from your other vector: ");
    R2y = input("Enter 'y' from your other vector: ");
    R2z = input("Enter 'z' from your other vector: ");
    R2 = [R2x,R2y,R2z];
    
    %Here calculate the module of the subtraction of the vectors
    r = R1-R2;
    r_norm = sqrt(r(1)^2+r(2)^2+r(3)^2);
    
    %Here do the sum
    S = S + QK * r/(r_norm)^3; 

    %Ask if you want to add another charge
    b = input("Want to add another charge? Yes = 1 / No = 2: ");

    %If the answer is "yes" it starts over, 
    % %if the answer is "no" it goes to the next step
    if b == 1
        a = true;
    elseif b == 2
        a = false;
    else
        a = false;
        disp("ERROR");
    end
end

%Here we multiply our summation by the original charge 
% and divide by the vacuum permittivity constant. 
%In addition, the electric field is also calculated, 
% which is that electric force between our original charge.
eForce = S * Q / (8.854e-12 / 9);
eField = eForce/ Q;

format shortE
fText = "Tu campo eléctrico es: " + eForce(1)...
    + "C " + eForce(2)... 
    + "C " + eForce(3) + "C";

fiText = "Tu campo eléctrico es: " + eField(1)...
    + " " + eField(2)... 
    + " " + eField(3);

%Finally it prints the answers of the electric force 
%and the electric field.
disp(fText)
disp(fiText)
