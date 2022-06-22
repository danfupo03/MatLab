%Author: Daniel Fuentes Portaluppi
%Description: This code calculates the capacitance 
% and the accumulated energy

clc; clear all;

%Here use the 'menu' function to make a menu in which
% the user can choose the option that best serves him 
% to calculate the electric field.
user_choice = menu('Select the formula you want to use: ', ...
                   'C, of a parallel plate capacitor', ...
                   'C, of a cylindrical or coaxial capacitor', ...
                   'C, of a spherical capacitor');

switch (user_choice)

%PARALLEL PLATES
%Here is the capacitance of a parallel plate capacitor.
    case 1
        %The variables that the user enters
        e = input("Enter the permittivity of the medium (F/m): ");
        S = input("Enter the area of the plates (m^2): ");
        d = input("Enter the distance between the plates (m): ");
        
        V = input("Enter the voltage (V): ");

        %Calculate the capacitance
        C = (e * S)/d;

        %Calculate the energy stored
        We = (C * V^2) / 2;
        
        %PrintS our answer
        fprintf("\nPARALLEL PLATES\n");
        fprintf("The capacitance is C = %.2e Q/V\n",C);
        fprintf("The stored energy is We = %.2e joules\n",We);

%CYLINDRICAL OR COAXIAL
%Here the capacitance of a cylindrical capacitor is calculated
    case 2
        %The variables that the user enters
        e = input("Enter the permittivity of the medium (F/m): ");
        a = input("Enter your inner radius 'a' (meters) " + ...
            "Note. Remember that 'a' is less than 'b': ");
        b = input("Enter your outer radius 'b' (m): ");
        L = input("Enter the length of the condenser (m): ");

        V = input("Enter the voltage (V): ");

        %Calculate the capacitance
        C = (2 * pi * e * L) / (log(b/a));
        
        %Calculate the energy stored
        We = (C * V^2) / 2;

        %Prints our answer
        fprintf("\nCYLINDRICAL\n");
        fprintf("The capacitance is C = %.2e Q/V\n",C);
        fprintf("The stored energy is We = %.2e joules\n",We);

%SPHERICAL
%Here the capacitance of a spherical capacitor is calculated    
    case 3
        %The variables that the user enters
        e = input("Enter the permittivity of the medium (F/m): ");
        a = input("Enter your inner radius 'a' (m) " + ...
            "Note. Remember that 'a' is less than 'b': ");
        b = input("Enter your outer radius 'b' (m): ");

        V = input("Enter the voltage (V): ");

        %Calculate the capacitance
        C = (4 * pi * e)/((1/a)-(1/b));
 
        %Calculate the energy stored
        We = (C * V^2) / 2;

        %Prints the answer
        fprintf("\nSPHERICAL\n");
        fprintf("The capacitance is C = %.2e Q/V\n",C);
        fprintf("The stored energy is We = %.2e joules\n",We);

%END
    otherwise
        warndlg('END OF THE OPERATION')
        beep
end