function varargout = GUISix(varargin)
% GUISIX MATLAB code for GUISix.fig
%      GUISIX, by itself, creates a new GUISIX or raises the existing
%      singleton*.
%
%      H = GUISIX returns the handle to a new GUISIX or the handle to
%      the existing singleton*.
%
%      GUISIX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUISIX.M with the given input arguments.
%
%      GUISIX('Property','Value',...) creates a new GUISIX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUISix_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUISix_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUISix

% Last Modified by GUIDE v2.5 15-Apr-2025 16:14:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUISix_OpeningFcn, ...
                   'gui_OutputFcn',  @GUISix_OutputFcn, ...
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


% --- Executes just before GUISix is made visible.
function GUISix_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUISix (see VARARGIN)

% Choose default command line output for GUISix
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUISix wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUISix_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function Theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Theta.
function Theta_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Angle as text
%        str2double(get(hObject,'String')) returns contents of Angle as a double


% --- Executes during object creation, after setting all properties.
function Angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BFK.
function BFK_Callback(hObject, eventdata, handles)
% hObject    handle to BFK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 q1 = str2double(handles.Theta1.String)*pi/180; % result stored in radians
 q2 = str2double(handles.Theta2.String)*pi/180;
 q3 = str2double(handles.Theta3.String)*pi/180;
 q4 = str2double(handles.Theta4.String)*pi/180;
 q5 = str2double(handles.Theta5.String)*pi/180;
 q6 = str2double(handles.Theta6.String)*pi/180;

% for i = 1:6
%     q(i) = str2double(get(handles.(['Theta' num2str(i)]), 'String')) * pi/180;
% end

a1 = 0.2; a2 = 0.15; a3 = 0.08;
d1 = 0.06; d2 = 0.06; d3 = 0.06; d4 = 0.03;

L(1)= Link([0,d1,0,pi/2],'standard');
L(2)= Link([0,0,a1,0],'standard');
L(3)= Link([0,0,a2,0],'standard');
L(4)= Link([0,d2,a3,pi/2],'standard');
L(5)= Link([0,d3,0,-pi/2],'standard');
L(6)= Link([0,d4,0,0],'standard');

SixAxisManipulator = SerialLink(L,'name','6-AxisManipulator');

 SixAxisManipulator.plot([q1 q2 q3 q4 q5 q6]); 
 % SixAxisManipulator.plot(q); 

T=SixAxisManipulator.fkine([q1 q2 q3 q4 q5 q6]);

handles.X.String = num2str(floor(T.t(1)));
handles.Y.String = num2str(floor(T.t(2)));
handles.Z.String = num2str(floor(T.t(3)));


% --- Executes on button press in BIK.
function BIK_Callback(hObject, eventdata, handles)

   
    PositionX = str2double(handles.X.String);
    PositionY = str2double(handles.Y.String);
    PositionZ = str2double(handles.Z.String);

    % Link parameters
    a1 = 0.2; a2 = 0.15; a3 = 0.08;
    d1 = 0.06; d2 = 0.06; d3 = 0.06; d4 = 0.03;

   
    L(1) = Link([0, d1, 0,    pi/2], 'standard');
    L(2) = Link([0,  0, a1,      0], 'standard');
    L(3) = Link([0,  0, a2,      0], 'standard');
    L(4) = Link([0, d2, a3,   pi/2], 'standard');
    L(5) = Link([0, d3,  0,  -pi/2], 'standard');
    L(6) = Link([0, d4,  0,      0], 'standard');

  
    SixAxisManipulator = SerialLink(L, 'name', '6-AxisManipulator');

    % Desired end-effector pose (position only)
    T = [1 0 0 PositionX;
         0 1 0 PositionY;
         0 0 1 PositionZ;
         0 0 0 1];

    % Solve inverse kinematics (position only)
    Ik = SixAxisManipulator.ikine(T, zeros(1,6), [1 1 1 0 0 0]) * 180/pi;

    if isempty(Ik) || any(isnan(Ik))
    errordlg('Inverse kinematics failed. The desired position may be unreachable.', 'IK Error');
    return;
end
    handles.Theta1.String = num2str(floor(Ik(1)));
    handles.Theta2.String = num2str(floor(Ik(2)));
    handles.Theta3.String = num2str(floor(Ik(3)));
    handles.Theta4.String = num2str(floor(Ik(4)));
    handles.Theta5.String = num2str(floor(Ik(5)));
    handles.Theta6.String = num2str(floor(Ik(6)));

    % Plot the robot with calculated joint angles
    SixAxisManipulator.plot(Ik * pi/180);




function Theta1_Callback(hObject, eventdata, handles)
% hObject    handle to Theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta1 as text
%        str2double(get(hObject,'String')) returns contents of Theta1 as a double


% --- Executes during object creation, after setting all properties.
function Theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta2_Callback(hObject, eventdata, handles)
% hObject    handle to Theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta2 as text
%        str2double(get(hObject,'String')) returns contents of Theta2 as a double


% --- Executes during object creation, after setting all properties.
function Theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta3_Callback(hObject, eventdata, handles)
% hObject    handle to Theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta3 as text
%        str2double(get(hObject,'String')) returns contents of Theta3 as a double


% --- Executes during object creation, after setting all properties.
function Theta3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta4_Callback(hObject, eventdata, handles)
% hObject    handle to Theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta4 as text
%        str2double(get(hObject,'String')) returns contents of Theta4 as a double


% --- Executes during object creation, after setting all properties.

function Theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta5_Callback(hObject, eventdata, handles)
% hObject    handle to Theta5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta5 as text
%        str2double(get(hObject,'String')) returns contents of Theta5 as a double


% --- Executes during object creation, after setting all properties.
function Theta5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta6_Callback(hObject, eventdata, handles)
% hObject    handle to Theta6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta6 as text
%        str2double(get(hObject,'String')) returns contents of Theta6 as a double


% --- Executes during object creation, after setting all properties.
function Theta6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X_Callback(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X as text
%        str2double(get(hObject,'String')) returns contents of X as a double


% --- Executes during object creation, after setting all properties.
function X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Callback(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y as text
%        str2double(get(hObject,'String')) returns contents of Y as a double


% --- Executes during object creation, after setting all properties.
function Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z_Callback(hObject, eventdata, handles)
% hObject    handle to Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z as text
%        str2double(get(hObject,'String')) returns contents of Z as a double


% --- Executes during object creation, after setting all properties.
function Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
