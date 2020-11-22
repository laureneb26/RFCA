%% PART 5
f=7*10^9;%frequency of interest
c=3*10^8;%celerity
N=4;%number of array elements
lambda=3/70;
k=2*pi/lambda;
d=0.5*lambda;%distance between array elements
phi=0:2*pi/1000:2*pi;
theta=0:2*pi/1000:2*pi;

%% section 2: Normalized AF plot as a function of phi and theta

AF2=0.5.*(cos(cos(phi).*pi/2)+cos(cos(phi).*1.5.*pi)); %theta=const=90deg
AF3=0.5.*(cos(sin(theta).*pi/2)+cos(sin(theta).*1.5.*pi)); %phi=const=0deg
figure;
subplot 211; 
plot(phi,AF2); title('UNdirectedArray Factor as a function of phi: Cartesian representation'); xlabel('phi');
grid on;subplot 212;
polar(phi,AF2); title('UNdirected Array Factor as a function of phi: Polar representation');

figure;
subplot 211; 
plot(phi,AF3); title('UNdirectedArray Factor as a function of theta: Cartesian representation'); xlabel('theta');
grid on;subplot 212;
polar(phi,AF3); title('UNdirected Array Factor as a function of theta: Polar representation');

%% section 3 directivity calculation
f=@(t,ph) sin(t).*((0.5.*(cos(sin(t).*cos(ph).*pi/2)+cos(sin(t).*cos(ph).*1.5.*pi))).^2);
Prad=integral2(f,0,pi/2,0,2*pi);
D=2*pi./Prad;

%% section 5 steer the beam to phi=20deg
deltaPhi=1.074;
psi=k*d*sin(theta)-deltaPhi;%theta=20deg=70=pi/9rad
AF4=0.5.*(cos(psi./2)+cos(1.5.*psi));
figure;
subplot 211; grid on;
plot(theta,AF4); title('Directed+ Normalized Array Factor, cartesian coordinates,beam to theta=20deg');
xlabel('theta[rad]'); ylabel('AF');
subplot 212;
polar(theta,AF4); title('Directed+ Normalized Array Factor, polar coordinates,beam to theta=20deg');
