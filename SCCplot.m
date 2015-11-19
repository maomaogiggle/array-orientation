function SCCplot(N,us,uj)
n = [-(N-1)/2:(N-1)/2]';
lambda = 1;                %%wavelength
d = lambda/2;              %%interelement space
k0 = 2*pi/lambda;          %%wavenumber constant
alpha = [0:0.001*pi:pi];

for i = 1:length(alpha)
    p = d*[cos(alpha(i))*n,sin(alpha(i))*n];

    vs = exp(1i*k0*p*us');
    vj = exp(1i*k0*p*uj');

    alpha_sj(i) = vs'*vj/N;   
end
figure(2);
plot(alpha*180/pi,abs(alpha_sj),'k','linewidth',2);
xlabel('orientation angle of linear array:rad');
ylabel('Spatial Correlation Coefficient');
end