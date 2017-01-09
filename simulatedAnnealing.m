file_name = 'shuffledImageEasy.mat';
load(file_name);
height = tilesX;
width = tilesY;

current_ms = RGBtilesShuffled;
temp = 150;
temp_minimum = 0.5;
zeta = 0.99;
while temp > temp_minimum
    accepted_better = 0;
    accepted_worse = 0;
    rejected = 0;
    for i = 1:10700
        [new_ms, row1, column1, row2, column2] = ...
            newmicrostate(current_ms, height, width);
        delta_E = energyCalculationdiff2(new_ms, width, row2, column2, row1, column1);
        if 0 < delta_E
            current_ms = new_ms;
            accepted_better = accepted_better + 1;
        else
            acceptance_probability = exp(delta_E/temp);
            if rand() < acceptance_probability
                current_ms = new_ms;
                accepted_worse = accepted_worse + 1;
            else
                rejected = rejected + 1;
            end
        end
    end
    temp = temp*zeta;
    temp
end


rearranged_state = uint8(zeros(l*tilesX,l*tilesY, 3));
tile_counter = 0;
tilecounter = 0;
for xTile = 1:tilesX
  for yTile = 1:tilesY
    tilecounter = tilecounter + 1;
    rearranged_state((xTile - 1)*l+1:xTile*l,(yTile - 1)*l+1:yTile*l, : ) = ...
      current_ms(:,:,:,tilecounter);
  end
end
figure(1); clf;
image(rearranged_state);
axis image;
        
                
                
        