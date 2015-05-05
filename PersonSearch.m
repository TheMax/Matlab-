% function to search for the sentences of a person(folder) 
% Usage: [SentenceLength, Sentence, FileName] = PersonSearch('dr1-fvmh0')
% Input parameter:
%       FolderName: give the name of one folder 
% Output parameter:
%       Person_FileName: name of file of certain sentence
%       Person_SentenceLength: length of certain sentence
%       Person_Sentence: sentence
% Output:
%       None
% Author: Christoph Eike, Johannes Lühring, Max Zimmermann
% Version History:
%       1.0:    first implementation            25.04.2015 CE JL MZ
%       1.01:   commentation                    28.04.2015 CE JL MZ
% ------------------------------------------------------------------------

function [Person_FileName, Person_SentenceLength, Person_Sentence] = ...
                                                PersonSearch(FolderName)
Person_SentenceLength =[];
Person_Sentence= [];
Person_FileName = [];

cd timit/'TIMIT MIT'
cd(FolderName) %search in certain folder

x = dir; %save directory of folder
names = [];

for nameidx=1:length(x) %for loop to save all .txt-files in 'names'
    names = [names regexp(x(nameidx).name,'.+\.txt','match')];
end

for txtidx=1:length(names) %for loop to get information out of .txt-files
    fid = fopen(char(names(txtidx))); %open .txt-file
    data = textscan(fid, '%s %s %[^0]'); 
    %seperate into sample begin, sample end and sentence
    fclose(fid);
    Person_SentenceLength = [Person_SentenceLength ; data{2}]; 
    %last sample as end
    sen = data{3}{1};
    Person_Sentence = [Person_Sentence; cellstr(sen) ]; %sentences
    file = char(names(txtidx));
    file2 = strcat(file(1:end-3),'wav'); %records of person
    Person_FileName = [Person_FileName; {file2}];
end
cd ../../..
end