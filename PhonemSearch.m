% function to search for certain phonems
% Usage: [FolderName, FileName, SampleBegin, SampleEnd, Sentence] = ...
%                                          PhonemSearch('iy')
% Input parameter:
%       phonem: search for this phonem (write as string)
% Output parameter:
%       Phonem_FolderName: all folders phonem can be found in
%       Phonem_FileName: all audio files phonem can be found in
%       Phonem_SampleBegin: begin of phonem (in samples)
%       Phonem_SampleEnd: end of phonem (in samples)
%       Phonem_Sentence: sentences where phonem appears
% Output:
%    None
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
    %save person folders in variable
end

for searchidx=1:length(folders)
    cd(char(folders(searchidx)))
    x = dir;
    names = [];

    for nameidx=1:length(x)
        names = [names regexp(x(nameidx).name,'.+\.phn','match')];
        %get phonem files
    end

    for fileidx=1:length(names)
        fid = fopen(char(names(fileidx)));
        data = textscan(fid, '%s %s %[^0123456789]'); 
        %seperate by number(begin in samples), number(end in samples), 
        %text(phonem)
        fclose(fid);
        for phnidx=1:length(data{3})
            phn = data{3}{phnidx};
            if length(phonem) == length(char(phn(1:end-1)))
                %phonems can only be compared if same length
                if phonem == char(phn(1:end-1))
                    Phonem_FolderName = [Phonem_FolderName ; folders(searchidx)];   
                    %person
                    begin = [begin '.' data{1}{phnidx}];
                    SampleBegin2 = strsplit(begin, '.');
                    Phonem_SampleBegin = SampleBegin2(2:end)';
                    %save sample number of begins in one vector
                    fin = [fin '.' data{2}{phnidx}];
                    SampleEnd2 = strsplit(fin,'.');
                    Phonem_SampleEnd = SampleEnd2(2:end)';
                    %save sample number of ends in one vector
                    rec = char(names(fileidx));
                    rec2 = strcat(rec(1:end-3),'wav'); 
                    Phonem_FileName = [Phonem_FileName; {rec2}];
                    %records of person
                    file = char(names(fileidx));
                    file = [file(1:end-3) 'txt'];
                    fid = fopen(file);
                    SenData = textscan(fid, '%s %s %[^0]');
                    fclose(fid);
                    Phonem_Sentence = [Phonem_Sentence SenData{3}{1}];
                    %sentences with phonems
                end
            end
        end
           
    end
    cd ..
end
cd ../..

end