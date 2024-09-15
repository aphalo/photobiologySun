may21_jokioinen_spectra.zip package 
contains hourly simulated clear-sky (cmf100)
spectra for Jokioinen, May 21st (year 2000 but does
not really make sense to think of the year). 

Individual files are named from 
2000-05-21-cmf100-m20percO3-02.jok upto 
2000-05-21-cmf100-m20percO3-17.jok
and from 
2000-05-21-cmf100-normO3-02.jok upto 
2000-05-21-cmf100-normO3-17.jok

Here cmf100 means they are for cloud-free conditions, 
normO3 means typical climatological ozone, and m20percO3
means a total ozone column corresponding to 20 percent below 
this climatological value (m stands for minus). The last 
two digits indicate the hour, for example, the file 
2000-05-21-cmf100-normO3-17.jok is for the hour 17 UTC. NOTE, 
however, that this is true only to the integer hour, the 
exact time is available in the file itself (would be 17:52).  

Here is an example how the files look like: 

# 20000521 17:52:00 17:52:00 82.545
1072.27 2930 2.389593e-06
1072.27 2940 5.492432e-06
1072.27 2950 1.921234e-05
1072.27 2960 6.033401e-05
1072.27 2970 0.0001408178
1072.27 2980 0.0003502182
1072.27 2990 0.0007977079
1072.27 3000 0.001374587
1072.27 3010 0.003139143

The header (with #) shows the date (2000/05/21) and 
time (17:52:00 UTC) and solar zenith angle (82.545). 
Then follows the spectrum, the first column is some 
kind of time (maybe in minutes since start of day?), 
the second column is the wavelength (in Angstrom units, 
1 A = 0.1 nm), and the last column is the irradiance 
in mW/nm/m2. 

AL, Feb 2011 (simulations done earlier)


 
