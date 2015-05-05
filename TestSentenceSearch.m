%%search for this sentence
clear all
close all
clc
sentence = 'She had your dark suit in greasy wash water all year.';
[FolderName, FileName, SentenceLength]=SentenceSearch(sentence);
assert(exist('FolderName')==1,'No Folder')
assert(exist('FileName')==1,'No File')
assert(exist('SentenceLength')==1,'No length of sentences')
assert((length(FolderName)==length(FileName))==...
    (length(SentenceLength)==length(FileName)),'Not same lengths')
FolderName
FileName
SentenceLength
