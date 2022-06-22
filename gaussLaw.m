%Author: Daniel Fuentes Portaluppi
%Description: This is a code that serves as a form to calculate 
% the electric field of different situations using Gauss's law

clc; clear all;

%Constant variable of the permittivity of vacuum.
permi = 8.854e-12;
x = 0;

%Here use the 'menu' function to make a menu in which
% the user can choose the option that best serves him 
% to calculate the electric field.
user_choice = menu('Select the formula you want to use: ', ...
                   'E, of a point charge', ...
                   'E, of an infinite line of charges', ...
                   'E, of an infinite sheet of charges', ...
                   'E, of a sphere');

switch (user_choice)

%POINT
%Here the electric field of a point charge is calculated.
    case 1
        %The variables that the user enters.     
        Q1 = input("Enter the charge (C): ");
        r1 = input("Enter the radius (m): ");
        %Calculate the electric flow
        a = Q1 / (4 * pi * r1^2);
        %Calculate the electric field
        E1 = a / permi;
        
        %Prints our answer
        fprintf("\nPOINT\n");
        fprintf("The electric flux density is D = %.2e C/m^2\n",a);
        fprintf("The electric field is E = %.2e V/m\n",E1);

%LINE
%Here the electric field of an infinite line of charges is calculated.
    case 2
        %The variables that the user enters.
        pl2 = input("Enter linear charge density (C/m): ");
        rho2 = input("Enter rho (m): ");
        %Calculate the electric flow
        b = pl2 / (2 * pi * rho2);
        %Calculate the electric field
        E2 = b / permi;
       
        %Prints our answer
        fprintf("\nLINE\n");
        fprintf("The electric flux density is D = %.2e C/m^2\n",b);
        fprintf("The electric field is E = %.2e V/m\n",E2);
        
%SURFACE
%Here the electric field of an infinite lamina of charges is calculated.
    case 3
        %The variable entered by the user
        ps3 = input("Enter the surface charge density (C/m^2): ");

        %Calculate the electric flow
        c = ps3/2;
        %Calculate the electric field
        E3 = c / permi;

        %Prints the answer
        fprintf("\nSURFACE\n");
        fprintf("The electric flux density is D = %.2e C/m^2\n",c);
        fprintf("The electric field is E = %.2e V/m\n",E3);

        %Calculate the electric field in parallel plates
        E3_2 = ps3 / permi;

        %Prints the answer 
        fprintf("The electric field in a parallel plate capacitor is E = %.2e V/m\n", E3_2);

%SPHERE
    case 4
        %Here the electric field of a sphere is calculated.
        pv = input("Enter the volume charge density (C/m^3): ");
        a = input("Enter the radius of the sphere (m): ");
        r = input("Enter the distance to the center of the sphere: ");

        if r < a
            x = r;
        else
            x = a;
        end

        %Calculate the electric flow
        d = (x^3/(3*(r^2))) * pv;
        %Calculate the electric field
        E3 = d / permi;

        %PrintS the answer
        fprintf("\nSPHERE\n");
        fprintf("The electric flux density is D = %.2e C/m^2\n",d);
        fprintf("The electric field is E = %.2e V/m\n",E3);

 otherwise
        warndlg('END OF OPERATION')
        beep
end