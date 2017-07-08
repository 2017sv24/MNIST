function varargout = classifier(varargin)
% CLASSIFIER MATLAB code for classifier.fig
%      CLASSIFIER, by itself, creates a new CLASSIFIER or raises the existing
%      singleton*.
%
%      H = CLASSIFIER returns the handle to a new CLASSIFIER or the handle to
%      the existing singleton*.
%
%      CLASSIFIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLASSIFIER.M with the given input arguments.
%
%      CLASSIFIER('Property','Value',...) creates a new CLASSIFIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before classifier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to classifier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help classifier

% Last Modified by GUIDE v2.5 07-Jul-2017 08:38:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @classifier_OpeningFcn, ...
                   'gui_OutputFcn',  @classifier_OutputFcn, ...
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

% --- Executes just before classifier is made visible.
function classifier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to classifier (see VARARGIN)

% Choose default command line output for classifier
handles.feature = hObject;
handles.method = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using classifier.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(10));
end

% UIWAIT makes classifier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = classifier_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.feature;

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu_feature.
function popupmenu_feature_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_feature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu_feature contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_feature


% --- Executes during object creation, after setting all properties.
function popupmenu_feature_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_feature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Raw', 'HIST', 'HOG', 'LBP'});


% --- Executes on selection change in popupmenu_method.
function popupmenu_method_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_method


% --- Executes during object creation, after setting all properties.
function popupmenu_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'KNN', 'SVM'});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ imgData, lblData ] = loadData( strFileImage, strFileLabel )
    imgData = loadMNISTImages(strFileImage);
    lblData = loadMNISTLabels(strFileLabel);
%end

function [ imgTrainData, lblTrainData ] = loadTrainData ( )
    [ imgTrainData, lblTrainData ] = loadData( 'train-images.idx3-ubyte', 'train-labels.idx1-ubyte' );
%end

function [ imgTestData, lblTestData ] = loadTestData ( )
    [ imgTestData, lblTestData ] = loadData( 't10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte' );
%end

function featuresData = HISTFeatures (imgData)
    nBins = 128;
    
    nData = size(imgData, 2);
    featuresData = zeros(nBins, nData);
    for i = 1:nData
        featuresData(:,i) = imhist(imgData(:,i), nBins);
    end
%end

function featuresData = HOGFeatures (imgData)
    cellSize = [2 2];
    
    imgI1D = imgData(:, 1);
    imgI2D = reshape(imgI1D, 28, 28);
    [featuresVector, ~] = extractHOGFeatures (imgI2D, 'CellSize', cellSize);
    nSize = length(featuresVector);
    
    nData = size(imgData, 2);
    featuresData = zeros(nSize, nData);
    for i = 1:nData
        imgI1D = imgData(:, i);
        imgI2D = reshape(imgI1D, 28, 28);
        featuresData(:,i) = extractHOGFeatures (imgI2D, 'CellSize', cellSize);
    end
%end

function featuresData = LBPFeatures (imgData)
    numNeighbors = 4;
    radius = 4;
    
    imgI1D = imgData(:, 1);
    imgI2D = reshape(imgI1D, 28, 28);
    [featuresVector, ~] = extractLBPFeatures (imgI2D, 'NumNeighbors', numNeighbors, 'Radius', radius);
    nSize = length(featuresVector);
    
    nData = size(imgData, 2);
    featuresData = zeros(nSize, nData);
    for i = 1:nData
        imgI1D = imgData(:, i);
        imgI2D = reshape(imgI1D, 28, 28);
        featuresData(:,i) = extractLBPFeatures (imgI2D, 'NumNeighbors', numNeighbors, 'Radius', radius);
    end
%end


function percentResult = Get_Result (lblDataTest, lblResult)
    nPositiveResult = zeros(1, 10);
    nNegativeResult = zeros(1, 10);
    percentResult = zeros(1, 10);
    
    nTestData = size(lblDataTest, 1);
    for i = 1:nTestData
        realNumber = lblDataTest(i);
        if lblResult(i) == lblDataTest(i)
            if realNumber == 0
                nPositiveResult(10) = nPositiveResult(10) + 1;
            else
                nPositiveResult(realNumber) = nPositiveResult(realNumber) + 1;
            end
        else
            if realNumber == 0
                nNegativeResult(10) = nNegativeResult(10) + 1;
            else
                nNegativeResult(realNumber) = nNegativeResult(realNumber) + 1;
            end
        end
    end
    
    for i = 1:10
        percentResult(i) = nPositiveResult(i) / (nPositiveResult(i) + nNegativeResult(i));
    end
%end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function percentResult = Recognition_Raw_KNN ( )
    [ imgDataTrain, lblDataTrain ] = loadTrainData ( );
    featuresDataTrain = imgDataTrain;
    mdl = fitcknn(featuresDataTrain', lblDataTrain);
    
    [ imgDataTest, lblDataTest ] = loadTestData ( );
    featuresDataTest = imgDataTest;
    lblResult = predict(mdl, featuresDataTest');
    
    percentResult = Get_Result (lblDataTest, lblResult);
%end

function percentResult = Recognition_HIST_KNN ( )
    [ imgDataTrain, lblDataTrain ] = loadTrainData ( );
    featuresDataTrain = HISTFeatures (imgDataTrain);
    mdl = fitcknn(featuresDataTrain', lblDataTrain);
    
    [ imgDataTest, lblDataTest ] = loadTestData ( );
    featuresDataTest = HISTFeatures (imgDataTest);
    lblResult = predict(mdl, featuresDataTest');
    
    percentResult = Get_Result (lblDataTest, lblResult);
%end


function percentResult = Recognition_HOG_KNN ( )
    [ imgDataTrain, lblDataTrain ] = loadTrainData ( );
    featuresDataTrain = HOGFeatures (imgDataTrain);
    mdl = fitcknn(featuresDataTrain', lblDataTrain);
    
    [ imgDataTest, lblDataTest ] = loadTestData ( );
    featuresDataTest = HOGFeatures (imgDataTest);
    lblResult = predict(mdl, featuresDataTest');
    
    percentResult = Get_Result (lblDataTest, lblResult);
%end

function percentResult = Recognition_LBP_KNN ( )
    [ imgDataTrain, lblDataTrain ] = loadTrainData ( );
    featuresDataTrain = LBPFeatures (imgDataTrain);
    mdl = fitcknn(featuresDataTrain', lblDataTrain);
    
    [ imgDataTest, lblDataTest ] = loadTestData ( );
    featuresDataTest = LBPFeatures (imgDataTest);
    lblResult = predict(mdl, featuresDataTest');
    
    percentResult = Get_Result (lblDataTest, lblResult);
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function percentResult = Recognition_Raw_SVM ( )
    [ imgDataTrain, lblDataTrain ] = loadTrainData ( );
    featuresDataTrain = imgDataTrain;
    mdl = fitcsvm(featuresDataTrain', lblDataTrain);
    
    [ imgDataTest, lblDataTest ] = loadTestData ( );
    featuresDataTest = imgDataTest;
    lblResult = predict(mdl, featuresDataTest');
    
    percentResult = Get_Result (lblDataTest, lblResult);
%end

function percentResult = Recognition_HIST_SVM ( )
    [ imgDataTrain, lblDataTrain ] = loadTrainData ( );
    featuresDataTrain = HISTFeatures (imgDataTrain);
    mdl = fitcsvm(featuresDataTrain', lblDataTrain);
    
    [ imgDataTest, lblDataTest ] = loadTestData ( );
    featuresDataTest = HISTFeatures (imgDataTest);
    lblResult = predict(mdl, featuresDataTest');
    
    percentResult = Get_Result (lblDataTest, lblResult);
%end


function percentResult = Recognition_HOG_SVM ( )
    [ imgDataTrain, lblDataTrain ] = loadTrainData ( );
    featuresDataTrain = HOGFeatures (imgDataTrain);
    mdl = fitcsvm(featuresDataTrain', lblDataTrain);
    
    [ imgDataTest, lblDataTest ] = loadTestData ( );
    featuresDataTest = HOGFeatures (imgDataTest);
    lblResult = predict(mdl, featuresDataTest');
    
    percentResult = Get_Result (lblDataTest, lblResult);
%end

function percentResult = Recognition_LBP_SVM ( )
    [ imgDataTrain, lblDataTrain ] = loadTrainData ( );
    featuresDataTrain = LBPFeatures (imgDataTrain);
    mdl = fitcsvm(featuresDataTrain', lblDataTrain);
    
    [ imgDataTest, lblDataTest ] = loadTestData ( );
    featuresDataTest = LBPFeatures (imgDataTest);
    lblResult = predict(mdl, featuresDataTest');
    
    percentResult = Get_Result (lblDataTest, lblResult);
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in pushbutton_run.
function pushbutton_run_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

popup_feature = get(handles.popupmenu_feature, 'Value');
popup_method = get(handles.popupmenu_method, 'Value');

axes(handles.axes1);
cla;
switch popup_feature
    case 1
        %Raw
        switch popup_method
            case 1
                %KNN
                plot(Recognition_Raw_KNN());
            case 2
                %SVM
                plot(Recognition_Raw_SVM());
        end
    case 2
        %HIST
        switch popup_method
            case 1
                %KNN
                plot(Recognition_HIST_KNN());
            case 2
                %SVM
                plot(Recognition_HIST_SVM());
        end
    case 3
        %HOG
        switch popup_method
            case 1
                %KNN
                plot(Recognition_HOG_KNN());
            case 2
                %SVM
                plot(Recognition_HOG_SVM());
        end
    case 4
        %LBP
        switch popup_method
            case 1
                %KNN
                plot(Recognition_LBP_KNN());
            case 2
                %SVM
                plot(Recognition_LBP_SVM());
        end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
