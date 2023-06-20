function x = findOutBoundaryOva(part_vals_prop,prior)
    if part_vals_prop(1) <= prior.alpha(1) || part_vals_prop(1) >= prior.beta(1)
        x = 0;
    elseif part_vals_prop(2) <= prior.alpha(1) || part_vals_prop(2) >= prior.beta(1)
        x = 0;
    elseif part_vals_prop(3) <= prior.lower(1) || part_vals_prop(3) >= prior.upper(1)
        x = 0;
    elseif part_vals_prop(4) <= prior.lower(2) || part_vals_prop(4) >= prior.upper(2)
        x = 0;
    else
        x= 1;
    end
    
     