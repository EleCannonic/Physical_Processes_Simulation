# Mars Retrograde

This is a project to simulate Mars retrograde. 

## Theory

Mars retrograde motion is an apparent phenomenon where Mars seems to move backward in the sky relative to the stars. 
This occurs because Earth, on its faster inner orbit, overtakes Mars, which orbits farther from the Sun. 
As Earth passes Mars, their relative positions make Mars appear to reverse its direction temporarily. 
Retrograde motion is an optical illusion caused by the differing orbital speeds and distances of the two planets, illustrating the heliocentric model of the solar system. 

## Data
From NASA's website, we can find the data of the trajectories we needed:
- Earth, major semi-axis, $1.496\times 10^{11}$ m
- Earth, eccentricity, $0.0167$
- Mars, major semi-axis, $2.279\times 10^{11}$ m
- Mars, eccentricity, $0.0934$
- Gravity constant, $6.67430\times 10^{-11}$
- Sun, mass, $1.9885\times 10^{30}$ kg
- Parameter, $\mu = GM$
- Average motion, $n = \sqrt{\mu/a^3}$
- Planar angle: $1.85^\degree$

## Equations
Select sun as the original point. Under polar coordinate, the trajectory is

$$r = \frac{a(1-e^2)}{1+e\cos\theta}$$

Since the angular momentum

$$l = mr^2\frac{\mathrm d\theta}{\mathrm d t} = m\sqrt{\mu a(1-e^2)}$$

$$\frac{\mathrm d\theta}{\mathrm d t} 
= \frac{\sqrt\mu}{a^{3/2}(1-e^2)^{3/2}}(1+e\cos\theta)^2
= \frac{n}{(1-e^2)^{3/2}}(1+e\cos\theta)^2
$$

## Algorithm

We use `ode45` solver to solve the equation. By uniformly sampling of time, matlab gets positions of both earth and mars 
at the same time. 

- Planar angle: To achieve this, a unit rotation matrix is used:

$$
\begin{pmatrix}
1 &             &              \\
  & \cos\varphi & -\sin\varphi \\
  & \sin\varphi & \cos\varphi  \\
\end{pmatrix}
$$

This matrix is applied on each position vector of mars, which is rotated an angle of $\varphi$.

- Retrograde detect: This is achieved by detecting the relative angle variation on the $xy$ projection.
  
  Find all time of $\mathrm d\theta/\mathrm dt < 0$, the result is the duration of time interval.

  Since matlab can only deal with discrete data, derivativeis replaced by differential.

## Authors
(Sorted alphabetically by last name)

Y. H. Chen

S. L. Li

Y. H. Ren

Y. H. Tang

Z. M. Wang

H. Y. Wang

D. X. Zhang

C. Y. Zhang

School of Physics and Astronomy, Shanghai Jiao Tong University




