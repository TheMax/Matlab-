
% script to 
% Usage: 
% Input parameter:
%       
% Output parameter:
%       
% Output:
%    

% Author: Christoph Eike, Johannes L�hring, Max Zimmermann
% Version History: 
%       1.0:    first implementation            25.04.2015 CE JL MZ
%       1.01:   commentation                    28.04.2015 CE JL MZ

% ------------------------------------------------------------------------
function [Sentence_FolderName, Sentence_FileName, Sentence_SentenceLength] = SentenceSearch(sentence)

Sentence_SentenceLength = [];
Sentence_FileName = [];
Sentence_FolderName = [];

cd timit/'TIMIT MIT'
y = dir;
folders = [];

for folderidx = 1:length(y)
    folders = [folders regexp(y(folderidx).name,'.+-.+','match')];
end

for searchidx=1:length(folders)
    cd(char(folders(searchidx)))
    x = dir;
    names = [];
    for nameidx=1:length(x)
        names = [names regexp(x(nameidx).name,'.+\.txt','match')];
    end

    for txtidx=1:length(names)
        fid = fopen(char(names(txtidx)));
        data = textscan(fid, '%s %s %[^0]');
        fclose(fid);
        sen = data{3}{1};
        if sen(1:end-1) == sentence
            Sentence_FolderName = [Sentence_FolderName folders(searchidx)];
            Sentence_SentenceLength = [Sentence_SentenceLength data{2}];
            Sentence_FileName = [Sentence_FileName names(txtidx)];
            break
        end
    end
    cd ..
end
cd ../..
end


% -------------------Licence ---------------------------------------------
% Copyright (c) <2015> Christoph Eike, Johannes L�hring, Max Zimmermann
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
