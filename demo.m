% This function implements the simulations on low-coherence dictionary learning
% for sparse image pathes approximation reported in the following work:

%  Mostafa Sadeghi and Massoud Babaie-Zadeh,
%  Dictionary learning with low mutual coherence constraint,
%  Neurocomputing, vol. 407, pp. 163-174, September 2020.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Mostafa Sadeghi
%     Researcher, MULTSPEECH Team,
%     Inria, Nancy Grand-Est, France.
%     E-mail: mostafa.sadeghi@inria.fr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;close all;clc

Z = genpath(pwd);
addpath(Z);

% Set parameters

L=500;    % number of training signals
params.data = generate_training_signals(L);  % generate training signals
params.Tdata = 10; % number of non-zero coefficients in each sparse vector
params.dictsize = 256; % number of atoms
params.iternum = 10;  % number of DL iterations
params.exact = 0;
params.memusage = 'high';
params.dsp=0;
params.comperrdata=1;

params.initdict = odctndict(64,256,1); % initial dictionary (DCT)
D=params.initdict ;

[n,m]=size(D);
mu_min=sqrt((m-n)/(n*(m-1)));

mu_max=0.99;
K=20;
k=1:K;
MU=mu_min+(k-1)*(mu_max-mu_min)/(K-1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Low-coherence dictionary learning algorithms %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% IPR-DL

ipr_results=zeros(3,K);

params.itermu=100;

i=1;

for mut=MU

    params.mu0=mut;

    tic;[D1,g1,err1,ra1,rat1,mucd1] = IPR_DL(params,'i');t1=toc;

    ipr_results(1,i)=t1;
    ipr_results(2,i)=err1(end);
    ipr_results(3,i)=mucoh(D1);
    i=i+1;

    save(['IPR','_',num2str(mut),'.mat'],'err1','mucd1');
    save('IPR_results.mat','ipr_results');

end

%% BSC-DL

LAM=[1e-5:1:10,11:5:100,150:50:1000,1500:5000:100000,150000:50000:1000000];
K=length(LAM);
bsc_results=zeros(3,K);

params.itermu=50;

i=1;

for lam=LAM

    params.lam=lam;

    tic;[D2,g2,err2,ra2,rat2,mucd2] = BSC_DL(params,'i');t2=toc;

    bsc_results(1,i)=t2;
    bsc_results(2,i)=err2(end);
    bsc_results(3,i)=mucoh(D2);
    i=i+1;

    save(['BSC','_',num2str(lam),'.mat'],'err2','mucd2');
    save('BSC_results.mat','bsc_results');

end

%% CINC-DL

K=20;
cinc_results=zeros(3,K);

params.itermu=100;
params.muD=5e-2;  % 1/L_2
params.tol=0.05;
params.J=3;
params.c=0.85;

i=1;

for mut=MU

    params.mu0=mut;

    tic;[D3,g3,err3,ra3,rat3,mucd3] = CINC_DL(params,'i');t2=toc;

    cinc_results(1,i)=t3;
    cinc_results(2,i)=err3(end);
    cinc_results(3,i)=mucoh(D3);
    i=i+1;

    save(['CINC','_',num2str(mut),'.mat'],'err3','mucd3');
    save('CINC_results.mat','cinc_results');

end

%% RINC-DL

LAM=[1e-5:1:10,11:5:100,150:50:1000];
K=length(LAM);
rinc_results=zeros(3,K);

params.itermu=100;
params.muD=5e-2;  % 1/L_2
params.tol=0.05;
params.J=3;
params.c=0.85;

i=1;

for lam=LAM

    params.lam=lam;

    tic;[D4,g4,err4,ra4,rat4,mucd4] = RINC_DL(params,'i');t4=toc;

    rinc_results(1,i)=t4;
    rinc_results(2,i)=err4(end);
    rinc_results(3,i)=mucoh(D4);
    i=i+1;

    save(['RINC','_',num2str(lam),'.mat'],'err4','mucd4');
    save('RINC_results.mat','rinc_results');

end
