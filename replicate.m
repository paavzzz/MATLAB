
%MATLAB

%replicate

% Description: This MATLAB function outputs fragments generated in Sanger Sequencing when a fraction of ddNTPs are added along with dNTPs
%   during replication (along with radioactively labeled primers). ddNTPs do not have nucleophilic attack activity because they lack a 2'
%   OH usually found in deoxyribonucleotides.
%
% Input: The parameter being taken in is a string that is a DNA sequence.
% Return Type: This function returns a matrix with all the possible sequence fragments possible from the Sanger sequencing method. Also,
%   the function prints out each fragment that is prematurely terminated by a ddNTP, to stimulate a real-time check of the finite 
%   possibilities of this sequencing method.
%
% Assumptions: include that the process of adding ddNTPs is repeated 4 times, once for each residue.
%
% Notes: Typically these sequences are found by running an autoradiogram electrophoresis gel.
%


function fragments = replicate(DNA)
    fragments = '';

    A = strfind(DNA,'A');
    for i = A
        DNA(i) = 'T';
        fprintf("%s\n",DNA(1:i));
        fragments = [fragments; DNA(1:i)];
    end
    fprintf('finished adding thymine residues...\n');


    C = strfind(DNA,'C');
    for i = C
        DNA(i) = 'G';
        fprintf("%s\n",DNA(1:i));
        fragments = [fragments; DNA(1:i)];
    end

fprintf('finished adding guanosine residues...\n');


    T = strfind(DNA,'T');
    T = T(!(ismember(T,A)));
    for i = T
        DNA(i) = 'A';
        fprintf("%s\n",DNA(1:i));
        fragments = [fragments; DNA(1:i)];
    end
fprintf('finished adding adenosine residues...\n');



    G = strfind(DNA,'G');
    G = G(!(ismember(G,C)));
    for i = G
        DNA(i) = 'C';
        fprintf("%s\n",DNA(1:i));
        fragments = [fragments; DNA(1:i)];
    end
fprintf('finished adding cytosine residues...\n');


end

%replicate2

% Description: This MATLAB function outputs a basic complementary sequence of DNA of a template strand used in the replication process.
%
% Input: The parameter being taken in is a string that is a DNA sequence.
% Return Type: This function returns a string that is the newly synthesized DNA strand.

function D = replicate2(DNA)

A = strfind(DNA,'A');
T = strfind(DNA,'T');
G = strfind(DNA,'G');
C = strfind(DNA,'C');

DNA(A) = 'T';
DNA(T) = 'A';
DNA(C) = 'G';
DNA(G) = 'C';

D = DNA;

end

