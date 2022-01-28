close all;
clear;
set(0,'DefaultFigureWindowStyle','docked')    
set(0,'DefaultLineLineWidth', 2);

numSteps=500;
t=0;
x=0;  
V=0;  
Vavg=0;

%(this runs verrrry slow)    
%m = 9.10938215e-31; % electron mass 
%q = 1.60217653e-19; % electron charge
%F=q*E;              % force on an electron due to an electric field   

dt = 1; % Time increment
afterCoeff=0; % Velocity after scattering
%afterCoeff=-0.25;
F=1;      % Force
m = 1;    % mass 

for k=2:numSteps    
    % Increment time
    t(k)=t(k-1)+dt;

    % Velocity increases due to force exerted by an electric field        
    V(k) = V(k-1) + F/m * dt;

    % Update average velocity
    Vavg(k)=mean(V);

    % Position increases by the velocity times time step    
    x(k) = x(k-1) + V(k) * dt + F/m+dt^2/2;

    % Chance of scattering, which drops velocity to zero or reflects the
    % electron
    if rand()<=0.05
        V(k)=V(k)*afterCoeff;
    end

    subplot(3,1,1);
    plot(t,V,"b"); hold on;       
    plot(t,Vavg,"go"); hold off;
    title("Drift Velocity: " + Vavg(k));
    xlabel("time");
    ylabel("velocity");

    subplot(3,1,2);
    plot(x,V,"g"); 
    xlabel("position");
    ylabel("velocity");

    subplot(3,1,3);
    plot(t,x,"r");   
    xlabel("time");
    ylabel("position");

    pause(0.00001)
end
