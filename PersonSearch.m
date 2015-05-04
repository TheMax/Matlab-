% function to search for the sentences of a person(folder) 
% Usage: [SentenceLength, Sentence, FileName] = PersonSearch(FolderName)
% Input parameter:
%       FolderName: give the name of one folder 
% Output parameter:
%       FileName: name of file of certain sentence
%       SentenceLength: length of certain sentence
%       Sentence: sentence
% Output:
%       None
% Author: Christoph Eike, Johannes Lühring, Max Zimmermann
% Version History:
%       1.0:    first implementation            25.04.2015 CE JL MZ
%       1.01:   commentation                    28.04.2015 CE JL MZ
% ------------------------------------------------------------------------

function [FileName, SentenceLength, Sentence] = PersonSearch(FolderName)
SentenceLength =[];
Sentence= [];
FileName = [];

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
    SentenceLength = [SentenceLength ; data{2}]; %last sample as end
    Sentence = [Sentence data{3}{1}]; 
    file = char(names(txtidx));
    file2 = strcat(file(1:end-3),'wav');
    FileName = [FileName; {file2}];
end
cd ../../..
end
% -------------------Licence ---------------------------------------------
% Copyright (c) <2015> Christoph Eike, Johannes Lühring, Max Zimmermann
% Institute for Hearing Technology and Audiology
% Jade University of Applied Sciences Oldenburg 
% Permission is hereby granted, free of charge, to any person obtaining 
% a copy of this software and associated documentation files 
% (the "Software"), to deal in the Software without restriction, including 
% without limitation the rights to use, copy, modify, merge, publish, 
% distribute, sublicense, and/or sell copies of the Software, and to 
% permit persons to whom the Software is furnished to do so, subject 
% to the following conditions:
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
