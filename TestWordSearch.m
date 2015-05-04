%%search for this word
clear all
close all
clc
word = 'she';
[FolderName,FileName,SampleBegin,SampleEnd,Sentence]=WordSearch(word);
assert(exist('FolderName')==1,'No Folder')
assert(exist('FileName')==1,'No File')
assert(exist('SampleBegin')==1,'No Begin')
assert(exist('SampleEnd')==1,'No End')
assert(exist('Sentence')==1,'No Sentence')
assert((length(FolderName)==length(FileName))==(length(SampleBegin)==...
    length(SampleEnd)),'Not same lengths')
FolderName
FileName
SampleBegin
SampleEnd
Sentence