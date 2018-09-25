clc;
clear all;
close all;
 
Te = 0.5;
Tend = 100;
Tstep = 1;
 
saturation_limit = 0.5;
 
%simin.signals.values = [zeros(1,Tstep/Te) saturation_limit*ones(1,1+(Tend-Tstep)/Te)]';
%simin.time = (0:Te:Tend)';
 
simin = struct('signals',zeros(1+Tend/Te,1), 'time',(0:Te:Tend)');
simin.signals = struct('values',[zeros(Tstep/Te,1); saturation_limit*ones(1+(Tend-Tstep)/Te,1)]);
 
sim('ce1_1');
 
subplot(2,1,1);
plot(simout.Time, simout.Data, 'b');
hold on;
plot(simin.time, simin.signals.values, 'r');
grid;
title('Step Response');
xlabel 'Time [s]';
legend('response','step');
 
simin.signals.values = [saturation_limit zeros(1,Tend/Te)]';
sim('ce1_1')
 
subplot(2,1,2);
plot(simout.Time, simout.Data, 'color', [0, 0.5, 0]);
hold on;
plot(simin.time, simin.signals.values,'color', [1, 0.5, 0]);
grid;
title('Impulse Response');
xlabel 'Time [s]';
legend('response','impulse');

