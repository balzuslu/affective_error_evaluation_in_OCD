## Content of this repository

This repository contains data and code for the manuscript "Affective Evaluation of Errors and Neural Error Processing in Obsessive-Compulsive Disorder" by Luisa Balzus, Franziska Jüres, Norbert Kathmann, and Julia Klawohn.  

&nbsp;
  
## Overview

In this preregistered study, we investigated the affective evaluation of errors and its relation to the error-related negativity (ERN) in patients with obsessive-compulsive disorder (OCD) and healthy individuals. 
Electroencephalogram was recorded during an affective priming paradigm in which responses in a go/no-go task were followed by valence-based word categorization. 
In this repository, we provide data and scripts used for statistical analyses and figure generation. For further information about the project and the data, please read the Project_and_Data_Description.md.

**For our project page with analysis code and results of statistical analyses please visit**
<https://balzuslu.github.io/affective_error_evaluation_in_OCD>  

&nbsp;

## Software Information

Analyses were conducted with R version 3.6.1 and R Studio version 1.2.5001.  

&nbsp;

## Data

- **Single_Trial_Data.rda**: The file 'Single_Trial_Data.rda' in the folder 'data' contains single-trial behavioral and EEG data used for statistical analyses (in .RData format). Information about data and variables are provided in the file 'Project_and_Data_Description.md'.  
To ensure that the participants’ privacy is respected, we can only share single-trial EEG data after preprocessing and epoching since our informed consent documents did not include the possibility of sharing the continuous raw EEG data openly.
- **Trait_Data.rda**: The file 'Trait_Data.rda' in the folder 'data' contains data on OCD-related characteristics used for statistical analyses (in .RData format). Information about data and variables are provided in the file 'Project_and_Data_Description.md'.
- **response_locked_data_for_plots.csv**: The file 'response_locked_data_for_plots.csv' in the folder 'data' contains data used for figure generation (in .csv format). Information about data and variables are provided in the file 'Project_and_Data_Description.md'.  

&nbsp;

## Analysis Scripts

Annotated analysis code is organized into separate R Markdown files:  

- **0_Project_and_Data_Description.Rmd**: This script generates an overview over the study and the data set.
- **1_Participants.Rmd**: This script generates an overview over demographic and clinical variables.
- **2_Go_No-Go.Rmd**: This script performs analysis of behavioral performance in the go/no-go task, including data cleaning, descriptive statistics, and (G)LMM analyses.
- **3_Word_Categorization.Rmd**: This script performs analysis of behavioral performance in the word categorization task, including data cleaning, descriptive statistics, and (G)LMM analyses.
- **4_ERP.Rmd**: This script performs EEG data analysis, including data cleaning, descriptive statistics, and LMM analyses.
- **5_Plots.Rmd**: This script generates figures.

The corresponding .html files display the output from running the R Markdown files in HTML format.  

&nbsp;

## Usage

To reproduce statistical analyses, download the source files, open the file 'OCD_error_evaluation.Rproj' and run `renv::restore()` to automatically install all required packages into the project library.




