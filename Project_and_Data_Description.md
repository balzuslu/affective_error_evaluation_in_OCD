<!--
Project and Data Description
-->

## Project Overview
&nbsp;

-  In this preregistered study, we investigated the affective evaluation of errors and its relation to the error-related negativity (ERN) in patients with obsessive-compulsive disorder (OCD) and healthy individuals. Electroencephalogram (EEG) was recorded during an affective priming paradigm in which responses in a go/no-go task were followed by valence-based word categorization.

&nbsp;

## Procedure 
&nbsp;

- Participants performed a go/no-go task with an embedded word categorization task in which each go/no-go response was followed by categorization of a word.	
&nbsp;

- Go/no-go task:
	- A white upward- or downward-pointing arrow was presented, followed by a green or turquoise arrow that pointed in the same or opposite direction as the white arrow. Participants were instructed to respond by key press if the white arrow turned green and kept the same direction (go trial) and to withhold their response if it turned turquoise or changed its direction (no-go trial). 
	- Different response types were defined in the go/no-go task: 
		- fast hits (FH; correct responses to go stimuli below response time [RT] limit)
		- slow hits (SH; correct responses to go stimuli above RT limit)
		- inhibited responses (IR; correct inhibitions to no-go stimuli)
		- false alarms (FA; erroneous responses to no-go stimuli)	
&nbsp;

- Word categorization task:
	- After each go/no-go trial, an affective word was presented that participants were instructed to categorize as positive or negative.	
&nbsp;

- During the task, the EEG was recorded.
	- To quantify single-trial ERN and correct-response negativity (CRN), we computed mean amplitudes from 0 to 100 ms post-response (in the go/no-go task) at FCz.		
&nbsp;

- This study was part of a project on effects of transcranial direct current stimulation (tDCS) on error monitoring in OCD (Balzus et al., 2022) comprising one session with active and one with placebo stimulation in randomized counterbalanced order. Only data obtained after placebo stimulation were included in the present study.

&nbsp;

## Hypotheses 
&nbsp; 

- We expected that errors are evaluated as negative, such that after erroneous responses to no-go stimuli (false alarms), participants across groups would categorize negative words faster and more accurately than positive words (= affective priming effect).
&nbsp;

- Additionally, we assumed that strong negative evaluation of errors relates to increased ERN amplitudes, such that larger ERN amplitudes would be associated with larger response facilitation to negative compared to positive words after false alarms (i.e., a larger priming effect).
&nbsp;

- Moreover, we predicted that after correct responses to go stimuli, participants across groups would categorize positive words faster than negative words and that this response facilitation would be associated with the CRN.
&nbsp;

- With regard to group differences, we hypothesized that patients with OCD differ from healthy individuals in the affective evaluation of their errors.  

&nbsp;

## Preregistration
&nbsp;

- Hypotheses, experimental design, sample size, and analysis plan of this study were preregistered on the Open Science Framework (https://osf.io/j28hr/).

&nbsp;

## Data Description  
&nbsp;

### 'Single_Trial_Data.rda' 

&nbsp;

| VARIABLE                                      	| DESCRIPTION                                                                                                                                           	| VALUES                                                                                                                                                                                        	|
|:------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| participant_id                                    	| Participant identifier                                                                                                                                	| C_01 to C_30 and P_01 to P_30                                                                                                                                                                 	|
| group                                        	        | Participant group                                                                                                                                     	| HC = healthy control participant <br> OCD = patient with OCD                                                                                                                                  	|
| session                                    	        | Experimental session                                                                                                                                  	| T1 = first experimental session <br> T2 = second experimental session                                                                                                                         	|
| stimulation                                    	| Stimulation condition                                                                                                                                 	| verum = cathodal tDCS <br> sham = placebo tDCS                                                                                                                                                	|
| trial                                         	| Trial number within the task                                                                                                                          	| 1 to 516                                                                                                                                                                       			|
| gng_response_type                             	| Response type in the go/no-go task                                                                                                                    	| SH = slow hit <br> FH = fast hit <br> FA = false alarm <br> IR = inhibited response <br> miss = missing response in go trial <br> wrong_key = response made with a word categorization key    	|
| gng_rt                                        	| RT in the go/no-go task                                                                                                               			| RT in milliseconds <br> NAs for trials in which no response was made (IR, miss)                                                                                                               	|
| gng_rt_invalid                                	| Indication whether RT in the go/no-go task was < 100 ms or > 800 ms                                                                                   	| TRUE <br> FALSE <br> NAs for trials in which no response was made (IR, miss)                                                                                                                      	|
| gng_rt_log                                 	        | Log-transformed RT in the go/no-go task                                                                                                           		| log(RT) in milliseconds <br> NAs for trials in which no response was made (IR, miss)                                                                                                             	|
| word                                          	| Affective word presented in the word categorization task                                                                                              	| 60 German words (30 positive, 30 negative) from the Berlin Affective Word List Reloaded (Vo et al., 2009)                                                                                     	|
| word_valence                                  	| Valence of the affective word                                                                                                                         	| pos = positive <br> neg = negative                                                                                                                                                            	|
| word_accuracy                                 	| Correctness of the word categorization                                                                                                               		| correct = correct categorization <br> incorrect = incorrect categorization <br> miss = missing response <br> wrong_key = response made with the go/no-go key                                  	|
| word_rt                                       	| RT in the word categorization task                                                                                                                    	| RT in milliseconds <br> NAs for trials in which no response was made (miss)                                                                                                             		|
| word_rt_outlier                               	| Indication whether word categorization RT deviated more than three median absolute deviations from the individual condition-specific median 			| TRUE <br> FALSE <br> NAs for trials in which no response was made (miss)                                                                                                                         	|
| word_rt_log                               		| Log-transformed RT in the word categorization task                                                                                                	 	| log(RT) in milliseconds <br> NAs for trials in which no response was made (miss)                                                                                                                 	|
| MFN_0_100_FCz                                 	| Medial-frontal negativity (MFN; refers to ERN for errors and CRN for hits); response-locked ERP from 0-100 ms at electrode FCz                            	| Mean amplitude in microvolts <br> NAs for trials with EEG artifact                                                                                                                            	|
| MFN_artifact                                 		| Indication whether EEG artifact was present in the trial                                                                					| TRUE <br> FALSE                                                                                                                            								|

&nbsp;

### 'Trait_Data.rda' 

&nbsp;

| VARIABLE              				| DESCRIPTION                                                                                                   						| VALUES                                                																		|
|:------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| participant_id					| Participant identifier																	| C_01 to C_30 and P_01 to P_30                         																		|
| BDI-II	        				| Score on the Beck Depression Inventory-II (assessment of depressive symptom severity)										| 0 to 52 (questionnaire scale range: 0 to 63)																				|
| OCI-R	        					| Score on the Obsessive-Compulsive Inventory-Revised (assessment of obsessive-compulsive symptom severity)							| 0 to 45 (questionnaire scale range: 0 to 72)																				|
| PSWQ							| Score on the Penn State Worry Questionnaire (assessment of trait worry)											| 23 to 77 (questionnaire scale range: 16 to 80)																			|
| STAI trait						| Score on the State-Trait Anxiety Inventory (assessment of trait anxiety)											| 22 to 79 (questionnaire scale range: 20 to 80)																			|

&nbsp;

### 'response_locked_data_for_plots.csv'

&nbsp;

| VARIABLE              													| DESCRIPTION                                   					| VALUES                                                																		|
|:------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| participant_id														| Participant identifier                       						| C_01 to C_30 and P_01 to P_30                         																		|
| time	        														| Time sampling point within an EEG epoch						| -500 to 1000 ms in steps of 2 ms (locked to the go/no-go response)																	|
| condition	        													| Response type in the go/no-go task							| 1 = correct <br> 2 = incorrect																					|
| Fp1, Fp2, F9, F7, F3, Fz, F4, F8, F10, FC1, FCz, FC2, T7, C3, Cz, C4, T8, CPz, P7, P3, Pz, P4, P8, O1, O2, M1, IO1		| Electrode site 									| Mean amplitude in microvolts 																						|

&nbsp;

## References  

&nbsp;

Balzus, L., Klawohn, J., Elsner, B., Schmidt, S., Brandt, S. A., & Kathmann, N. (2022). Non-invasive brain stimulation modulates neural correlates of performance monitoring in patients with obsessive-compulsive disorder. *NeuroImage: Clinical, 35*, Article 103113. https://doi.org/10.1016/j.nicl.2022.103113 <br><br>
Vo, M. L., Conrad, M., Kuchinke, L., Urton, K., Hofmann, M. J., & Jacobs, A. M. (2009). The Berlin Affective Word List Reloaded (BAWL-R). *Behavior Research Methods, 41*(2), 534-538. https://doi.org/10.3758/BRM.41.2.534  
