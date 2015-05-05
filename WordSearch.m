% function to search for certain word 
% Usage: [FolderName, FileName, SampleBegin, SampleEnd, Sentence] = ...
%     WordSearch('she');
% Input parameter:
%       word: search for this word (write as string and all letters small!)
% Output parameter:
%       Word_FolderName: folder where word can be found in
%       Word_FileName: name of record with word in it
%       Word_SampleBegin: begin of word in this file in samples
%       Word_SampleEnd: end of word in this file in samples
%       Word_Sentence: sentence where word is in
% Output:
%    None
% Author: Christoph Eike, Johannes Lühring, Max Zimmermann
% Version History:
%       1.0:    first implementation            25.04.2015 CE JL MZ
%       1.01:   commentation                    28.04.2015 CE JL MZ
% ------------------------------------------------------------------------
function [Word_FolderName, Word_FileName, Word_SampleBegin, Word_SampleEnd, Word_Sentence] = ...
                                         WordSearch(word)
Word_SampleBegin = [];
Word_SampleEnd = [];
Word_FileName = [];
Word_Sentence = [];
Word_FolderName = [];                    
begin = [];
fin = [];


cd timit/'TIMIT MIT'
y = dir;
folders = [];

for folderidx = 1:length(y)
    folders = [folders regexp(y(folderidx).name,'.+-.+','match')];
    %save folder names
end

for searchidx=1:length(folders)
    cd(char(folders(searchidx)))
    %go into folders
    x = dir;
    names = [];

    for nameidx=1:length(x)
        names = [names regexp(x(nameidx).name,'.+\.wrd','match')];
        %save word-file names
    end

    for fileidx=1:length(names)
        fid = fopen(char(names(fileidx)));
        data = textscan(fid, '%s %s %[^0123456789]');
        fclose(fid);
        %open word-files
        for wrdidx=1:length(data{3})
            %go through all words of file
            wrd = data{3}{wrdidx};
            if length(word) == length(char(wrd(1:end-1)))
                %word cannot be compare if different length
                if word == char(wrd(1:end-1))
                    %match?
                    Word_FolderName = [Word_FolderName ; folders(searchidx)];   
                    %save name of folder
                    begin = [begin '.' data{1}{wrdidx}];
                    SampleBegin2 = strsplit(begin, '.');
                    Word_SampleBegin = SampleBegin2(2:end)';
                    %save begin of word in record in samples
                    fin = [fin '.' data{2}{wrdidx}];
                    SampleEnd2 = strsplit(fin,'.');
                    Word_SampleEnd = SampleEnd2(2:end)';
                    %save end of word in record in samples
                    rec = char(names(fileidx));
                    rec2 = strcat(rec(1:end-3),'wav'); 
                    Word_FileName = [Word_FileName; {rec2}];
                    %save name of record
                    file = char(names(fileidx));
                    file = [file(1:end-3) 'txt'];
                    fid = fopen(file);
                    SenData = textscan(fid, '%s %s %[^0]');
                    fclose(fid);
                    sen = SenData{3}{1};
                    Word_Sentence = [Word_Sentence; cellstr(sen)];
                    %save sentence
                end
            end
        end
           
    end
    cd ..
end
cd ../..
end