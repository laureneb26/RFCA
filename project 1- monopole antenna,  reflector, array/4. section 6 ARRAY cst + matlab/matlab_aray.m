%% PART 6
f=8.1*10^9;%frequency of interest
c=3*10^8;%celerity
N=3;%number of array elements
lambda=0.037;
k=2*pi/lambda;
d=0.7*lambda;%distance between array elements
phi=0:2*pi/1000:2*pi;
theta=0:2*pi/1000:pi;%cylindrical coord theta=0->pi

%% section 2 normalized AF plot as a function of phi

deltaPhi=0;
psi=k*d*cos(phi)+deltaPhi;
AF=sin(N*psi/2)./N./sin(psi/2);
figure;
subplot 211; 
plot(phi,AF); title('UNdirectedArray Factor: Cartesian representation'); xlabel('phi');
grid on;subplot 212;
polar(phi,AF); title('UNdirected Array Factor: Polar representation');

%% section 3 directivity calculation

f=@(t,ph) sin(t).*((sin(N*k*d*cos(ph).*sin(t)/2)./N./sin(k*d*sin(t).*cos(ph)/2)).^2);
Prad=integral2(f,0,pi/2,0,2*pi);
D=2*pi./Prad;

%% section 5 steer the beam to phi=30deg
deltaPhi=3.809;
psi=k*d*cos(pi/6)*sin(theta)-deltaPhi;%phi=30deg=pi/6rad
AF2=sin(N*0.5*psi)./N./sin(0.5*psi);
figure;
subplot 211; grid on;
plot(theta,AF2); title('Directed+ Normalized Array Factor, cartesian coordinates,beam to phi=30deg=0,523599rad');
xlabel('theta'); ylabel('AF');
subplot 212;
polar(theta,AF2); title('Directed+ Normalized Array Factor, polar coordinates,beam to phi=30deg=0,523599rad');

