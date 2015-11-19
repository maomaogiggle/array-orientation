function SINRplot(N,us,uj,p_j,p_n)
n = [0:N-1]';
lambda = 1;                %%wavelength
d = lambda/2;              %%interelement space
k0 = 2*pi/lambda;          %%wavenumber constant
alpha = [0:0.01*pi:pi];

for i = 1:length(alpha)
    p = d*[cos(alpha(i))*n,sin(alpha(i))*n];

    vs = exp(1i*k0*p*us');
    vj = exp(1i*k0*p*uj');
    jammer = sqrt(p_j)*vj;
    Rn = jammer*jammer' + p_n*eye(N);

    SINR(i) = vs'*inv(Rn)*vs;
end
SINR = SINR/(max(SINR));
plot(alpha*180/pi,10*log10(abs(SINR)),'k','linewidth',2);
xlabel('orientation angle of linear array:rad');
ylabel('CNR after STAP processing:dB');
end
