###################################################################################
##### Project: Affective Error Evaluation in OCD                              #####
##### Author:  Luisa Balzus                                                   #####
##### Usage:   Script for power analysis                                      #####
##### Input:   Behavioral data from a previous study (Balzus et al., 2021)    #####
##### Output:  Simulation-based power estimation                              #####
###################################################################################


# We estimated the power to detect the predicted affective priming effect after false alarms (FA; i.e., faster categorization of negative 
# compared to positive words) and its interaction with the error-related negativity (ERN) separately in both groups. Since distribution of 
# response time (RT) data is typically positively skewed, inverse transformed RT data and effect estimates were used in the simulations. 


# Clear environment
rm(list=ls())


# Turn off scientific notation
 options(scipen = 999)

 
# Load packages
 library(MASS)
 library(lme4)
 library(lmerTest)
 library(simr)
 library(emmeans)

 
# Define path
 path <- "C:/Users/Luisa/PhD/1_PhD_Project/6_ModERN_Behavioral_Study/5_Analyses/"

 
 # Load data from a previous study in which the same task was administered to a sample of 30 healthy participants (Balzus et al., 2021)
 datafiles <- list.files(path, pattern = "Data_Single_Trial") 
 for (datafile in datafiles){  
   filename <- paste0(path, datafile) 
   load(file = filename)}
 
 
 # Clean data: Exclude word and go/no-go responses with misses or wrong keys, outliers in word RT or go/no-go RT (incorrect word responses are excluded when the LMM is specified)
 data4mixedmodels_words <- data4mixedmodels[data4mixedmodels$outlier_words  == FALSE & data4mixedmodels$gng_resp  <= 46 & 
                                            data4mixedmodels$gng_invalid_rt == FALSE & data4mixedmodels$word_resp <= 54,]

 
 # Make categorical variables factors
 data4mixedmodels_words$response_type <- factor(data4mixedmodels_words$response_type, levels = c("SH", "FH", "FA", "CI"))
 data4mixedmodels_words$valence       <- factor(data4mixedmodels_words$valence)
 data4mixedmodels_words$subjectID     <- factor(data4mixedmodels_words$subjectID)
 data4mixedmodels_words$word          <- factor(data4mixedmodels_words$word)
 
 
 # Define contrasts
 contrasts(data4mixedmodels_words$response_type) <- contr.sdif(4)
 contrasts(data4mixedmodels_words$valence)       <- contr.sdif(2)
 
 
 # Add contrast as numerical covariates via model matrix 
 model_matrix <- model.matrix( ~ response_type * valence, data4mixedmodels_words)
 
 
 # Attach the model matrix to the to dataframe 
 data4mixedmodels_words[, (ncol(data4mixedmodels_words) + 1):(ncol(data4mixedmodels_words) + 8)] <- model_matrix
 
 
 # Assign descriptive names to the contrasts
 names(data4mixedmodels_words)[(ncol(data4mixedmodels_words) - 7):ncol(data4mixedmodels_words)] <- c("Grand Mean", "FH_minus_SH","FA_minus_FH","CI_minus_FA","pos_minus_neg", 
                                                                                                     "FH_minus_SH:pos_minus_neg", "FA_minus_FH:pos_minus_neg", "CI_minus_FA:pos_minus_neg")
 

 # Add dummy ERPs
 rnorm2 <- function(n, mean, sd) {mean + sd * scale(rnorm(n)) }  # function to produce random numbers with a fixed mean and SD
 data4mixedmodels_words$ERP <- rnorm2(nrow(data4mixedmodels_words), 0, 1)  # add mean of 0 and sd of 1 because predictor shall be z-standardized

 
# Specify model (estimates of fixed effects not related to the hypotheses and estimates of random effects were based on data from a previous study in which the same task was administered to a sample of 30 healthy participants (Balzus et al., 2021).)
 LMM_rt <- lmer(word_rt_inverse ~ (response_type/valence) * ERP + 
                   (1 + FH_minus_SH + FA_minus_FH + CI_minus_FA + pos_minus_neg + FH_minus_SH:pos_minus_neg + FA_minus_FH:pos_minus_neg + CI_minus_FA:pos_minus_neg || subjectID) + 
                   (1 + FH_minus_SH + FA_minus_FH || word), 
                data=data4mixedmodels_words[data4mixedmodels_words$word_accuracy == 1,], 
                REML = TRUE, 
                control = lmerControl(optimizer = "bobyqa"))

 
# Enter the expected effect size (regression beta weight) of the fixed effects in question: smallest effect of interest 
 FA <- 640.875       
 fixef(LMM_rt)["response_typeFA:valence2-1"] <- (-1000/(FA + 40)) - (-1000/(FA)) # 40 ms (unstandardized coefficient of 0.09) 
 fixef(LMM_rt)["response_typeFA:valence2-1:ERP"] <- -0.05 # coefficient of −0.05 


# Did it work?
 summary(LMM_rt)


# Run power analysis with 1,000 simulations
 powerSim(LMM_rt, test = fixed("response_typeFA:valence2-1", "t"),     seed = 127, nsim = 1000)  # 85.70% (83.38, 87.81) 
 powerSim(LMM_rt, test = fixed("response_typeFA:valence2-1:ERP", "t"), seed = 127, nsim = 1000)  # 86.70% (84.44, 88.74) 


# Errors during simulation? 
 lastResult()$errors


# Warnings?
 lastResult()$warnings 




################# Supplement After Data Collection: Power Analysis for 28 Participants ################# 

# Given that two patients were excluded with their matched control participants due to meeting preregistered exclusion criteria, the target sample 
# of 30 participants per group was not reached. However, conductance of the power analysis described above with 28 participants per group indicated 
# that the final sample still provided adequate power.


# Reduce data frame to 28 participants & clean data
 data4mixedmodels_words_28 <- data4mixedmodels[data4mixedmodels$outlier_words  == FALSE & data4mixedmodels$gng_resp  <= 46 & 
                                               data4mixedmodels$gng_invalid_rt == FALSE & data4mixedmodels$word_resp <= 54 & data4mixedmodels$subjectID < 29,]


# Make categorical variables factors
 data4mixedmodels_words_28$response_type <- factor(data4mixedmodels_words_28$response_type, levels = c("SH", "FH", "FA", "CI"))
 data4mixedmodels_words_28$valence       <- factor(data4mixedmodels_words_28$valence)
 data4mixedmodels_words_28$subjectID     <- factor(data4mixedmodels_words_28$subjectID)
 data4mixedmodels_words_28$word          <- factor(data4mixedmodels_words_28$word)


# Define contrasts
 contrasts(data4mixedmodels_words_28$response_type) <- contr.sdif(4)
 contrasts(data4mixedmodels_words_28$valence)       <- contr.sdif(2)


# Add contrast as numerical covariates via model matrix 
 model_matrix_28 <- model.matrix( ~ response_type * valence, data4mixedmodels_words_28) 


# Attach the model matrix to the to dataframe 
 data4mixedmodels_words_28[, (ncol(data4mixedmodels_words_28) + 1):(ncol(data4mixedmodels_words_28) + 8)] <- model_matrix_28


# Assign descriptive names to the contrasts
 names(data4mixedmodels_words_28)[(ncol(data4mixedmodels_words_28) - 7):ncol(data4mixedmodels_words_28)] <- c("Grand Mean", "FH_minus_SH","FA_minus_FH","CI_minus_FA","pos_minus_neg", 
                                                                                                              "FH_minus_SH:pos_minus_neg", "FA_minus_FH:pos_minus_neg", "CI_minus_FA:pos_minus_neg")

# Add dummy ERPs
 data4mixedmodels_words_28$ERP <- rnorm2(nrow(data4mixedmodels_words_28), 0, 1) # add mean of 0 and sd of 1 because predictor shall be z-standardized


# Specify model
 LMM_rt_28 <- lmer(word_rt_inverse ~ (response_type/valence) * ERP + 
                      (1 + FH_minus_SH + FA_minus_FH + CI_minus_FA + pos_minus_neg + FH_minus_SH:pos_minus_neg + FA_minus_FH:pos_minus_neg + CI_minus_FA:pos_minus_neg || subjectID) + 
                      (1 + FH_minus_SH + FA_minus_FH || word), 
                   data = data4mixedmodels_words_28[data4mixedmodels_words_28$word_accuracy == 1,], 
                   REML = TRUE, 
                   control = lmerControl(optimizer = "bobyqa"))


# Enter effect sizes of fixed effects
 fixef(LMM_rt_28) <- fixef(LMM_rt)


# Did it work?
 summary(LMM_rt_28)


# Run power analysis with 1,000 simulations
 powerSim(LMM_rt_28, test = fixed("response_typeFA:valence2-1", "t"),     seed = 127, nsim = 1000)  # 82.40% (79.90, 84.71)
 powerSim(LMM_rt_28, test = fixed("response_typeFA:valence2-1:ERP", "t"), seed = 127, nsim = 1000)  # 82.20% (79.69, 84.52)


# Errors during simulation? 
 lastResult()$errors


# Warnings?
 lastResult()$warnings 
