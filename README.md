#README
Program name: Daten_&_Algorithmen_Aufgabe_1

Authors: Christoph Eike, Max Zimmermann, Johannes Lühring

##Project
Daten_&_Algorithmen_Aufgabe_1 is a program which searches a database by the TIMIT/MIT for names of persons, sentences, words and phonemes. The included GUI allows to list the searched and found data. If you push the 'Search' Button, the program  detects filled text entries and returns the data in the appropriate listbox.
##Content
This program includes several functions, which are used by the GUI.
The functions are:
* PersonSearch.m
* SentenceSearch.m
* WordSearch.m
* PhonemSearch.m

Test functions have been written to automatically test the actual output of the functions:

* TestSentenceSearch.m
* TestWordSearch.m
* TestPhonemSearch.m
* TestPersonSearch.m

GUI files:

* GUIDE_GUI.m
* GUIDE_GUI.fig

##Usage

* [SentenceLength, Sentence, FileName] = PersonSearch('dr1-fvmh0')
* [FolderName, FileName, SentenceLength] = SentenceSearch('She had your dark suit in greasy wash water all year.')
* [FolderName, FileName, SampleBegin, SampleEnd, Sentence] = PhonemSearch('iy')
* [FolderName, FileName, SampleBegin, SampleEnd, Sentence] = WordSearch('she')
* GUIDE_GUI

##Dependencies

* GUIDE_GUI uses: PersonSearch, SentenceSearch, PhonemSearch, WordSearch

##Install
To use this program you need to get all files of the content.
Also the timit folder is required.
Caution! All files have to be in same folder to run this program.

##Authors

* Christoph Eike
* Johannes Lühring
* Max Zimmermann

##License
see License.md
