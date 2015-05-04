sentence = 'She had your dark suit in greasy wash water all year.';
[FolderName, FileName, SentenceLength]=SentenceSearch(sentence);
info = [];
for idx=1:length(SentenceLength)
    info = [info; FolderName(idx) FileName(idx) SentenceLength(idx)];
end
info
