
% script to 
% Usage: 
% Input parameter:
%       
% Output parameter:
%       
% Output:
%    

% Author: Max Zimmermann
% Version History:

% ------------------------------------------------------------------------
% Länge der Sätze, Volle Sätze, Dateinamen
function [SentenceLength, Sentence, FileName] = PersonSearch(FolderName)
SentenceLength =[];
Sentence= [];
FileName = [];

cd timit/'TIMIT MIT'
cd(FolderName)

x = dir;
names = [];

for nameidx=1:length(x)
    names = [names regexp(x(nameidx).name,'.+\.txt','match')];
end

for txtidx=1:length(names)
    fid = fopen(char(names(txtidx)));
    data = textscan(fid, '%s %s %[^0]');
    fclose(fid);
    SentenceLength = [SentenceLength ; data{2}];
    Sentence = [Sentence data{3}{1}];
    FileName = [FileName ; names(txtidx)];
end
cd ../../..
end
% -------------------Licence ---------------------------------------------
% Copyright (c) <2015> Max Zimmermann
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
