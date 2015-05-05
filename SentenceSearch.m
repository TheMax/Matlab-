% function to search for a certain sentence
% Usage: [FolderName, FileName, SentenceLength] = ...
%  SentenceSearch('She had your dark suit in greasy wash water all year.')
% Input parameter:
%       sentence: search for this sentence (write as string)      
% Output parameter:
%       Sentence_FolderName: persons saying this sentence
%       Sentence_FileName: name of records of this sentence
%       Sentence_SentenceLength: length of certain record
% Output:
%    None
% Author: Christoph Eike, Johannes Lühring, Max Zimmermann
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
    %save person folders in variable
end

for searchidx=1:length(folders)
    cd(char(folders(searchidx)))
    %go into folder
    x = dir;
    names = [];
    for nameidx=1:length(x)
        names = [names regexp(x(nameidx).name,'.+\.txt','match')];
        %save files of sentences
    end

    for txtidx=1:length(names)
        fid = fopen(char(names(txtidx)));
        data = textscan(fid, '%s %s %[^0]');
        fclose(fid);
        %open files
        sen = data{3}{1};
        %save sentence of file in variable
        if sen(1:end-1) == sentence
            %match?
            Sentence_FolderName = [Sentence_FolderName; folders(searchidx)];
            %save name of person folder
            Sentence_SentenceLength = [Sentence_SentenceLength; data{2}];
            %save last sample number as length
            rec = char(names(txtidx));
            rec2 = strcat(rec(1:end-3),'wav'); 
            Sentence_FileName = [Sentence_FileName; {rec2}];
            %save name of record
            break
        end
    end
    cd ..
end
cd ../..
end