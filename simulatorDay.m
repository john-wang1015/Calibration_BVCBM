function xx = simulatorDay(param,sim_params,length_of_simulation)

xx = zeros(1,length_of_simulation);
x = clib.Model.FullSimulation(param(1), param(2), param(3), param(4), sim_params.page, sim_params.startingvol, length_of_simulation);

for i = 1:length_of_simulation
    xx(i) = x(i);
end