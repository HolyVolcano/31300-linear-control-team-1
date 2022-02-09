clear all;
clc;

data = readtable(['09_02_2022.txt']);
data = fillmissing(data,'nearest');

% Create matrix t for time stamps
t = table2array(data(:,1));
% Create matrix ul for left motor voltage
ul = table2array(data(:,8));
% Create matrix ur for right motor voltage
ur = table2array(data(:,9));
% Create matrix wl for left motor velocity
wl = table2array(data(:,12));
% Create matrix wr for right motor velocity
wr = table2array(data(:,13));


% The data is visualised by using subplots
figure(5)
% Create a subplot and plot the left wheel velocity wl - remind to define axis labels and title 
subplot(2,2,1)
plot(t,wl)
xlim([0 t(end)])
xlabel('time (s)')
ylabel('angular velocity (rad/s)')
title('Left wheel velocity')

% Create a subplot and plot the right wheel velocity wr - remind to define axis labels and title 
subplot(2,2,2)
plot(t,wr)
xlim([0 t(end)])
xlabel('time (s)')
ylabel('angular velocity (rad/s)')
title('Right wheel velocity')

% Create a subplot and plot the left wheel voltage ul - remind to define axis labels and title 
subplot(2,2,3)
plot(t,ul)
xlim([0 t(end)])
xlabel('time (s)')
ylabel('voltage (V)')
title('Left wheel voltage')

% Create a subplot and plot the left wheel velocity ur - remind to define axis labels and title 
subplot(2,2,4)
plot(t,ur)
xlim([0 t(end)])
xlabel('time (s)')
ylabel('voltage (V)')
title('Right wheel voltage')

% Add a title to the whole figure
sgtitle('Left and right wheel velocity and voltage')

%%



T_s = 0.01;
t = 0:T_s:100;                              % Define the vector of time (t = 0, 0.01, 0.02, ..., 100)
x = 2*sin(2*pi*0.1*t) + 4.5*tanh(0.1*t);    % Define a function of time (same lenght as t)

t_f = t(end);                               % Final time
X = timeseries(x,t,'name','X');             % Put the data in a "timeseries" object

G_n = [0 1 1];	% Transfer function numerator (fill these in)
G_d = [1 0.12 1];	% Transfer function denominator (fill these in)

plot(X)

%% Run Simulink model and plot
% Save the output that contains all signals in Simulink (should be in the 
% same folder)
% e.g. out = sim('My_Model');

% Save Y_1..Y_5 obtained from Simulink in arrays
% e.g. Y_1 = out.Y_1;
Y_1 = out.Y_1;
Y_2 = out.Y_2;
Y_3 = out.Y_3;
Y_4 = out.Y_4;
Y_5 = out.Y_5;

% plot(Y_1)
% plot(Y_2)
% plot(Y_3)
% plot(Y_4)
% plot(Y_5)

%% Plotting
% Set some properties for plotting (optional)
set(0,'DefaultTextInterpreter','latex');
set(0,'DefaultAxesFontSize',20);
set(0,'DefaultLineLineWidth', 2);

figure(1);

figure(2);

figure(3);

figure(4);

figure(5);
