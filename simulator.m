function x = simulator(param,sim_params,total_time)

x = zeros(1,total_time);

pf1 = clib.Model.SeedAndGrowToStartVolume(param(1),param(2),param(3),param(4), sim_params.page, sim_params.startingvol); 
pd1 = clib.Model.CreateNewParticle(param(1),param(2),param(3),param(4), sim_params.page, pf1);
for t = 1:param(5)
    pd1.SimulateOneDay(1);
    x(1,t) = pd1.TumourVolume();
end

pf2 = clib.Model.SeedAndGrowToStartVolume(param(6),param(7),param(8),param(9), sim_params.page, x(1,param(5))); 
pd2 = clib.Model.CreateNewParticle(param(6),param(7),param(8),param(9), sim_params.page, pf2);
for t = param(5)+1:total_time
    pd2.SimulateOneDay(1);
    x(1,t) = pd2.TumourVolume();
end  

end