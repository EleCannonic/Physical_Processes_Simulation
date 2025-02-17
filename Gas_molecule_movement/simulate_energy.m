function [energy_avg, energy_flu, num_in_region] = simulate_energy(num, box_size, dt, time_length, measure_region, T)
% input
%   - num: number of particle in the entire box,                                scalar
%   - box_size: size of the entire box,                                         1*3 vector
%   - dt: time interval which suppose no velocity change in this time interval, scalar
%   - time_length: total time length,                                           scalar
%   - measure_region: region to measure energy and number,                      1*6 vector, [xmin, ymin, zmin, xmax, ymax, zmax]
%   - T: temperature in Kelvin,                                                 scalar
% output
%   - energy_avg: average energy,                                    vector
%   - energy_flu: fluctuation,                                       vector
%   - num_in_region: number inside the measure region at each point, vector


    m = 4.65e-26;  % mass of Helium molecule
    kB = 1.38e-23; % Boltzman constant

    % set initial position and velocity
    sigma = sqrt(kB * T / m);
    init_position = rand(num, 3) .* box_size;
    velocity = randn(num, 3) .* box_size .* sigma;
    speed = sqrt(sum(velocity.^2, 2)); % speed for calculating energy

    % initializing
    energy = zeros(1, time_length);     
    energy_avg = zeros(1, time_length); 
    energy_flu = zeros(1, time_length);
    num_in_region = zeros(1, time_length);

    position = init_position;

    % implement time evolution
    for i = 1:(time_length/dt)
        % Update position
        position = position + velocity * dt;

        % Boundary collisions
        for j = 1:3
            % extract a dimension of position
            dir = position(:,j);
            logic0 = find(dir < 0);       
            logic1 = find(dir > box_size(j)); 
            
            % collision position update
            dir(logic0) = -dir(logic0);
            dir(logic1) = 2*box_size(j) - dir(logic1);

            % collision velocity update
            velocity(logic0,j) = -velocity(logic0,j);
            velocity(logic1,j) = -velocity(logic1,j);

            position(:,j) = dir;
        end

        % energy estimation
        % find index in region
        logic_in_region = all(position >= measure_region(1:3), 2) & ...
                          all(position <= measure_region(4:6), 2);
        
        % number and energy estimation
        num_in_region(i) = sum(logic_in_region);
        energy(i) = 1/2 * sum(speed(logic_in_region).^2);  % Exact energy

        energy_avg(i) = mean(energy(1:i));
        energy_flu(i) = sqrt(mean(energy(1:i).^2) - energy_avg(i).^2);
    end
end
