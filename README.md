# MATLAB Script for Obtaining the Roughness of the Cross-sectional Interfaces in SiC Monofilaments from SEM Images

Program: MATLAB R2022b by MathWorks

Type: MATLAB Live Editor/script (.mlx)

Packages required: Image processing Toolbox (MathWorks)

# Description
This is an implentation for analysing the cross-sections of SiC monofilaments in SEM images. The coating interfaces can be discerned from the difference in contrast between the monofilament components that have been imaged in BSE mode.

The main script to run is the CoatingsInterfacialRoughnessSEM_MATLAB_BaseScript.mlx. 
This script loads the SEM images stored as .TIF files with their associated metadata .txt file.

A bespoke MATLAB code was developed to extract the profiles of the interfaces from each of the obtained SEM micrographs. Detection and processing of the coating interfaces, named SiC-OLC and OLC-ILC interfaces, was carried out in the six main steps described in the thesis (_):

(a) initial SEM image in BSE mode;

(b) contrast enhancement by normalisation and de-noised image;

(c) initial image segmentation by a k-means clustering algorithm roughly into the different grey-level components of the image; 

(d) the resulting binary image selecting the objects with the same pixel intensity as the OLC layer; 

(e) Selection of the OLC and its re-segmentation from image from step (b) by the Fast-Marching Method, followed by morphological operations to clean the binary image; 

(f) the removal of the interior pixels to leave the one-pixel thick outline of the OLC.

# Functions and Other Scripts

There are several custom functions and scripts that are included called on in this script:

prepare_images.m - crops and rotates the images

FillLayer.m - BW image thresholiding, followed by binary image closing, fill holes and eroding function.

SiCLineRoughness_v2 -This function retrives the roughness parameters for the SiC-OLC (1st attempt).

BothLineRoughness_v2 - This function retrives the roughness parameters for both SiC-OLC (2nd attempt) and ILC-OLC. 

OutlineSplitter_v2 - This function seperates the two lines that outline the OLC  to the top line (ILC-OLC interface) and the bottom line (SiC-OLC interface).

Output_Analysis_v2.mlx - This live script reports the roughness parameters data for each SEM image analysed.
