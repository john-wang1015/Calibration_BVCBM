function xx = simulatorSecondBip(param,sim_params,length_of_simulation)

xx = zeros(1,length_of_simulation);
x = clib.Model.FullSimulation_biphasic(param(1), param(2), param(3), param(4), sim_params.page, param(6), param(7), param(8), param(9), param(5), sim_params.startingvol, length_of_simulation*2);

j = 1;

for i = 1:length_of_simulation*2
    if mod(i,2) == 0
        xx(j) = x(i);
        j = j + 1;
    end
end
