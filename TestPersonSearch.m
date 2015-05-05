%%search for this folder
close all
clc
FolderName = 'dr1-fvmh0';
[FileName, SentenceLength, Sentence] = PersonSearch(FolderName);
assert(exist('FileName')==1,'No File')
assert(exist('SentenceLength')==1,'No length of sentences')
assert(exist('Sentence')==1,'No Sentence')
assert(length(SentenceLength)==length(FileName),'Not same lengths')
FileName
SentenceLength
Sentence