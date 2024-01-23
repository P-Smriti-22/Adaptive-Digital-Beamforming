clc; clear; close all;

% Initialization
N = 8; % Number of antennas in the array
N_Samples = 500;
N_Sim = 10000;

E = zeros(N_Sim,N_Samples);
W = zeros(N_Sim,N);
MU = zeros(N_Sim,N_Samples);

for j=1:N_Sim
    sigmap = 0.1; sigmaq = 0.2;
    sd = normrnd(0,sigmap,1,N_Samples) + 1i*normrnd(0,sigmaq,1,N_Samples); %SOI
    i1 = normrnd(0,sigmap,1,N_Samples) + 1i*normrnd(0,sigmaq,1,N_Samples);  %Interference 1
    i2 = normrnd(0,sigmap,1,N_Samples) + 1i*normrnd(0,sigmaq,1,N_Samples);  %Interference 2
    d = awgn(sd,10,'measured'); %Desired signal
    
    %Steering Vector
    DOA = [30 70 110]*(pi/180); %SOI, I1, I2 30 45 80
    psi = pi*sin(DOA); %d=lambda/2
    steer_vec_sd = zeros(N,1);
    steer_vec_i1 = zeros(N,1);
    steer_vec_i2 = zeros(N,1);
    for i=1:N
        steer_vec_sd(i) = exp(-1i*psi(1)*(i-1));
        steer_vec_i1(i) = exp(-1i*psi(2)*(i-1));
        steer_vec_i2(i) = exp(-1i*psi(3)*(i-1));
    end
    
    %Received Signal
    x = steer_vec_sd*sd + steer_vec_i1*i1 + steer_vec_i2*i2; %NxN_Samples
    
    % Weight Updation Variable Initialization
    w = zeros(N,1);
    e = zeros(N_Samples,1); del_e = zeros(N_Samples,1); inst_mean_e = zeros(N_Samples,1);
    sigma_square = zeros(N_Samples,1);
    y = zeros(N_Samples,1); 
    
    %VSS-LMS Weight Updation
    y(1) = w'*x(:,1);
    e(1) = d(1) - y(1);
    del_e(1) = abs(e(1));
    sigma_square(1) = x(:,1)'*x(:,1); 
    inst_mean_e(1)= del_e(1);
    mu = (exp(inst_mean_e(1))/(exp(inst_mean_e(1))+1))*((del_e(1)^2+sigma_square(1))^-1);
    MU(j,1) = mu;
    w = w + mu*conj(e(1)).*x(:,1); 
    for i=2:N_Samples
        y(i) = w'*x(:,i);
        e(i) = d(i) - y(i);
        del_e(i) = del_e(i-1) + abs(e(i));
        sigma_square(i) = x(:,i)'*x(:,i); 
        inst_mean_e(i)= del_e(i)/i;
        mu = (exp(inst_mean_e(i))/(exp(inst_mean_e(i))+1))*((del_e(i)^2+sigma_square(i))^-1);
        MU(j,i) = mu;
        w = w + mu*conj(e(i)).*x(:,i);          
    end
    E(j,:) = e;
    W(j,:) = w;    
end

MSE = (1/N_Sim)*sum(E.^2);
figure(1);
hold on;
plot(abs(MSE));
hold off;
grid on; 
title('Error v Iterations'); ylabel('Ensemble Average MSE'); xlabel('Iterations');

w = (1/N_Sim)*sum(W).';

% Array Beam Pattern
theta = (-180:1:180)*(pi/180);
response = zeros(N,length(theta));
for i = 1:N
response(i,:) = exp(-1i*(i-1)*pi*sin(theta));
end
R = w'*response;
figure(2);
hold on;
plot((theta*180/pi), 20*log10(abs(R))); 
hold off;
axis([0 180 -60 0]); grid on;
title('VSS-LMS: Beam Pattern'); ylabel('Magnitude (dB)'); xlabel('Angle of Arrival (Degrees)');

figure(3);
hold on;
plot(MU(400,:));
hold off;
grid on;
title('Step Size'); ylabel('Magnitude'); xlabel('Iterations');