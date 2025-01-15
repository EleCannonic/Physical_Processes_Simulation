function [retro_duration, retro_interval] = retro_detect(theta_rel, t)

dtheta_rel = diff(theta_rel) ./ diff(t)'; % unit rad/s

% find retrograde region：d(theta_rel)/dt < 0
retrograde_mask = dtheta_rel < 0;

% Marking the start and end points of retrograde intervals
retro_st_idx = find(diff([0, retrograde_mask]) == 1);
retro_end_idx = find(diff([retrograde_mask, 0]) == -1);

% calculate retrograde time duration
retro_duration = t(retro_end_idx(2:end)) - t(retro_st_idx(2:end));

% calculate retrograde time interval
retro_interval = diff(t(retro_st_idx(2:end)));
end
