clc;clear;
addpath("Model/");
load("Data/CancerDatasets.mat")

y = Pancreatic_data(1:32,3)';
%%
N = 1000; 
epsilon_final = 0; 
total_time = length(y);

a = 0.5; 
c = 0.01;
p_acc_min = 0.001;

prior.num_params = 9; 
prior.alpha = [0, 0];
prior.beta = [1, 1];
prior.lower = [0, 1];
prior.upper = [50, total_time*24];
prior.tau_low = 2;
prior.tau_upper = total_time-1;

prior.sampler = @() [unifrnd(prior.alpha,prior.beta),...
    unifrnd(prior.lower, prior.upper),...
    floor(unifrnd(prior.tau_low, prior.tau_upper)),...
    unifrnd(prior.alpha,prior.beta),...
    unifrnd(prior.lower, prior.upper),];

prior.pdf = @(theta_trans) [prod([unifpdf(theta_trans(1:2),prior.alpha,prior.beta),...
    unifpdf(theta_trans(3:4),prior.lower,prior.upper),...
    unifpdf(theta_trans(5),prior.lower,prior.upper),...
    unifpdf(theta_trans(6:7),prior.alpha,prior.beta),...
    unifpdf(theta_trans(8:9),prior.lower,prior.upper)])];

dist_func = @(obs,sim) [sum((log(obs) - log(sim)).^2)];

sim_params.page = 2;
sim_params.max_time = length(y);
sim_params.startingvol = y(1);

%%
[part_vals, part_sim, part_s, ~, ~, ~,dist_history,sims_history] = smc_abc_rw_par(y,sim_params,dist_func,prior,N,epsilon_final,a,c,p_acc_min,'pancreatic mouse 3');

