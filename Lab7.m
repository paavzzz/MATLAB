%% Problem 1


%The Equations:

% R1*i1 + R2*i2 -v1 = 0
% -R2*i2 + R3*i3 + R5*i5 = 0
% v2 + R4*i4 - R3*i3 = 0
% -i1 + i2 + i3 + i4= 0
% -i4 -i3 +i5 = 0

%Values provided

R1 = 470;
R2 = 330;
R3 = 560;
R4 = 100;
R5 = 1000;
v1 = 5;
v2 = 10;

%Coefficients matrix. Contains only the coefficients of the i unknown values that we are solving for.

coeffs=[R1 R2 0 0 0;
        0 -R2 R3 0 R5;
        0 R4 -R3 0 0;
        -1 1 1 1 0;
        0 0 -1 -1 1];

constants=[v1;
         0;
         -v2;
         0;
         0];

%We take the inverse of the coeffs matrix and multiply that by both vectors.
%inverse of coeffs matrix * coeffs matrix is the identity matrix  ( major diagonal = 1)

answer=coeffs\constants %same thing as doing linsolve(matrix, matrix2) or mldivide


%%Part 2

%We are trying to find the range of voltages of v2 for which none of the currents (i n) is > 50 mA or < - 50 mA.

v2=[1:3];
answer=[];

for i=v2 %v2 should be within the range of 1 to 3 volts

    matrix2=[v1; 0; -i; 0; 0]; %column matrix

    answer2=matrix\matrix2;

    if answer2 < 0.05 & answer2 > -0.05 %checks the constraint

       answer=[answer,answer2]; %keeps adding to matrix if constraints are met!

    end
   
end

fprintf('V2 is %d',v2);
answer

%% Problem 2
DNA=string('TACGATAAGAAATTCCCAATT');
RNA=transcribe(DNA)

%% Problem 3
DNA=string('AUGUCGUCCUUUUUCUAA');
aminos=translate(DNA)

