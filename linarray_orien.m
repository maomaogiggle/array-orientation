
N = 5;                     %%number of antenna element
n = [0:(N-1)]';
lambda = 1;                %%wavelength
d = lambda/2;              %%interelement space
k0 = 2*pi/lambda;          %%wavenumber constant

%u-space for satellite and interference
thetas = 90*pi/180;
phis = 30*pi/180;
usx = cos(thetas)*cos(phis);
usy = cos(thetas)*sin(phis);
usz = sin(thetas);
us = [usx,usy];            
thetaj = 30*pi/180;
phij = 30*pi/180;
ujx = cos(thetaj)*cos(phij); 
ujy = cos(thetaj)*sin(phij);  
ujz = sin(thetaj);
uj = [ujx,ujy]; 

SNR = -20;                       %% snr is -20dB
JNR = 20;                        %% jnr is 20dB
p_j = 10^((JNR-SNR)/10);
p_n = 10^(-SNR/10);

%% DOA estimation of interference
[ux_est,uy_est] = DOAestimation(N,us,uj,p_j,p_n);

%% calculating the optimal array orientation
alpha = optimalorien (usx,usy,ujx,ujy,N);
pK = d*[cos(alpha(1))*n,sin(alpha(1))*n];

SINRplot(N,us,uj,p_j,p_n);            
SCCplot(N,us,uj);                     

% Beampatternplot(N,us,uj,p_j,p_n,phis);
% SINRloss = discrete_orien (pK,us,uj,N,p_j,p_n);
% plot([1:10],SINRloss,'kd:','linewidth',2);
% xlabel('number of discrete array orientations');
% ylabel('CNR loss with respect to the optimal orientation:dB');








