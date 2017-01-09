function [new_ms, selected_row1, selected_column1, selected_row2, selected_column2] = ...
                    newmicrostate(s_current, height, width)
new_ms = s_current;

selected_row1 = randi([2, height - 1]);
selected_column1 = randi([2, width - 1]);

selected_row2 = randi([2, height  - 1]);
selected_column2 = randi([2, width - 1]);

while selected_row2 == selected_row1 && selected_column2 == selected_column1
    % The tiles we have selected to interchange are the same
    % This need not be done as this does not affect the property of
    % detailed balance that is required by the Metropolis Sampler
    selected_row2 = randi([2, height - 1]);
    selected_column2 = randi([2, width - 1]);
end

temporary = new_ms(:, :, :,(selected_row1 - 1)*width + selected_column1);
new_ms(:, :, :, (selected_row1 - 1)*width + selected_column1) = ...
    new_ms(:, :, :, (selected_row2 - 1)*width + selected_column2);
 
new_ms(:, :, :, (selected_row2 - 1)*width + selected_column2) = temporary;
                        