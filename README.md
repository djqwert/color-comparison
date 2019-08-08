# Color comparison
Project and realization of a neuro-fuzzy system for color comparison

The aim is to design and develop a neural network-based system that compares a master color to a copy, for example let us consider a master color and an industrial process that prints copies of the master. The more accurate the process, the more similar each copy is to the master. The target of neural network is to measure how similar master and copies are.

# Dataset

The dataset is made up of 1269 reflectance spectra. Each spectrum is related to a master color and is measured with 1 nm step, ranging from 380 nm to 800 nm. This results into 421 samples for each spectrum. 
The file provided (dataset.m) is a MATLAB file that contains two matrices named spectra and coordinates, whose structure is as follows:
- spectra: 421×1269 matrix where each column corresponds to a color patch, and each row to one of the 421 samples of the reflectance curve of that color patch;
- coordinates: 6×1269 matrix where each column corresponds to a color patch, rows from 1 to 3 contain the RGB coordinates in the order, and rows from 4 to 6 contain the Lab coordinates in the order. The color coordinates are calculated using D65 light source.

# Reproducing masters

One way to generate "synthetic" copies of a master color is to add noise to its spectral reflectance curve.

# How to represent colors
Represent a color in terms of specific features that can be found by means of feature extraction and feature selection techniques applied to the corresponding reflectance curve in spectra.

# Comparing colors

When dealing with printing processes, the color of each copy must be as close as possible to that of the master.
In order to objectively compare a copy to a master, a neural network is designed and trained to measure the difference between two similar colors. From an operational point of view, the network takes as input the representations of a master color and of a copy, and returns their color difference in ΔE CIE.
an observer perceives a difference between two colors only when they have a value of ∆E that is much higher than 3.5. It is the case, e.g., of the dark region of the CIE Lab color space. Further imprecisions of ∆E occur in the blue-violet region. So, to solve this problem is developed a fuzzy inference system to fix the deficiencies of CIE Lab.
