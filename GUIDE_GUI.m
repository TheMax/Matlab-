function varargout = GUIDE_GUI(varargin)
% GUIDE_GUI MATLAB code for GUIDE_GUI.fig
%      GUIDE_GUI, by itself, creates a new GUIDE_GUI or raises the existing
%      singleton*.
%
%      H = GUIDE_GUI returns the handle to a new GUIDE_GUI or the handle to
%      the existing singleton*.
%
%      GUIDE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE_GUI.M with the given input arguments.
%
%      GUIDE_GUI('Property','Value',...) creates a new GUIDE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIDE_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIDE_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIDE_GUI

% Last Modified by GUIDE v2.5 05-May-2015 09:33:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIDE_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIDE_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUIDE_GUI is made visible.
function GUIDE_GUI_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIDE_GUI (see VARARGIN)

% Choose default command line output for GUIDE_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIDE_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIDE_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function person_edit_Callback(hObject, eventdata, handles)
% hObject    handle to person_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of person_edit as text
%        str2double(get(hObject,'String')) returns contents of person_edit as a double


% --- Executes during object creation, after setting all properties.
function person_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to person_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sentence_edit_Callback(hObject, eventdata, handles)
% hObject    handle to sentence_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sentence_edit as text
%        str2double(get(hObject,'String')) returns contents of sentence_edit as a double


% --- Executes during object creation, after setting all properties.
function sentence_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sentence_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function word_edit_Callback(hObject, eventdata, handles)
% hObject    handle to word_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of word_edit as text
%        str2double(get(hObject,'String')) returns contents of word_edit as a double


% --- Executes during object creation, after setting all properties.
function word_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to word_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phonem_edit_Callback(hObject, eventdata, handles)
% hObject    handle to phonem_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phonem_edit as text
%        str2double(get(hObject,'String')) returns contents of phonem_edit as a double


% --- Executes during object creation, after setting all properties.
function phonem_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phonem_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% % --- Executes on selection change in expense1.
% function expense1_Callback(hObject, eventdata, handles)
% % hObject    handle to expense1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: contents = cellstr(get(hObject,'String')) returns expense1 contents as cell array
% %        contents{get(hObject,'Value')} returns selected item from expense1
% 
% 
% % --- Executes during object creation, after setting all properties.
% function expense1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to expense1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: listbox controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



if get(handles.person_edit, 'String') ~ ''
    [Person_FileName, Person_SentenceLength, Person_Sentence] = ...
        PersonSearch(get(handles.person_edit, 'String'))
    %clear gui
    set(handles.expenseFolderName,'String','')
    set(handles.expenseFileName,'String','')
    set(handles.expenseSampleBegin,'String','')
    set(handles.expenseSampleEnd,'String','')
    set(handles.expenseSentence,'String','') 
    set(handles.expenseSentenceLength,'String','')    
    %set gui
    set(handles.expenseFileName,'String',Person_FileName)
    set(handles.expenseSentenceLength,'String',Person_SentenceLength)
    set(handles.expenseSentence,'String',Person_Sentence)
end    

if get(handles.sentence_edit, 'String') ~ ''
    [Sentence_FolderName, Sentence_FileName, Sentence_SentenceLength] = ...
        SentenceSearch(get(handles.sentence_edit, 'String'))
    %clear gui
    set(handles.expenseFolderName,'String','')
    set(handles.expenseFileName,'String','')
    set(handles.expenseSampleBegin,'String','')
    set(handles.expenseSampleEnd,'String','')
    set(handles.expenseSentence,'String','') 
    set(handles.expenseSentenceLength,'String','')  
    %set gui
    set(handles.expenseFolderName,'String',Sentence_FolderName)
    set(handles.expenseFileName,'String',Sentence_FileName)
    set(handles.expenseSentenceLength,'String',Person_SentenceLength)    
end

if get(handles.word_edit, 'String') ~ ''
    [Word_FolderName, Word_FileName, Word_SampleBegin, Word_SampleEnd,...
     Word_Sentence] = WordSearch(get(handles.word_edit, 'String'))
    %clear gui
    set(handles.expenseFolderName,'String','')
    set(handles.expenseFileName,'String','')
    set(handles.expenseSampleBegin,'String','')
    set(handles.expenseSampleEnd,'String','')
    set(handles.expenseSentence,'String','') 
    set(handles.expenseSentenceLength,'String','')  
    %set gui
    set(handles.expenseFolderName,'String',Word_FolderName)
    set(handles.expenseFileName,'String',Word_FileName)
    set(handles.expenseSampleBegin,'String',Word_SampleBegin)
    set(handles.expenseSampleEnd,'String',Word_SampleEnd)
    set(handles.expenseSentence,'String',Word_Sentence)    
end

if get(handles.phonem_edit, 'String') ~ ''
    [Phonem_FolderName, Phonem_FileName, Phonem_SampleBegin, ...
        Phonem_SampleEnd, Phonem_Sentence] = ...
        PhonemSearch(get(handles.phonem_edit, 'String'))
    %clear gui
    set(handles.expenseFolderName,'String','')
    set(handles.expenseFileName,'String','')
    set(handles.expenseSampleBegin,'String','')
    set(handles.expenseSampleEnd,'String','')
    set(handles.expenseSentence,'String','') 
    set(handles.expenseSentenceLength,'String','')  
    %set gui
    set(handles.expenseFolderName,'String',Phonem_FolderName)
    set(handles.expenseFileName,'String',Phonem_FileName)
    set(handles.expenseSampleBegin,'String',Phonem_SampleBegin)
    set(handles.expenseSampleEnd,'String',Phonem_SampleEnd)
    set(handles.expenseSentence,'String',Phonem_Sentence)    
end
