
% script to 
% Usage: 
% Input parameter:
%       
% Output parameter:
%       
% Output:
%    

% Author: Christoph Eike, Johannes Lühring, Max Zimmermann
% Version History:
%       1.0:    first implementation            25.04.2015 CE JL MZ
%       1.01:   commentation                    28.04.2015 CE JL MZ
% ------------------------------------------------------------------------

function [Phonem_FolderName, Phonem_FileName, Phonem_SampleBegin, Phonem_SampleEnd, Phonem_Sentence] = ...
                                         PhonemSearch(phonem)
Phonem_SampleBegin = [];
Phonem_SampleEnd = [];
Phonem_FileName = [];
Phonem_Sentence = [];
Phonem_FolderName = [];                    
begin = [];
fin = [];


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
        names = [names regexp(x(nameidx).name,'.+\.phn','match')];
    end

    for fileidx=1:length(names)
        fid = fopen(char(names(fileidx)));
        data = textscan(fid, '%s %s %[^0123456789]');
        fclose(fid);
        for phnidx=1:length(data{3})
            phn = data{3}{phnidx};
            if length(phonem) == length(char(phn(1:end-1)))
                if phonem == char(phn(1:end-1))
                    Phonem_FolderName = [Phonem_FolderName ; folders(searchidx)];   
                    begin = [begin '.' data{1}{phnidx}];
                    SampleBegin2 = strsplit(begin, '.');
                    Phonem_SampleBegin = SampleBegin2(2:end)';
                    fin = [fin '.' data{2}{phnidx}];
                    SampleEnd2 = strsplit(fin,'.');
                    Phonem_SampleEnd = SampleEnd2(2:end)';
                    Phonem_FileName = [Phonem_FileName ; names(fileidx)];
                    file = char(names(fileidx));
                    file = [file(1:end-3) 'txt'];
                    fid = fopen(file);
                    SenData = textscan(fid, '%s %s %[^0]');
                    fclose(fid);
                    Phonem_Sentence = [Phonem_Sentence SenData{3}{1}];
                end
            end
        end
           
    end
    cd ..
end
cd ../..

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
