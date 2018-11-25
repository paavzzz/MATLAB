

%translate
%
% Description: This MATLAB function references an Excel spreadsheet to "translate" a basic mRNA sequence into a polypeptide sequence.
%
% Input: A string representing a RNA sequence
% Return Type: A string representing the polypeptide sequence
%
% Assumptions: The passed in mRNA sequence does not contain errors.for
%
% Notes: start and stop codons indicated

function aminos = translate( RNA )

[data, arr1]=xlsread('codons.xlsx','A:A');
[data, arr2]=xlsread('codons.xlsx','B:B');
aminos=string('');

for i=[1:3:(length(RNA)-2)]

    for j=[1:numel(arr1)]

        if strcmp(RNA(i:(i+2)),string(arr1(j)))

            aminos=strcat(aminos,string(arr2(j)));

            break;
        end
    end

end


%hairpins
%
% Description: This MATLAB function detects palindromic sequences separated by atleast 3 nucleotides in the middle. 
% These signify that the mRNA or RNA sequence could potentially form a hairpin structure, which is very common.
% It also checks to see if this hairpin structure is a part of the termination signal in bacteria (rho-independent)
%
% Input: A string representing a RNA sequence
% Return Type: A string highlighting the palindromic part of the sequence
%
% Assumptions: RNA sequence is passed in.
%

         
function sequence = hairpins(RNA)
         count = 0;
         i = 0;
         j = length(RNA)+1;
    sequence = {};
    while i != j && i<(length(RNA)./2) && j>(length(RNA)./2)
         i = i+1;
         j = j-1;
            if abs(RNA(j) - RNA(i)) == 20 || abs(RNA(j) - RNA(i)) == 4
                count = count+1;
            end
            if count > 3 && (j-i) >3
                sequence{end+1}= [double(RNA((i-count+1):(j+count-1)))];
                count = 0;
            end
    end
    if isempty(sequence)
         fprintf('Cruciforms and palindromes in this sequence of RNA are not possible to form.\n');
    end
    if !isempty(sequence) && RNA( length(RNA)-2: length(RNA) ) == 'UUU'
         fprintf('Rho-independent termination may result in bacteria.\n');
    end
         sequence = char(sequence);
end
         

         




