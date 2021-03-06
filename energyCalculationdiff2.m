 function delta_e = energyCalculationdiff2(microstate, width, selected_row2, selected_column2, ...
                                    selected_row1, selected_column1)


    old_energy = 0;

    old_energy = old_energy + ...
        sqrt(mean(mean((double(microstate(1,:,:,(selected_row1-1)*width + selected_column1)) - ...
        double(microstate(end,:,:,(selected_row2-2)*width + selected_column2))).^2, 2)));

    old_energy = old_energy + ...
        sqrt(mean(mean((double(microstate(:,1,:,(selected_row1-1)*width + selected_column1)) - ...
        double(microstate(:,end,:,(selected_row2-1)*width + selected_column2 - 1))).^2, 1)));

    old_energy = old_energy + ...
        sqrt(mean(mean((double(microstate(:,end,:,(selected_row1-1)*width + selected_column1)) - ...
        double(microstate(:,1,:,(selected_row2-1)*width + selected_column2 + 1))).^2, 1)));

    old_energy = old_energy + ...
        sqrt(mean(mean((double(microstate(end,:,:,(selected_row1-1)*width + selected_column1)) - ...
        double(microstate(1,:,:,selected_row2*width + selected_column2))).^2, 2)));
    

    old_energy = old_energy + ...
        sqrt(mean(mean((double(microstate(1,:,:,(selected_row2-1)*width + selected_column2)) - ...
        double(microstate(end,:,:,(selected_row1-2)*width + selected_column1))).^2, 2)));

    old_energy = old_energy + ...
        sqrt(mean(mean((double(microstate(:,1,:,(selected_row2-1)*width + selected_column2)) - ...
        double(microstate(:,end,:,(selected_row1-1)*width + selected_column1 - 1))).^2, 1)));

    old_energy = old_energy + ...
        sqrt(mean(mean((double(microstate(:,end,:,(selected_row2-1)*width + selected_column2)) - ...
        double(microstate(:,1,:,(selected_row1-1)*width + selected_column1 + 1))).^2, 1)));

    old_energy = old_energy + ...
        sqrt(mean(mean((double(microstate(end,:,:,(selected_row2-1)*width + selected_column2)) - ...
        double(microstate(1,:,:,selected_row1*width + selected_column1))).^2, 2)));


    new_energy = 0;
    new_energy = new_energy + ...
        sqrt(mean(mean((double(microstate(1,:,:,(selected_row1-1)*width + selected_column1)) - ...
        double(microstate(end,:,:,(selected_row1-2)*width + selected_column1))).^2, 2)));

    new_energy = new_energy + ...
        sqrt(mean(mean((double(microstate(:,1,:,(selected_row1-1)*width + selected_column1)) - ...
        double(microstate(:,end,:,(selected_row1-1)*width + selected_column1 - 1))).^2, 1)));

    new_energy = new_energy + ...
        sqrt(mean(mean((double(microstate(:,end,:,(selected_row1-1)*width + selected_column1)) - ...
        double(microstate(:,1,:,(selected_row1-1)*width + selected_column1 + 1))).^2, 1)));

    new_energy = new_energy + ...
        sqrt(mean(mean((double(microstate(end,:,:,(selected_row1-1)*width + selected_column1)) - ...
        double(microstate(1,:,:,selected_row1*width + selected_column1))).^2, 2)));
    

    new_energy = new_energy + ...
        sqrt(mean(mean((double(microstate(1,:,:,(selected_row2-1)*width + selected_column2)) - ...
        double(microstate(end,:,:,(selected_row2-2)*width + selected_column2))).^2, 2)));

    new_energy = new_energy + ...
        sqrt(mean(mean((double(microstate(:,1,:,(selected_row2-1)*width + selected_column2)) - ...
        double(microstate(:,end,:,(selected_row2-1)*width + selected_column2 - 1))).^2, 1)));

    new_energy = new_energy + ...
        sqrt(mean(mean((double(microstate(:,end,:,(selected_row2-1)*width + selected_column2)) - ...
        double(microstate(:,1,:,(selected_row2-1)*width + selected_column2 + 1))).^2, 1)));

    new_energy = new_energy + ...
        sqrt(mean(mean((double(microstate(end,:,:,(selected_row2-1)*width + selected_column2)) - ...
        double(microstate(1,:,:,selected_row2*width + selected_column2))).^2, 2)));
    
    delta_e = old_energy - new_energy;