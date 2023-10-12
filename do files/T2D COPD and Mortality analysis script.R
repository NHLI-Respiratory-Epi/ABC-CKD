# Packages installing
install.packages("data.table")
library (data.table)
install.packages("bit64")
library(bit64)
install.packages("dplyr")
install.packages("rtools42")
library(dplyr)
install.packages("tidyverse")
library(tidyverse)


# View the datasets and divide them into cohorts 
# Old cleaning was only based for those greater than 40
abc_ckd_cohort_all <- fread("Z:/Abdul/abc_ckd_cohort_all.csv")
View (abc_ckd_cohort_all)
cohort_g40 <- subset(abc_ckd_cohort_all, abc_ckd_cohort_all$age_jan2017>=40)
View(cohort_g40)
cohort_g40_COPD <- subset(cohort_g40, cohort_g40$copd_jan17==1)
View(cohort_g40_COPD)
cohort_g40_nCOPD <- subset(cohort_g40, cohort_g40$copd_jan17==0)
View(cohort_g40_nCOPD)

# Further cleaning of the cohorts (July 1, 2022)
# Will clean the cohort further to exclude those date_diabetes > Jan 1, 2017 and with Regstart date > Jan 1, 2016 and with Regend date < Jan 1, 2017

# Exclude date_diabetes > Jan 1, 2017
cohort_g40$date_diabetes <- as.Date(cohort_g40$date_diabetes,"%YYYY-%mm-%dd")
cohort_g40_date_diabetes <- subset(cohort_g40, date_diabetes <= "2017-01-01")
View(cohort_g40_date_diabetes)
str(cohort_g40_date_diabetes)


# Exclude Regstart date  > Jan 1, 2016
cohort_g40_date_diabetes$regstartdate <- as.Date(cohort_g40_date_diabetes$regstartdate,"%YYYY-%mm-%dd")
cohort_g40_date_diabetes_regstart <- subset(cohort_g40_date_diabetes, regstartdate <= "2016-01-01")
View(cohort_g40_date_diabetes_regstart)
str(cohort_g40_date_diabetes_regstart)


# Exclude Regend date > Jan 1, 2017
cohort_g40_date_diabetes_regstart$regenddate <- as.Date(cohort_g40_date_diabetes$regenddate,"%YYYY-%mm-%dd")
cohort_g40_cleaned <- subset(cohort_g40_date_diabetes_regstart, regenddate >= "2017-01-01")
View(cohort_g40_cleaned)
str(cohort_g40_cleaned)
# New cohort is called cohort_g40_cleaned

# Further cleaning to include only ONS data (20/07/2022)
cohort_g40_cleaned_1 <- subset(cohort_g40_cleaned, cohort_g40_cleaned$death_e == 1)
View(cohort_g40_cleaned_1)
str(cohort_g40_cleaned_1)

# Remove those with missing smoking status (20/07/2022)
cohort_g40_cleaned_f <- cohort_g40_cleaned_1
cohort_g40_cleaned_f <- subset(cohort_g40_cleaned_1, !is.na(smokstatus))
View(cohort_g40_cleaned_f)


# Descriptive statistics of new cleaned cohort
cohort_g40_cleaned_f_COPD <- subset(cohort_g40_cleaned_f, cohort_g40_cleaned_f$copd_jan17==1)
View(cohort_g40_cleaned_f_COPD)
cohort_g40_cleaned_f_nCOPD <- subset(cohort_g40_cleaned_f, cohort_g40_cleaned_f$copd_jan17==0)
View(cohort_g40_cleaned_f_nCOPD)

#Gender
table(cohort_g40_cleaned_f$gender)
sum(cohort_g40_cleaned_f$gender == 1)
sum(cohort_g40_cleaned_f$gender == 2)
table(cohort_g40_cleaned_f_COPD$gender)
table(cohort_g40_cleaned_f_nCOPD$gender)


#Agegroup
table(cohort_g40_cleaned_f_nCOPD$age_group_jan2017)
table(cohort_g40_cleaned_f_COPD$age_group_jan2017)
table(cohort_g40_cleaned_f$age_group_jan2017)


#IMD
table(cohort_g40_cleaned_f$imd2015_5)
sum(is.na(cohort_g40_cleaned_f$imd2015_5))
table(cohort_g40_cleaned_f_COPD$imd2015_5)
sum(is.na(cohort_g40_cleaned_f_COPD$imd2015_5))
table(cohort_g40_cleaned_f_nCOPD$imd2015_5)
sum(is.na(cohort_g40_cleaned_f_nCOPD$imd2015_5))

#BMI
cohort_g40_cleaned_f_COPD$bmi_cat_2 <- cut(cohort_g40_cleaned_f_COPD$bmi_comp_1, breaks=c(-Inf,18.5,25,30,35,40,Inf),labels=c("underweight","normal","pre-obesity","obesity I","obesity II", "obesity III"))
table(cohort_g40_cleaned_f_COPD$bmi_cat_2)
cohort_g40_cleaned_f_nCOPD$bmi_cat_2 <- cut(cohort_g40_cleaned_f_nCOPD$bmi_comp_1, breaks=c(-Inf,18.5,25,30,35,40,Inf),labels=c("underweight","normal","pre-obesity","obesity I","obesity II", "obesity III"))
table(cohort_g40_cleaned_f_nCOPD$bmi_cat_2)
cohort_g40_cleaned_f$bmi_cat_2 <- cut(cohort_g40_cleaned_f$bmi_comp_1, breaks=c(-Inf,18.5,25,30,35,40,Inf),labels=c("underweight","normal","pre-obesity","obesity I","obesity II", "obesity III"))
table(cohort_g40_cleaned_f$bmi_cat_2)
sum(is.na(cohort_g40_cleaned_f_nCOPD$bmi_cat_2))
sum(is.na(cohort_g40_cleaned_f_COPD$bmi_cat_2))
sum(is.na(cohort_g40_cleaned_f$bmi_cat_2))

# Smoking status
table(cohort_g40_cleaned_f$smokstatus)
table(cohort_g40_cleaned_f_COPD$smokstatus)
table(cohort_g40_cleaned_f_nCOPD$smokstatus)
sum(is.na(cohort_g40_cleaned_f$smokstatus))
sum(is.na(cohort_g40_cleaned_f_COPD$smokstatus))
sum(is.na(cohort_g40_cleaned_f_nCOPD$smokstatus))

# Presence of other diseases
#Obstructive Pulmonary

table(cohort_g40_cleaned$asthma_jan17)
table(cohort_g40_cleaned$bronchiectasis_jan17)
cohort_g40_cleaned$asthma_bronchiectasis_jan17 <- ifelse(cohort_g40_cleaned$asthma_jan17 == "1",1,ifelse(cohort_g40_cleaned$bronchiectasis_jan17 == "1",1,0))
table(cohort_g40_cleaned$asthma_bronchiectasis_jan17)
sum(is.na(cohort_g40_cleaned$asthma_bronchiectasis_jan17)) #none is missing

table(cohort_g40_cleaned_COPD$asthma_jan17)
table(cohort_g40_cleaned_COPD$bronchiectasis_jan17)
cohort_g40_cleaned_COPD$asthma_bronchiectasis_jan17 <- ifelse(cohort_g40_cleaned_COPD$asthma_jan17 == "1",1,ifelse(cohort_g40_cleaned_COPD$bronchiectasis_jan17 == "1",1,0))
table(cohort_g40_cleaned_COPD$asthma_bronchiectasis_jan17)

table(cohort_g40_cleaned_nCOPD$asthma_jan17)
table(cohort_g40_cleaned_nCOPD$bronchiectasis_jan17)
cohort_g40_cleaned_nCOPD$asthma_bronchiectasis_jan17 <- ifelse(cohort_g40_cleaned_nCOPD$asthma_jan17 == "1",1,ifelse(cohort_g40_cleaned_nCOPD$bronchiectasis_jan17 == "1",1,0))
table(cohort_g40_cleaned_nCOPD$asthma_bronchiectasis_jan17)

# Presence of asthma alone
table(cohort_g40_cleaned_f$asthma_jan17)
table(cohort_g40_cleaned_f_COPD$asthma_jan17)
table(cohort_g40_cleaned_f_nCOPD$asthma_jan17)
sum(is.na(cohort_g40_cleaned_f$asthma_jan17)) 

# Presence of bronchiectasis alone
table(cohort_g40_cleaned_f$bronchiectasis_jan17)
table(cohort_g40_cleaned_f_COPD$bronchiectasis_jan17)
table(cohort_g40_cleaned_f_nCOPD$bronchiectasis_jan17)
sum(is.na(cohort_g40_cleaned_f$bronchiectasis_jan17)) 

#CVD disease (HF and other general cardiovascular diseases)

table(cohort_g40_cleaned_f$hf_jan17)
table(cohort_g40_cleaned_f$cvd_general_jan17)
cohort_g40_cleaned_f$cvd_hf_general_jan17 <- ifelse(cohort_g40_cleaned_f$cvd_general_jan17 == "1",1,ifelse(cohort_g40_cleaned_f$hf_jan17 == "1",1,0))
table(cohort_g40_cleaned_f$cvd_hf_general_jan17)

table(cohort_g40_cleaned_f_COPD$hf_jan17)
table(cohort_g40_cleaned_f_COPD$cvd_general_jan17)
cohort_g40_cleaned_f_COPD$cvd_hf_general_jan17 <- ifelse(cohort_g40_cleaned_f_COPD$cvd_general_jan17 == "1",1,ifelse(cohort_g40_cleaned_f_COPD$hf_jan17 == "1",1,0))
table(cohort_g40_cleaned_f_COPD$cvd_hf_general_jan17)

table(cohort_g40_cleaned_f_nCOPD$hf_jan17)
table(cohort_g40_cleaned_f_nCOPD$cvd_general_jan17)
cohort_g40_cleaned_f_nCOPD$cvd_hf_general_jan17 <- ifelse(cohort_g40_cleaned_f_nCOPD$cvd_general_jan17 == "1",1,ifelse(cohort_g40_cleaned_f_nCOPD$hf_jan17 == "1",1,0))
table(cohort_g40_cleaned_f_nCOPD$cvd_hf_general_jan17)

#ckd stage
table(cohort_g40_cleaned_f$ckd)
table(cohort_g40_cleaned_f_nCOPD$ckd)
table(cohort_g40_cleaned_f_COPD$ckd)
sum(is.na(cohort_g40_cleaned_f$ckd))
sum(is.na(cohort_g40_cleaned_f_nCOPD$ckd))
sum(is.na(cohort_g40_cleaned_f_COPD$ckd))

# Medications
table(cohort_g40_cleaned_f_nCOPD$mras_jan17)
table(cohort_g40_cleaned_f_COPD$mras_jan17)
table(cohort_g40_cleaned_f$mras_jan17)

table(cohort_g40_cleaned_f_nCOPD$lipid_lowering_drugs_jan17)
table(cohort_g40_cleaned_f_COPD$lipid_lowering_drugs_jan17)
table(cohort_g40_cleaned_f$lipid_lowering_drugs_jan17)

table(cohort_g40_cleaned_f_nCOPD$oral_diuretics_jan17)
table(cohort_g40_cleaned_f_COPD$oral_diuretics_jan17)
table(cohort_g40_cleaned_f$oral_diuretics_jan17)

table(cohort_g40_cleaned_f_nCOPD$calciumchannelblockers_jan17)
table(cohort_g40_cleaned_f_COPD$calciumchannelblockers_jan17)
table(cohort_g40_cleaned_f$calciumchannelblockers_jan17)

table(cohort_g40_cleaned_f_nCOPD$betablockers_jan17)
table(cohort_g40_cleaned_f_COPD$betablockers_jan17)
table(cohort_g40_cleaned_f$betablockers_jan17)

table(cohort_g40_cleaned_f_nCOPD$arbs_jan17)
table(cohort_g40_cleaned_f_COPD$arbs_jan17)
table(cohort_g40_cleaned_f$arbs_jan17)

table(cohort_g40_cleaned_f_nCOPD$acei_jan17)
table(cohort_g40_cleaned_f_COPD$acei_jan17)
table(cohort_g40_cleaned_f$acei_jan17)

#Outcomes descriptives
# Death_e is linked and dead is actual death outcome recorded
table(cohort_g40_cleaned_f$death_e)
table(cohort_g40_cleaned_f$dead)
table(cohort_g40_cleaned_f_COPD$death_e)
table(cohort_g40_cleaned_f_COPD$dead)
table(cohort_g40_cleaned_f_nCOPD$death_e)
table(cohort_g40_cleaned_f_nCOPD$dead)

# Kidney failure
table(cohort_g40_cleaned_f$kidney_failure)
table(cohort_g40_cleaned_f_COPD$kidney_failure)
table(cohort_g40_cleaned_f_nCOPD$kidney_failure)

# Respiratory causes of death
table(cohort_g40_cleaned_f$resp_death)
table(cohort_g40_cleaned_f_COPD$resp_death)
table(cohort_g40_cleaned_f_nCOPD$resp_death)

# Cardiovascular causes of death
table(cohort_g40_cleaned_f$cvd_death)
table(cohort_g40_cleaned_f_COPD$cvd_death)
table(cohort_g40_cleaned_f_nCOPD$cvd_death)

# KM statistics and curves on cleaned dataset

install.packages("survival")
install.packages("ggplot")

library(survival)
library(ggplot2)

#For overall cohort
cohort_g40_cleaned_f$enter_date <- as.Date(cohort_g40_cleaned_f$enter_date,"%YYYY-%mm-%dd")
cohort_g40_cleaned_f$exit_date <- as.Date(cohort_g40_cleaned_f$exit_date,"%YYYY-%mm-%dd")
cohort_g40_cleaned_f$followup_time <- cohort_g40_cleaned_f$exit_date - cohort_g40_cleaned_f$enter_date
table(cohort_g40_cleaned_f$followup_time)

filter(cohort_g40_cleaned_f,followup_time<0) %>%nrow()

f1 <- survfit(Surv(followup_time, dead) ~ 1, data = cohort_g40_cleaned_f)
names(f1)
plot(survfit(Surv(followup_time, dead) ~ 1, data = cohort_g40_cleaned_f), xlab="Days", ylab = "Overall survival probability")


followup_time_pos <- cohort_g40_cleaned_f$followup_time
followup_time_pos[followup_time_pos < 0] <- NA
followup_time_pos
followup_time_posnew <- na.omit(followup_time_pos)
followup_time_posnew
f1 <- survfit(Surv(followup_time_pos, dead) ~ 1, data = cohort_g40_cleaned_f)
plot(survfit(Surv(followup_time_pos, dead) ~ 1, data = cohort_g40_cleaned_f), xlab="Days", ylab = "Overall survival probability")
summary(f1, times = c(0,365,730,1094))

# For COPD cohort
cohort_g40_cleaned_f_COPD$enter_date <- as.Date(cohort_g40_cleaned_f_COPD$enter_date,"%YYYY-%mm-%dd")
cohort_g40_cleaned_f_COPD$exit_date <- as.Date(cohort_g40_cleaned_f_COPD$exit_date,"%YYYY-%mm-%dd")
cohort_g40_cleaned_f_COPD$followup_time <- cohort_g40_cleaned_f_COPD$exit_date - cohort_g40_cleaned_f_COPD$enter_date
table(cohort_g40_cleaned_f_COPD$followup_time)
filter(cohort_g40_cleaned_f_COPD,followup_time<0) %>%nrow()

followup_time_pos <- cohort_g40_cleaned_f_COPD$followup_time
followup_time_pos[followup_time_pos < 0] <- NA
followup_time_pos
followup_time_posnew <- na.omit(followup_time_pos)
followup_time_posnew
f2 <- survfit(Surv(followup_time_pos, dead) ~ 1, data = cohort_g40_cleaned_f_COPD)
plot(survfit(Surv(followup_time_pos, dead) ~ 1, data = cohort_g40_cleaned_f_COPD), xlab="Days", ylab = "Overall survival probability")
summary(f2, times = c(0,365,730,1094))

# For nCOPD cohort
cohort_g40_cleaned_f_nCOPD$enter_date <- as.Date(cohort_g40_cleaned_f_nCOPD$enter_date,"%YYYY-%mm-%dd")
cohort_g40_cleaned_f_nCOPD$exit_date <- as.Date(cohort_g40_cleaned_f_nCOPD$exit_date,"%YYYY-%mm-%dd")
cohort_g40_cleaned_f_nCOPD$followup_time <- cohort_g40_cleaned_f_nCOPD$exit_date - cohort_g40_cleaned_f_nCOPD$enter_date
table(cohort_g40_cleaned_f_nCOPD$followup_time)
filter(cohort_g40_cleaned_f_nCOPD,followup_time<0) %>%nrow()

followup_time_pos <- cohort_g40_cleaned_f_nCOPD$followup_time
followup_time_pos[followup_time_pos < 0] <- NA
followup_time_pos
followup_time_posnew <- na.omit(followup_time_pos)
followup_time_posnew
f3 <- survfit(Surv(followup_time_pos, dead) ~ 1, data = cohort_g40_cleaned_f_nCOPD)
plot(survfit(Surv(followup_time_pos, dead) ~ 1, data = cohort_g40_cleaned_f_nCOPD), xlab="Days", ylab = "Overall survival probability")
summary(f3, times = c(0,365,730,1094))

#the 3 plots are found in lines 242, 258 and 274 and you have to run the codes before them
#the 3 KM statistics are found in lines 243, 259 and 275

cohort_g40_cleaned_f$COPDstatus <- as.factor(cohort_g40_cleaned_f$copd_jan17)
followup_time_pos <- cohort_g40_cleaned_f$followup_time
followup_time_pos[followup_time_pos < 0] <- NA
followup_time_pos
f4 <- survfit(Surv(followup_time_pos, dead) ~ COPDstatus, data = cohort_g40_cleaned_f)
plot(f4)
survdiff(Surv(followup_time_pos, dead) ~ COPDstatus, rho=0, data = cohort_g40_cleaned_f)
library(ggplot2)
library(survminer)
ggsurvplot(f4, risk.table = TRUE, risk.table.y.text.col = TRUE,legend.title="COPD status", legend.labs= c("non-COPD","COPD"))
ggsurvplot(f4, xlim=c(0,1094), xlab="Day",  break.time.by= 365, legend.title="COPD status", legend.labs= c("non-COPD","COPD"))

ggsurvplot(f4,legend.title="COPD status", legend.labs= c("non-COPD","COPD"))
# colored plots of KM are found in previous 289


# KM colored plots (specific-cause mortality)

cohort_g40_cleaned_f$COPDstatus <- as.factor(cohort_g40_cleaned_f$copd_jan17)
followup_time_pos <- cohort_g40_cleaned_f$followup_time
followup_time_pos[followup_time_pos < 0] <- NA
followup_time_pos
f5 <- survfit(Surv(followup_time_pos, resp_death) ~ COPDstatus, data = cohort_g40_cleaned_f)
plot(f5)
survdiff(Surv(followup_time_pos, resp_death) ~ COPDstatus, rho=0, data = cohort_g40_cleaned_f)
library(ggplot2)
library(survminer)
ggsurvplot(f5, legend.title="COPD status", legend.labs= c("non-COPD","COPD"))
ggsurvplot(f5, risk.table = TRUE, risk.table.y.text.col = TRUE, legend.title="COPD status", legend.labs= c("non-COPD","COPD"))
ggsurvplot(f5, xlim=c(0,1094), xlab="Day", break.time.by= 365, legend.title="COPD status", legend.labs= c("non-COPD","COPD"))


cohort_g40_cleaned_f$COPDstatus <- as.factor(cohort_g40_cleaned_f$copd_jan17)
followup_time_pos <- cohort_g40_cleaned_f$followup_time
followup_time_pos[followup_time_pos < 0] <- NA
followup_time_pos
f6 <- survfit(Surv(followup_time_pos, cvd_death) ~ COPDstatus, data = cohort_g40_cleaned_f)
plot(f6)
survdiff(Surv(followup_time_pos, cvd_death) ~ COPDstatus, rho=0, data = cohort_g40_cleaned_f)
library(ggplot2)
library(survminer)
ggsurvplot(f6, legend.title="COPD status", legend.labs= c("non-COPD","COPD"))
ggsurvplot(f6, risk.table = TRUE, risk.table.y.text.col = TRUE, legend.title="COPD status", legend.labs= c("non-COPD","COPD"))
ggsurvplot(f6,  xlim=c(0,1094), xlab="Day", risk.table = TRUE, risk.table.y.text.col = TRUE, break.time.by= 365, legend.title="COPD status", legend.labs= c("non-COPD","COPD"))


# Running adjusted cox models (for dead outcome)

# Crude rates- only looking at the exposure which is COPD status (unadjusted) 

cox_exp_cohort_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17, data = cohort_g40_cleaned_f)
summary(cox_exp_cohort_g40_cleaned_f)
#Highly significant findings: exp(coef) is 1.53678- which is 54% increase in hazard ratio of COPD as compared to non-COPD (p-value= 2*10^-16). Confidence interval is narrow (0.065)
cox.zph(cox_exp_cohort_g40_cleaned_f)
# Law of proportional assumption hazards is violated by exposure of COPD status (p=0.0053)
plot(cox.zph(cox_exp_cohort_g40_cleaned_f))
cox_exp_cohort_g40_cleaned_plot <- plot(survfit(cox_exp_cohort_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Crude unadjusted model of COPD status on mortality")

# Adjusted for age as continuous (age_jan2017)

cox_exp_age_cohort_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_jan2017, data = cohort_g40_cleaned_f)
summary(cox_exp_age_cohort_g40_cleaned_f)
# a 42% increase in hazard ratio of COPD as compared to non-COPD when adjusted for age (significant p-value)
cox.zph(cox_exp_age_cohort_g40_cleaned_f)
# Law of proportional assumption hazards is violated by age (p= <1*10^-15)
plot(cox.zph(cox_exp_age_cohort_g40_cleaned_f))
cox_exp_age_cohort_g40_cleaned_plot <- plot(survfit(cox_exp_age_cohort_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age adjusted model of COPD status on mortality")


# Adjusted for age and gender
cox_exp_age_gender_cohort_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_jan2017 + gender, data = cohort_g40_cleaned_f)
summary(cox_exp_age_gender_cohort_g40_cleaned_f)
#  a 41% increase in hazard ratio of COPD as compared to non-COPD when adjusted for age and gender (significant p-value)
cox.zph(cox_exp_age_gender_cohort_g40_cleaned_f)
# Law of proportional assumption hazards is violated by age primarily
plot(cox.zph(cox_exp_age_gender_cohort_g40_cleaned_f))
cox_exp_age_gender_cohort_g40_cleaned_plot <- plot(survfit(cox_exp_age_gender_cohort_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age and Sex adjusted model of COPD status on mortality")

# Adjusted for age, gender and smoking status
# change smoking status from integer to categorical by the as.factor
cohort_g40_cleaned_f$smokstatus <- as.factor(cohort_g40_cleaned_f$smokstatus)
cox_exp_age_gender_ss_cohort_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_jan2017 + gender + smokstatus, data = cohort_g40_cleaned_f)
summary(cox_exp_age_gender_ss_cohort_g40_cleaned_f)
# Hazard ratio dropped to 1.37
cox.zph(cox_exp_age_gender_ss_cohort_g40_cleaned_f)
# Law of proportional assumptions hazard mainly violated by age primarily.
cox_exp_age_gender_ss_cohort_g40_cleaned_plot_f <- plot(survfit(cox_exp_age_gender_ss_cohort_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age, Sex and Smoking status adjusted model of COPD status on mortality")

# Adjusted for age, gender,smoking status and BMI (18/07/2022)
# BMI into as.factor
cohort_g40_cleaned_f$bmi_cat_2 <- as.factor(cohort_g40_cleaned_f$bmi_cat_2)
cox_exp_age_gender_ss_bmi_cohort_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_jan2017 + gender + smokstatus + bmi_cat_2, data = cohort_g40_cleaned_f)
summary(cox_exp_age_gender_ss_bmi_cohort_g40_cleaned_f)
# Hazard ratio is roughly 1.36
cox.zph(cox_exp_age_gender_ss_bmi_cohort_g40_cleaned_f)
# Law of proportional assumptions hazard violated by age and BMI categories. 
cox_exp_age_gender_ss_bmi_cohort_g40_cleaned_plot_f <- plot(survfit(cox_exp_age_gender_ss_bmi_cohort_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age, Sex, moking status and BMI adjusted model of COPD status on mortality")


# Adjusted for age, gender, smoking status, BMI and IMD
cohort_g40_cleaned_f$imd2015_5 <- as.factor(cohort_g40_cleaned_f$imd2015_5)
cox_exp_age_gender_ss_bmi_imd_cohort_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_jan2017 + gender + smokstatus + bmi_cat_2 + imd2015_5, data = cohort_g40_cleaned_f)
summary(cox_exp_age_gender_ss_bmi_imd_cohort_g40_cleaned_f)
# Hazard ratio is 1.35
cox.zph(cox_exp_age_gender_ss_bmi_imd_cohort_g40_cleaned_f)
# Law of proportional assumptions hazard still violated but improved with IMD. 
cox_exp_age_gender_ss_bmi_imd_cohort_g40_cleaned_plot_f <- plot(survfit(cox_exp_age_gender_ss_imd_cohort_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age, Sex, Smoking status, BMI & IMD adjusted model of COPD status on mortality")

# Adjusted for age. gender, SS, BMI, IMD, prior Asthma  
cox_exp_age_gender_ss_bmi_imd_asth_cohort_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_jan2017 + gender + smokstatus + bmi_cat_2 + imd2015_5 + asthma_jan17, data = cohort_g40_cleaned_f)
summary(cox_exp_age_gender_ss_bmi_imd_asth_cohort_g40_cleaned_f)
# Hazard ratio is 1.343
cox.zph(cox_exp_age_gender_ss_bmi_imd_obs_cohort_g40_cleaned_f)
# Law of proportional hazard violated by age primarily.
cox_exp_age_gender_ss_bmi_imd_obs_cohort_g40_cleaned_plot_f <- plot(survfit(cox_exp_age_gender_ss_bmi_imd_obs_cohort_g40_cleaned_f), ylim=c(.45,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age, Sex, Smoking status, BMI, IMD & Prior obstructive disease adjusted model of COPD status on mortality")

# Adjusted for age. gender, SS, BMI, IMD, prior asthma and CVD disease (final model)
cox_exp_final_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_jan2017 + gender + smokstatus + bmi_cat_2 + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
summary(cox_exp_final_g40_cleaned_f, times=c(0,365,730,1094))
# Hazard ratio is 1.30
cox.zph(cox_exp_final_g40_cleaned_f)
# Law of proportional hazard violated by age and BMI primarily and prior CVD status secondarily.
cox_exp_final_g40_cleaned_plot_f <- plot(survfit(cox_exp_final_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age, Sex, Smoking status, IMD, BMI, Prior obstructive & CVD disease adjusted model of COPD status on mortality")

# Change age into a categorical variable
cohort_g40_cleaned_f$age_group_jan2017 <- as.factor(cohort_g40_cleaned_f$age_group_jan2017)
cox_exp_agec_final_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_group_jan2017 + gender + smokstatus + bmi_cat_2 + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
summary(cox_exp_agec_final_g40_cleaned_f)
#Hazard ratio is 1.28
cox.zph(cox_exp_agec_final_g40_cleaned_f)
# Law of proportional hazard is still violated when categorizing age.
cox_exp_agec_final_g40_cleaned_plot_f <- plot(survfit(cox_exp_agec_final_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age, Sex, Smoking status, IMD, Prior obstructive & CVD disease adjusted model of COPD status on mortality")

# Divide cvd general into hf and cvd 
cox_exp_agec_cvdc_final_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_group_jan2017 + gender + bmi_cat_2 + smokstatus + imd2015_5 + asthma_jan17 + cvd_general_jan17 + hf_jan17, data = cohort_g40_cleaned_f)
summary(cox_exp_agec_cvdc_final_g40_cleaned_f)
# Hazard ratio is 1.26
cox.zph(cox_exp_agec_cvdc_final_g40_cleaned_f)
# Law of proportional hazard is still violated when splitting back the variables into cvd and hf.
cox_exp_agec_cvdc_final_g40_cleaned_plot_f <- plot(survfit(cox_exp_agec_cvdc_final_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age, Sex, Smoking status, IMD, Prior obstructive & CVD disease adjusted model of COPD status on mortality")

# Stratify by age in the final model
cox_exp_ages_final_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + strata(age_group_jan2017) + gender + bmi_cat_2 + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
summary(cox_exp_ages_final_g40_cleaned_f)
# Hazard ratio is 1.27
cox.zph(cox_exp_ages_final_g40_cleaned_f)
# Law of proportional hazards is improved when stratified by age. 
cox_exp_ages_final_g40_cleaned_plot <- plot(survfit(cox_exp_ages_final_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age stratified final adjusted model of COPD status on mortality")

#Stratify by age and cvd disease in the final model
cox_exp_ages_cvds_final_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + strata(age_group_jan2017) + gender + smokstatus + bmi_cat_2 + imd2015_5 + asthma_jan17 + strata(cvd_hf_general_jan17), data = cohort_g40_cleaned_f)
summary(cox_exp_ages_cvds_final_g40_cleaned_f)
# Hazard ratio is 1.27
cox.zph(cox_exp_ages_cvds_final_g40_cleaned_f)
# Law of proportional hazards is violated when stratified by age and CVD status 
cox_exp_ages_cvds_final_g40_cleaned_plot <- plot(survfit(cox_exp_ages_cvds_final_g40_cleaned), ylim=c(.35,1), xlab="Days", mark.time=F, ylab="Probability of death",col=c(1,2,4), main="Age and prior-CVD stratified final adjusted model of COPD status on mortality")

# Stratify by cvd disease only 
cox_exp_cvds_final_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + age_group_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + strata(cvd_hf_general_jan17), data = cohort_g40_cleaned_f)
summary(cox_exp_cvds_final_g40_cleaned_f)
# Hazard ratio is 1.29
cox.zph(cox_exp_cvds_final_g40_cleaned_f)
# Law of proportional hazards is  violated when stratified by CVD status (global p-value = 1.8^10-11)

# stratify by CVD, age and BMI 
cox_exp_cvds_ages_bmis_final_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ copd_jan17 + strata(age_group_jan2017) + strata(bmi_cat_2) + gender + smokstatus + imd2015_5 + asthma_jan17 + strata(cvd_hf_general_jan17), data = cohort_g40_cleaned_f)
summary(cox_exp_cvds_ages_bmis_final_g40_cleaned_f)
# Hazard ratio is 1.27 
cox.zph(cox_exp_cvds_ages_bmis_final_g40_cleaned_f)
# Law of proportional hazards is not violated when you stratify for those three variables.

# For graphical purposes split the prior CVD'ers and the non CVDers in your model
# try to stratify by COPD only
cox_exp_copds_final_g40_cleaned_f <- coxph(Surv(followup_time_pos, dead) ~ strata(copd_jan17) + age_group_jan2017 + gender + bmi_cat_2 + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
summary(cox_exp_copds_final_g40_cleaned_f)
cox_exp_copds_final_g40_cleaned_plot_f <- plot(survfit(cox_exp_copds_final_g40_cleaned_f), ylim=c(.35,1), xlab="Days", mark.time=FALSE, ylab="Probability of death",col=c("black", "red"), main="COPD stratified final adjusted model of COPD status on mortality")
legend("topright", c("non-COPD","COPD"), lty= c("solid","solid"), col = c("black","red") )
install.packages("survminer")
library(survminer)
library(survival)
library(ggplot2)
library(ggpubr)
install.packages("ggsurvplot")
# Fitting it to a KM curve?!?! Most likely unnecessary
fit <- coxph(Surv(followup_time_pos,dead) ~ copd_jan17, data=cohort_g40_cleaned_f)
ggsurvplot(surv_fit(fit, data = cohort_g40_cleaned), data = cohort_g40_cleaned_f)


# Fitting a Poisson regression based on yearly intervals

cohort_g40_cleaned_y1_f <- survSplit(Surv(followup_time, dead) ~., data=cohort_g40_cleaned_new, cut=c(0,364), episode="interval")
pois_cohort_g40_cleaned_y1 <- glm(dead ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + bmi_cat_2 + asthma_jan17 + cvd_hf_general_jan17 + factor(interval)-1, family = poisson(link = "log"), data = cohort_g40_cleaned)
summary(pois_cohort_g40_cleaned_y1_f)

cohort_g40_cleaned_y2 <- survSplit(Surv(followup_time, dead) ~., data=cohort_g40_cleaned_new, cut=c(365,729), episode="interval")
pois_cohort_g40_cleaned_y2 <- glm(dead ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + bmi_cat_2 + asthma_bronchiectasis_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned)  
summary(pois_cohort_g40_cleaned_y2)

cohort_g40_cleaned_y3 <- survSplit(Surv(followup_time, dead) ~., data=cohort_g40_cleaned_new, cut=c(730,1094), episode="interval")
pois_cohort_g40_cleaned_y3 <- glm(dead ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + bmi_cat_2 + asthma_bronchiectasis_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned)  
summary(pois_cohort_g40_cleaned_y3)


table(cohort_g40_cleaned_f$followup_time)
followup_time_pos[followup_time_pos < 0] <- NA
followup_time_posnew <- na.omit(followup_time_pos)

cohort_g40_cleaned_new <- subset(cohort_g40_cleaned_f, followup_time>0)
View(cohort_g40_cleaned_new)
str(cohort_g40_date_diabetes_regstart)


## Poisson for dead variable 
# Poisson adjusted
pois_cohort_g40_cleaned_f <- glm(dead ~ copd_jan17 + age_jan2017 + gender + bmi_cat_2 + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_cohort_g40_cleaned_f, times=c(0,365,730,1094))
summary(pois_cohort_g40_cleaned_f, times=c(365,729))
summary(pois_cohort_g40_cleaned_f, times=c(730,1094))
m1 <- pois_cohort_g40_cleaned_f

# To get the 95% CI
install.packages("sandwich")
library(sandwich)

m1 <- pois_cohort_g40_cleaned_f
cov.m1 <- vcovHC(m1, type="HC0")
std.err.m1 <- sqrt (diag(cov.m1))
r.est.m1 <- cbind(Estimate= coef(m1), "Robust SE"= std.err.m1, "Pr(>|z|)" = 2*pnorm(abs(coef(m1)/std.err.m1), lower.tail = FALSE), LL= coef(m1)-1.96*std.err.m1, UL= coef(m1)+1.96*std.err.m1)
view(r.est.m1)

# Poisson crude 
pois_crude_cohort_g40_cleaned_f <- glm(dead ~ copd_jan17 , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_crude_cohort_g40_cleaned_f, times=c(0,365,730,1094))

m2 <- pois_crude_cohort_g40_cleaned_f
cov.m2 <- vcovHC(m2, type="HC0")
std.err.m2 <- sqrt (diag(cov.m2))
r.est.m2 <- cbind(Estimate= coef(m2), "Robust SE"= std.err.m2, "Pr(>|z|)" = 2*pnorm(abs(coef(m2)/std.err.m2), lower.tail = FALSE), LL= coef(m2)-1.96*std.err.m2, UL= coef(m2)+1.96*std.err.m2)
view(r.est.m2)

# Poisson stepwise (27/07/2022)

model2_cohort_g40_cleaned_f <- glm(dead ~ copd_jan17  + age_jan2017 + gender + imd2015_5  , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(model2_cohort_g40_cleaned_f, times=c(0,365,730,1094))

m3 <- model2_cohort_g40_cleaned_f
cov.m3 <- vcovHC(m3, type="HC0")
std.err.m3 <- sqrt (diag(cov.m3))
r.est.m3 <- cbind(Estimate= coef(m3), "Robust SE"= std.err.m3, "Pr(>|z|)" = 2*pnorm(abs(coef(m3)/std.err.m3), lower.tail = FALSE), LL= coef(m3)-1.96*std.err.m3, UL= coef(m3)+1.96*std.err.m3)
view(r.est.m3)


model3_cohort_g40_cleaned_f <- glm(dead ~ copd_jan17  + age_jan2017 + gender + imd2015_5 + smokstatus + bmi_cat_2  , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(model3_cohort_g40_cleaned_f, times=c(0,365,730,1094))

m4 <- model3_cohort_g40_cleaned_f
cov.m4 <- vcovHC(m4, type="HC0")
std.err.m4 <- sqrt (diag(cov.m4))
r.est.m4 <- cbind(Estimate= coef(m4), "Robust SE"= std.err.m4, "Pr(>|z|)" = 2*pnorm(abs(coef(m4)/std.err.m4), lower.tail = FALSE), LL= coef(m4)-1.96*std.err.m4, UL= coef(m4)+1.96*std.err.m4)
view(r.est.m4)

model4_cohort_g40_cleaned_f <- glm(dead ~ copd_jan17  + age_jan2017 + gender + imd2015_5 + smokstatus + bmi_cat_2 + asthma_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(model4_cohort_g40_cleaned_f, times=c(0,365,730,1094))

m5 <- model4_cohort_g40_cleaned_f
cov.m5 <- vcovHC(m5, type="HC0")
std.err.m5 <- sqrt (diag(cov.m5))
r.est.m5 <- cbind(Estimate= coef(m5), "Robust SE"= std.err.m5, "Pr(>|z|)" = 2*pnorm(abs(coef(m5)/std.err.m5), lower.tail = FALSE), LL= coef(m5)-1.96*std.err.m5, UL= coef(m5)+1.96*std.err.m5)
view(r.est.m5)


# Adding COPD interaction with time
pois_cohort_g40_cleaned2_f <- glm(dead ~ copd_jan17 + copd_jan17*followup_time + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_cohort_g40_cleaned2_f)
# COPD_jan17 changed from 0.20 to 0.17 & no significant evidence of interaction (p-value= 0.18)

# Adding COPD interaction with BMI
pois_cohort_g40_cleaned3_f <- glm(dead ~ copd_jan17 + copd_jan17*bmi_cat_2 + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_cohort_g40_cleaned3_f)
# COPD changed from -.20 to 0.19 and no significant interaction with BMI

# Poisson plot
pois_exp_copds_final_g40_cleaned_plot_f <- plot(pois_cohort_g40_cleaned_f)


# Comparing Hazards from cox and Poisson (for dead)
# 0.21 estimate from poisson -> exp to 1.23 (23 % hazard increase)
# 0.268 from cox -> exp to 1.31 (31% hazard increase)




## Poisson for cvd death variable 
# Poisson adjusted
pois_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + bmi_cat_2 + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
summary(pois_cohort_g40_cleaned_cvddeath_f, times=c(365,729))
summary(pois_cohort_g40_cleaned_cvddeath_f, times=c(730,1094))

model5_cvd_cohort_g40_cleaned_f <- pois_cohort_g40_cleaned_cvddeath_f

m5c <- model5_cvd_cohort_g40_cleaned_f
cov.m5c <- vcovHC(m5c, type="HC0")
std.err.m5c <- sqrt (diag(cov.m5c))
r.est.m5c <- cbind(Estimate= coef(m5c), "Robust SE"= std.err.m5c, "Pr(>|z|)" = 2*pnorm(abs(coef(m5c)/std.err.m5c), lower.tail = FALSE), LL= coef(m5c)-1.96*std.err.m5c, UL= coef(m5c)+1.96*std.err.m5c)
view(r.est.m5c)










# Poisson crude 
pois_crude_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_crude_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
# Estimate is 0.212 -> expoentiated becomes 1.236 -> 23.6 percent increase in hazard (significant)

model1_cvd_cohort_g40_cleaned_f <- pois_crude_cohort_g40_cleaned_cvddeath_f

m1c <- model1_cvd_cohort_g40_cleaned_f
cov.m1c <- vcovHC(m1c, type="HC0")
std.err.m1c <- sqrt (diag(cov.m1c))
r.est.m1c <- cbind(Estimate= coef(m1c), "Robust SE"= std.err.m1c, "Pr(>|z|)" = 2*pnorm(abs(coef(m1c)/std.err.m1c), lower.tail = FALSE), LL= coef(m1c)-1.96*std.err.m1c, UL= coef(m1c)+1.96*std.err.m1c)
view(r.est.m1c)


# Poisson stepwise 






# Adding COPD interaction with time
pois_cohort_g40_cleaned2_cvddeath_f <- glm(cvd_death ~ copd_jan17 + copd_jan17*followup_time + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_cohort_g40_cleaned2_cvddeath_f)
# no significant evidence of interaction (p-value= 0.72)

# Adding COPD interaction with BMI
pois_cohort_g40_cleaned3_cvddeath_f <- glm(cvd_death ~ copd_jan17 + copd_jan17*bmi_cat_2 + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_cohort_g40_cleaned3_cvddeath_f)
# obesity type ii minimally interaction 

# Poisson plot
pois_exp_copds_final_g40_cleaned_plot_cvddeath_f <- plot(pois_cohort_g40_cleaned_cvddeath_f)

# Poisson stepwise adjusting for the model

# Adjust for BMI 
pois_bmi_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 +  bmi_cat_2 , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_bmi_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
# Estimate is 0.217 -> expoentiated becomes 1.242 -> 24.2 percent increase in hazard (significant)
# BMI is non-significant 

# Adjust for prior CVD
pois_priorcvd_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 +  cvd_hf_general_jan17 , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_priorcvd_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
# when adjusting for prior CVD the estimate becomes insignificant 

# Adjust for ss
pois_ss_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 +  smokstatus , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_ss_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
# Estimate became 0.1917 -> exponentiated becomes 1.211 -> 21.1 percent increase in hazard (significant)

# Adjust for age and gender 
pois_age_gender_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 +  age_jan2017 + gender , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_age_gender_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
# Estimate changed to 0.1119 -> exponentiated becomes 1.118 -> 11.8 percent increase in hazard (significant)

# Adjusted for age, gender and IMD 
pois_age_gender_imd_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 +  age_jan2017 + gender + imd2015_5, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_age_gender_imd_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
# Estimate changed to 0.1107 -> exponentiated becomes 1.117 -> 11.7 percent increase in hazard (significant)

model2_cvd_cohort_g40_cleaned_f <- pois_age_gender_imd_cohort_g40_cleaned_cvddeath_f

m2c <- model2_cvd_cohort_g40_cleaned_f
cov.m2c <- vcovHC(m2c, type="HC0")
std.err.m2c <- sqrt (diag(cov.m2c))
r.est.m2c <- cbind(Estimate= coef(m2c), "Robust SE"= std.err.m2c, "Pr(>|z|)" = 2*pnorm(abs(coef(m2c)/std.err.m2c), lower.tail = FALSE), LL= coef(m2c)-1.96*std.err.m2c, UL= coef(m2c)+1.96*std.err.m2c)
view(r.est.m2c)


# Adjusted for asthma
pois_asth_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 +  asthma_jan17 , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_asth_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
# Estimate is 0.2335 -> exponentiated becomes 1.263 -> 26.3 percent increase in hazard (significant)

# Adjusted for everything except prior cvd
pois_exceptcvd_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + bmi_cat_2 + smokstatus + imd2015_5 + asthma_jan17 , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_exceptcvd_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
# Estimate decrease to 0.006712 to 1.00673 -> 0.67 percent increase (moderately significant )

cohort_g40_cleaned_f_underweight < cohort_g40_cleaned_f %>% filter(bmi == "underweight")

pois_exceptcvd_cohort_g40_cleaned_cvddeath_f <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 , family = poisson(link = "log"), data = cohort_g40_cleaned_f_underweight)
summary(pois_exceptcvd_cohort_g40_cleaned_cvddeath_f, times=c(0,365,730,1094))
# Estimate decrease to 0.006712 to 1.00673 -> 0.67 percent increase (moderately significant )

model4_cvd_cohort_g40_cleaned_f <- pois_exceptcvd_cohort_g40_cleaned_cvddeath_f

m4c <- model4_cvd_cohort_g40_cleaned_f
cov.m4c <- vcovHC(m4c, type="HC0")
std.err.m4c <- sqrt (diag(cov.m4c))
r.est.m4c <- cbind(Estimate= coef(m4c), "Robust SE"= std.err.m4c, "Pr(>|z|)" = 2*pnorm(abs(coef(m4c)/std.err.m4c), lower.tail = FALSE), LL= coef(m4c)-1.96*std.err.m4c, UL= coef(m4c)+1.96*std.err.m4c)
view(r.est.m4c)


# Model 3 (27/07/2022)

model3_cvd_cohort_g40_cleaned_f <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + bmi_cat_2 + smokstatus + imd2015_5, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(model3_cvd_cohort_g40_cleaned_f, times=c(0,365,730,1094))

m3c <- model3_cvd_cohort_g40_cleaned_f
cov.m3c <- vcovHC(m3c, type="HC0")
std.err.m3c <- sqrt (diag(cov.m3c))
r.est.m3c <- cbind(Estimate= coef(m3c), "Robust SE"= std.err.m3c, "Pr(>|z|)" = 2*pnorm(abs(coef(m3c)/std.err.m3c), lower.tail = FALSE), LL= coef(m3c)-1.96*std.err.m3c, UL= coef(m3c)+1.96*std.err.m3c)
view(r.est.m3c)



# Prior CVD or HF conditions change the adjusted estimate to a non-significant.



## Poisson for resp death variable 
# Poisson adjusted
pois_cohort_g40_cleaned_respdeath_f <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + bmi_cat_2 + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_cohort_g40_cleaned_respdeath_f, times=c(0,365,730,1094))
## Huge hazard association of COPD and resp death

m5r <- pois_cohort_g40_cleaned_respdeath_f
cov.m5r <- vcovHC(m5r, type="HC0")
std.err.m5r <- sqrt (diag(cov.m5r))
r.est.m5r <- cbind(Estimate= coef(m5r), "Robust SE"= std.err.m5r, "Pr(>|z|)" = 2*pnorm(abs(coef(m5r)/std.err.m5r), lower.tail = FALSE), LL= coef(m5r)-1.96*std.err.m5r, UL= coef(m5r)+1.96*std.err.m5r)
view(r.est.m5r)

# Poisson crude 
pois_crude_cohort_g40_cleaned_respdeath_f <- glm(resp_death ~ copd_jan17 , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_crude_cohort_g40_cleaned_respdeath_f, times=c(0,365,730,1094))
# Hazard ratio even larger due to resp death 

m1r <- pois_crude_cohort_g40_cleaned_respdeath_f
cov.m1r <- vcovHC(m1r, type="HC0")
std.err.m1r <- sqrt (diag(cov.m1r))
r.est.m1r <- cbind(Estimate= coef(m1r), "Robust SE"= std.err.m1r, "Pr(>|z|)" = 2*pnorm(abs(coef(m1r)/std.err.m1r), lower.tail = FALSE), LL= coef(m1r)-1.96*std.err.m1r, UL= coef(m1r)+1.96*std.err.m1r)
view(r.est.m1r)


# Poisson stepwise (28/07/2022)

model2_cohort_g40_cleaned_respdeath_f <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + imd2015_5 , family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(model2_cohort_g40_cleaned_respdeath_f, times=c(0,365,730,1094))


m2r <- model2_cohort_g40_cleaned_respdeath_f 
cov.m2r <- vcovHC(m2r, type="HC0")
std.err.m2r <- sqrt (diag(cov.m2r))
r.est.m2r <- cbind(Estimate= coef(m2r), "Robust SE"= std.err.m2r, "Pr(>|z|)" = 2*pnorm(abs(coef(m2r)/std.err.m2r), lower.tail = FALSE), LL= coef(m2r)-1.96*std.err.m2r, UL= coef(m2r)+1.96*std.err.m2r)
view(r.est.m2r)


model3_cohort_g40_cleaned_respdeath_f <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + imd2015_5 + smokstatus + bmi_cat_2, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(model3_cohort_g40_cleaned_respdeath_f, times=c(0,365,730,1094))


m3r <- model3_cohort_g40_cleaned_respdeath_f 
cov.m3r <- vcovHC(m3r, type="HC0")
std.err.m3r <- sqrt (diag(cov.m3r))
r.est.m3r <- cbind(Estimate= coef(m3r), "Robust SE"= std.err.m3r, "Pr(>|z|)" = 2*pnorm(abs(coef(m3r)/std.err.m3r), lower.tail = FALSE), LL= coef(m3r)-1.96*std.err.m3r, UL= coef(m3r)+1.96*std.err.m3r)
view(r.est.m3r)


model4_cohort_g40_cleaned_respdeath_f <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + imd2015_5 + smokstatus + bmi_cat_2 + asthma_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(model4_cohort_g40_cleaned_respdeath_f, times=c(0,365,730,1094))


m4r <- model4_cohort_g40_cleaned_respdeath_f 
cov.m4r <- vcovHC(m4r, type="HC0")
std.err.m4r <- sqrt (diag(cov.m4r))
r.est.m4r <- cbind(Estimate= coef(m4r), "Robust SE"= std.err.m4r, "Pr(>|z|)" = 2*pnorm(abs(coef(m4r)/std.err.m4r), lower.tail = FALSE), LL= coef(m4r)-1.96*std.err.m4r, UL= coef(m4r)+1.96*std.err.m4r)
view(r.est.m4r)



# Adding COPD interaction with time
pois_cohort_g40_cleaned2_respdeath_f <- glm(resp_death ~ copd_jan17 + copd_jan17*followup_time + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_cohort_g40_cleaned2_respdeath_f)
# no significant evidence of interaction (p-value= 0.30)

# Adding COPD interaction with BMI
pois_cohort_g40_cleaned3_respdeath_f <- glm(resp_death ~ copd_jan17 + copd_jan17*bmi_cat_2 + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f)
summary(pois_cohort_g40_cleaned3_respdeath_f)
# obesity type iii minimally interaction 


# Poisson plot
pois_exp_copds_final_g40_cleaned_plot_cvddeath_f <- plot(pois_cohort_g40_cleaned_cvddeath_f)


### Testing interaction terms in all models (Likelihood ratio tests)

install.packages("lmtest")
library(lmtest)

# All-cause LR (BMI + COPD)
model_full_allcause <- lm(dead ~ copd_jan17 + copd_jan17*bmi_cat_2 + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
model_red_allcause <-  lm(dead ~ copd_jan17 + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
lrtest(model_full_allcause,model_red_allcause)

# CVD-cause LR (BMI + COPD)
model_full_cvdcause <- lm(cvd_death ~ copd_jan17 + copd_jan17*bmi_cat_2 + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
model_red_cvdcause <-  lm(cvd_death ~ copd_jan17 + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
lrtest(model_full_cvdcause,model_red_cvdcause)

# Resp-cause LR (BMI + COPD)
model_full_respcause <- lm(resp_death ~ copd_jan17 + copd_jan17*bmi_cat_2 + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
model_red_respcause <-  lm(resp_death ~ copd_jan17 + bmi_cat_2 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, data = cohort_g40_cleaned_f)
lrtest(model_full_respcause,model_red_respcause)


# Stratify CVD-cause and Resp-cause LR 


## Underweight
cohort_g40_cleaned_f_underweight <- cohort_g40_cleaned_f %>% filter(bmi_cat_2 == "underweight")

pois_cohort_g40_cleaned3_respdeath_f_underweight <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_underweight)
summary(pois_cohort_g40_cleaned3_respdeath_f_underweight)

pois_cohort_g40_cleaned3_cvddeath_f_underweight <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_underweight)
summary(pois_cohort_g40_cleaned3_cvddeath_f_underweight)

## Stratified confidence intervals
model5_resp_cohort_g40_cleaned_f_under <- pois_cohort_g40_cleaned3_respdeath_f_underweight

m5r_under <- model5_resp_cohort_g40_cleaned_f_under
cov.m5r_under <- vcovHC(m5r_under, type="HC0")
std.err.m5r_under <- sqrt (diag(cov.m5r_under))
r.est.m5r_under <- cbind(Estimate= coef(m5r_under), "Robust SE"= std.err.m5r_under, "Pr(>|z|)" = 2*pnorm(abs(coef(m5r_under)/std.err.m5r_under), lower.tail = FALSE), LL= coef(m5r_under)-1.96*std.err.m5r_under, UL= coef(m5r_under)+1.96*std.err.m5r_under)
view(r.est.m5r_under)

model5_cvd_cohort_g40_cleaned_f_under <- pois_cohort_g40_cleaned3_cvddeath_f_underweight

m5c_under <- model5_cvd_cohort_g40_cleaned_f_under
cov.m5c_under <- vcovHC(m5c_under, type="HC0")
std.err.m5c_under <- sqrt (diag(cov.m5c_under))
r.est.m5c_under <- cbind(Estimate= coef(m5c_under), "Robust SE"= std.err.m5c_under, "Pr(>|z|)" = 2*pnorm(abs(coef(m5c_under)/std.err.m5c_under), lower.tail = FALSE), LL= coef(m5c_under)-1.96*std.err.m5c_under, UL= coef(m5c_under)+1.96*std.err.m5c_under)
view(r.est.m5c_under)



cohort_g40_cleaned_f_normal <- cohort_g40_cleaned_f %>% filter(bmi_cat_2 == "normal")

pois_cohort_g40_cleaned3_respdeath_f_normal <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_normal)
summary(pois_cohort_g40_cleaned3_respdeath_f_normal)

pois_cohort_g40_cleaned3_cvddeath_f_normal <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_normal)
summary(pois_cohort_g40_cleaned3_cvddeath_f_normal)

## Stratified confidence intervals
model5_resp_cohort_g40_cleaned_f_normal <- pois_cohort_g40_cleaned3_respdeath_f_normal

m5r_normal <- model5_resp_cohort_g40_cleaned_f_normal
cov.m5r_normal <- vcovHC(m5r_normal, type="HC0")
std.err.m5r_normal <- sqrt (diag(cov.m5r_normal))
r.est.m5r_normal <- cbind(Estimate= coef(m5r_normal), "Robust SE"= std.err.m5r_normal, "Pr(>|z|)" = 2*pnorm(abs(coef(m5r_normal)/std.err.m5r_normal), lower.tail = FALSE), LL= coef(m5r_normal)-1.96*std.err.m5r_normal, UL= coef(m5r_normal)+1.96*std.err.m5r_normal)
view(r.est.m5r_normal)

model5_cvd_cohort_g40_cleaned_f_normal <- pois_cohort_g40_cleaned3_cvddeath_f_normal

m5c_normal <- model5_cvd_cohort_g40_cleaned_f_normal
cov.m5c_normal <- vcovHC(m5c_normal, type="HC0")
std.err.m5c_normal <- sqrt (diag(cov.m5c_normal))
r.est.m5c_normal <- cbind(Estimate= coef(m5c_normal), "Robust SE"= std.err.m5c_normal, "Pr(>|z|)" = 2*pnorm(abs(coef(m5c_normal)/std.err.m5c_normal), lower.tail = FALSE), LL= coef(m5c_normal)-1.96*std.err.m5c_normal, UL= coef(m5c_normal)+1.96*std.err.m5c_normal)
view(r.est.m5c_normal)





cohort_g40_cleaned_f_preob <- cohort_g40_cleaned_f %>% filter(bmi_cat_2 == "pre-obesity")

pois_cohort_g40_cleaned3_respdeath_f_preob <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_preob)
summary(pois_cohort_g40_cleaned3_respdeath_f_preob)

pois_cohort_g40_cleaned3_cvddeath_f_preob <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_preob)
summary(pois_cohort_g40_cleaned3_cvddeath_f_preob)

## Stratified confidence intervals
model5_resp_cohort_g40_cleaned_f_preob <- pois_cohort_g40_cleaned3_respdeath_f_preob

m5r_preob <- model5_resp_cohort_g40_cleaned_f_preob
cov.m5r_preob <- vcovHC(m5r_preob, type="HC0")
std.err.m5r_preob <- sqrt (diag(cov.m5r_preob))
r.est.m5r_preob <- cbind(Estimate= coef(m5r_preob), "Robust SE"= std.err.m5r_preob, "Pr(>|z|)" = 2*pnorm(abs(coef(m5r_preob)/std.err.m5r_preob), lower.tail = FALSE), LL= coef(m5r_preob)-1.96*std.err.m5r_preob, UL= coef(m5r_preob)+1.96*std.err.m5r_preob)
view(r.est.m5r_preob)

model5_cvd_cohort_g40_cleaned_f_preob <- pois_cohort_g40_cleaned3_cvddeath_f_preob

m5c_preob <- model5_cvd_cohort_g40_cleaned_f_preob
cov.m5c_preob <- vcovHC(m5c_preob, type="HC0")
std.err.m5c_preob <- sqrt (diag(cov.m5c_preob))
r.est.m5c_preob <- cbind(Estimate= coef(m5c_preob), "Robust SE"= std.err.m5c_preob, "Pr(>|z|)" = 2*pnorm(abs(coef(m5c_preob)/std.err.m5c_preob), lower.tail = FALSE), LL= coef(m5c_preob)-1.96*std.err.m5c_preob, UL= coef(m5c_preob)+1.96*std.err.m5c_preob)
view(r.est.m5c_preob)




cohort_g40_cleaned_f_ob1 <- cohort_g40_cleaned_f %>% filter(bmi_cat_2 == "obesity I")

pois_cohort_g40_cleaned3_respdeath_f_ob1 <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_ob1)
summary(pois_cohort_g40_cleaned3_respdeath_f_ob1)

pois_cohort_g40_cleaned3_cvddeath_f_ob1 <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_ob1)
summary(pois_cohort_g40_cleaned3_cvddeath_f_ob1)

## Stratified confidence intervals
model5_resp_cohort_g40_cleaned_f_ob1 <- pois_cohort_g40_cleaned3_respdeath_f_ob1

m5r_ob1 <- model5_resp_cohort_g40_cleaned_f_ob1
cov.m5r_ob1 <- vcovHC(m5r_ob1, type="HC0")
std.err.m5r_ob1 <- sqrt (diag(cov.m5r_ob1))
r.est.m5r_ob1 <- cbind(Estimate= coef(m5r_ob1), "Robust SE"= std.err.m5r_ob1, "Pr(>|z|)" = 2*pnorm(abs(coef(m5r_ob1)/std.err.m5r_ob1), lower.tail = FALSE), LL= coef(m5r_ob1)-1.96*std.err.m5r_ob1, UL= coef(m5r_ob1)+1.96*std.err.m5r_ob1)
view(r.est.m5r_ob1)

model5_cvd_cohort_g40_cleaned_f_ob1 <- pois_cohort_g40_cleaned3_cvddeath_f_ob1

m5c_ob1 <- model5_cvd_cohort_g40_cleaned_f_ob1
cov.m5c_ob1 <- vcovHC(m5c_ob1, type="HC0")
std.err.m5c_ob1 <- sqrt (diag(cov.m5c_ob1))
r.est.m5c_ob1 <- cbind(Estimate= coef(m5c_ob1), "Robust SE"= std.err.m5c_ob1, "Pr(>|z|)" = 2*pnorm(abs(coef(m5c_ob1)/std.err.m5c_ob1), lower.tail = FALSE), LL= coef(m5c_ob1)-1.96*std.err.m5c_ob1, UL= coef(m5c_ob1)+1.96*std.err.m5c_ob1)
view(r.est.m5c_ob1)



cohort_g40_cleaned_f_ob2 <- cohort_g40_cleaned_f %>% filter(bmi_cat_2 == "obesity II")

pois_cohort_g40_cleaned3_respdeath_f_ob2 <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_ob2)
summary(pois_cohort_g40_cleaned3_respdeath_f_ob2)

pois_cohort_g40_cleaned3_cvddeath_f_ob2 <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_ob2)
summary(pois_cohort_g40_cleaned3_cvddeath_f_ob2)



## Stratified confidence intervals
model5_resp_cohort_g40_cleaned_f_ob2 <- pois_cohort_g40_cleaned3_respdeath_f_ob2
m5r_ob2 <- model5_resp_cohort_g40_cleaned_f_ob2
cov.m5r_ob2 <- vcovHC(m5r_ob2, type="HC0")
std.err.m5r_ob2 <- sqrt (diag(cov.m5r_ob2))
r.est.m5r_ob2 <- cbind(Estimate= coef(m5r_ob2), "Robust SE"= std.err.m5r_ob2, "Pr(>|z|)" = 2*pnorm(abs(coef(m5r_ob2)/std.err.m5r_ob2), lower.tail = FALSE), LL= coef(m5r_ob2)-1.96*std.err.m5r_ob2, UL= coef(m5r_ob2)+1.96*std.err.m5r_ob2)
view(r.est.m5r_ob2)

model5_cvd_cohort_g40_cleaned_f_ob2 <- pois_cohort_g40_cleaned3_cvddeath_f_ob2

m5c_ob2 <- model5_cvd_cohort_g40_cleaned_f_ob2
cov.m5c_ob2 <- vcovHC(m5c_ob2, type="HC0")
std.err.m5c_ob2 <- sqrt (diag(cov.m5c_ob2))
r.est.m5c_ob2 <- cbind(Estimate= coef(m5c_ob2), "Robust SE"= std.err.m5c_ob2, "Pr(>|z|)" = 2*pnorm(abs(coef(m5c_ob2)/std.err.m5c_ob2), lower.tail = FALSE), LL= coef(m5c_ob2)-1.96*std.err.m5c_ob2, UL= coef(m5c_ob2)+1.96*std.err.m5c_ob2)
view(r.est.m5c_ob2)



cohort_g40_cleaned_f_ob3 <- cohort_g40_cleaned_f %>% filter(bmi_cat_2 == "obesity III")

pois_cohort_g40_cleaned3_respdeath_f_ob3 <- glm(resp_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_ob3)
summary(pois_cohort_g40_cleaned3_respdeath_f_ob3)

pois_cohort_g40_cleaned3_cvddeath_f_ob3 <- glm(cvd_death ~ copd_jan17 + age_jan2017 + gender + smokstatus + imd2015_5 + asthma_jan17 + cvd_hf_general_jan17, family = poisson(link = "log"), data = cohort_g40_cleaned_f_ob3)
summary(pois_cohort_g40_cleaned3_cvddeath_f_ob3)


## Stratified confidence intervals
model5_resp_cohort_g40_cleaned_f_ob3 <- pois_cohort_g40_cleaned3_respdeath_f_ob3
m5r_ob3 <- model5_resp_cohort_g40_cleaned_f_ob3
cov.m5r_ob3 <- vcovHC(m5r_ob3, type="HC0")
std.err.m5r_ob3 <- sqrt (diag(cov.m5r_ob3))
r.est.m5r_ob3 <- cbind(Estimate= coef(m5r_ob3), "Robust SE"= std.err.m5r_ob3, "Pr(>|z|)" = 2*pnorm(abs(coef(m5r_ob3)/std.err.m5r_ob3), lower.tail = FALSE), LL= coef(m5r_ob3)-1.96*std.err.m5r_ob3, UL= coef(m5r_ob3)+1.96*std.err.m5r_ob3)
view(r.est.m5r_ob3)

model5_cvd_cohort_g40_cleaned_f_ob3 <- pois_cohort_g40_cleaned3_cvddeath_f_ob3

m5c_ob3 <- model5_cvd_cohort_g40_cleaned_f_ob3
cov.m5c_ob3 <- vcovHC(m5c_ob3, type="HC0")
std.err.m5c_ob3 <- sqrt (diag(cov.m5c_ob3))
r.est.m5c_ob3 <- cbind(Estimate= coef(m5c_ob3), "Robust SE"= std.err.m5c_ob3, "Pr(>|z|)" = 2*pnorm(abs(coef(m5c_ob3)/std.err.m5c_ob3), lower.tail = FALSE), LL= coef(m5c_ob3)-1.96*std.err.m5c_ob3, UL= coef(m5c_ob3)+1.96*std.err.m5c_ob3)
view(r.est.m5c_ob3)



# All-cause mortality rates for COPD-T2D and non-COPD-T2D patients
table(cohort_g40_cleaned_f$dead)
table(cohort_g40_cleaned_f_COPD$dead)
table(cohort_g40_cleaned_f_nCOPD$dead)
# Number of deaths in COPD patients is 10320 and in non-COPD patients is 51758 in 3 year time-period.

# How are the dod in 2016 whereas I eliminated them in the cleaning of my datasets?
table(cohort_g40_cleaned_f$dod)

cohort_g40_cleaned_f$personmonths <- followup_time_pos/30
cohort_g40_cleaned_f$personyears <- followup_time_pos/365.25

cohort_g40_cleaned_f_COPD$personmonths <- followup_time_pos/30
cohort_g40_cleaned_f_COPD$personyears <- followup_time_pos/365.25


table(cohort_g40_cleaned_f$personmonths)
table(cohort_g40_cleaned_f$personyears)

# Calculate number of deaths each month in the follow up time period for the different numerators
# Calculate the person months for the different denominators 
# Poisson rates should involve the numerators over the denominators
# Calculating the risk ratios per months 

# Following Alex's advice
# Calculate the numerator over a three time period
# Calculate the number of deaths over the three time period using the sum and then the yearly number of deaths
# Calculate the person months/years per column using the sum; have to make three follow up time pos periods
# Find the division between them

# For all cohort:
# Reminder (on how to calculate follow up time)
cohort_g40_cleaned_f$personmonths <- followup_time_pos/30
cohort_g40_cleaned_f$personyears <- followup_time_pos/365.25
table(cohort_g40_cleaned_f$dead)
# Numerator:
sum(cohort_g40_cleaned_f$dead == 1)
# 62078 dead over 3 year period
# Denominator:
sum(cohort_g40_cleaned_f$personyears, na.rm= TRUE)
# 197525.1 person years over a 3 year period
# Death incidence over 3 period year:
# 62078/197525.1 * 1000 = 314.3 deaths per 1000 person years

# For COPD cohort:
# Reminder:
cohort_g40_cleaned_f_COPD$personmonths <- followup_time_pos/30
cohort_g40_cleaned_f_COPD$personyears <- followup_time_pos/365.25
table(cohort_g40_cleaned_f_COPD$dead)
# Numerator:
sum(cohort_g40_cleaned_f_COPD$dead == 1)
# 10320 dead over 3 year period
# Denominator:
sum(cohort_g40_cleaned_f_COPD$personyears, na.rm= TRUE)
# 22997.74 person years over a 3 year period
# DI over 3 year period:
# 10320/22997.74 * 1000 = 378.2 deaths per 1000 person years 


# For nCOPD cohort
# Reminder:
cohort_g40_cleaned_f_nCOPD$personmonths <- followup_time_pos/30
cohort_g40_cleaned_f_nCOPD$personyears <- followup_time_pos/365.25
table(cohort_g40_cleaned_f_nCOPD$dead)
# Numerator:
sum(cohort_g40_cleaned_f_nCOPD$dead == 1)
# 51758 dead over 3 year period
# Denominator:
sum(cohort_g40_cleaned_f_nCOPD$personyears, na.rm= TRUE)
# 174527.4 person years over a 3 year period
# DI over 3 year period:
# 51758/174527.4 * 1000 = 296.6 deaths per 1000 person years 


# Using incidence and prevalence rates using formulas over three time period (to showcase Confidence intervals)
table(cohort_g40_cleaned_f$dead)
table(cohort_g40_cleaned_f_COPD$dead)
table(cohort_g40_cleaned_f_nCOPD$dead)

install.packages("epiR")
library(epiR)
library(ggplot2)
library(scales)
library(zoo)

## For All death causes
# For whole cohort 
ncas <- 62078; ntar <- #number of person years at risk
  ncas <- 62078; ntar <- 197525.1
tmp_cohort_g40_cleaned_f <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f, ctype = "inc.rate",method = "exact",N=121563, design= 1, conf.level= 0.95)* 1000
# Shows that the estimate is 314.3 (similar to what was calculated) and CI is (311.8,316.8)

# For COPD cohort
ncas <- 10320; ntar <- 22997.7
tmp_cohort_g40_cleaned_f_COPD <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f_COPD, ctype = "inc.rate",method = "exact",N=14763, design= 1, conf.level= 0.95)* 1000
# Shows that the estimate is 448.7 (similar to what was calculated) and CI is (440.1,457.5)

# For nCOPD cohort
ncas <- 51758; ntar <- 174527.4
tmp_cohort_g40_cleaned_f_nCOPD <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f_nCOPD, ctype = "inc.rate",method = "exact",N=106800, design= 1, conf.level= 0.95)* 1000
# Shows that the estimate is 296.6 (similar to what was calculated) and CI is (294.0,299.1)

## Stratified for different causes of death 
# CVD death

# For whole cohort
# ncas: 
table(cohort_g40_cleaned_f$cvd_death)
sum(cohort_g40_cleaned_f$cvd_death == 1)
# ncas <- 17761
# ntar: is the same as person years for the dead variable; shown above. ntar <- 197525.1
# Find the CI
ncas <- 17761; ntar <- 197525.1
tmp_cohort_g40_cleaned_f <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f, ctype = "inc.rate",method = "exact",N=121563, design= 1, conf.level= 0.95)* 1000
# Estimate is 89.9 with a CI: (88.6,91.2)

# For COPD cohort
# ncas: 
table(cohort_g40_cleaned_f_COPD$cvd_death)
sum(cohort_g40_cleaned_f_COPD$cvd_death == 1)
# ncas <- 2593
# ntar: is the same as person years for the dead variable; shown above. ntar <- 22997.7
# Find the CI
ncas <- 2593; ntar <- 22997.7
tmp_cohort_g40_cleaned_f_COPD <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f_COPD, ctype = "inc.rate",method = "exact",N=14763, design= 1, conf.level= 0.95)* 1000
# Estimate is 112.8 with a CI: (108.5,117.2)

# For nCOPD cohort
# ncas: 
table(cohort_g40_cleaned_f_nCOPD$cvd_death)
sum(cohort_g40_cleaned_f_nCOPD$cvd_death == 1)
# ncas <- 15168
# ntar: is the same as person years for the dead variable; shown above. ntar <- 174527.4
# Find the CI
ncas <- 15168; ntar <- 174527.4
tmp_cohort_g40_cleaned_f_nCOPD <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f_nCOPD, ctype = "inc.rate",method = "exact",N=106800, design= 1, conf.level= 0.95)* 1000
# Estimate is 86.9 with a CI: (85.5,88.3)


# Resp death

# For whole cohort
# ncas: 
table(cohort_g40_cleaned_f$resp_death)
sum(cohort_g40_cleaned_f$resp_death == 1)
# ncas <- 8441
# ntar: is the same as person years for the dead variable; shown above. ntar <- 197525.1
# Find the CI
ncas <- 8441; ntar <- 197525.1
tmp_cohort_g40_cleaned_f <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f, ctype = "inc.rate",method = "exact",N=121563, design= 1, conf.level= 0.95)* 1000
# Estimate is 42.7 with a CI: (41.8,43.7)

# For COPD cohort
# ncas: 
table(cohort_g40_cleaned_f_COPD$resp_death)
sum(cohort_g40_cleaned_f_COPD$resp_death == 1)
# ncas <- 2967
# ntar: is the same as person years for the dead variable; shown above. ntar <- 22997.7
# Find the CI
ncas <- 2967; ntar <- 22997.7
tmp_cohort_g40_cleaned_f_COPD <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f_COPD, ctype = "inc.rate",method = "exact",N=14763, design= 1, conf.level= 0.95)* 1000
# Estimate is 129.0 with a CI: (124.4,133.7)

# For nCOPD cohort
# ncas: 
table(cohort_g40_cleaned_f_nCOPD$resp_death)
sum(cohort_g40_cleaned_f_nCOPD$resp_death == 1)
# ncas <- 5474
# ntar: is the same as person years for the dead variable; shown above. ntar <- 174527.4
# Find the CI
ncas <- 5474; ntar <- 205536.7
tmp_cohort_g40_cleaned_f_nCOPD <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f_nCOPD, ctype = "inc.rate",method = "exact",N=106800, design= 1, conf.level= 0.95)* 1000
# Estimate is 26.6 with a CI: (25.9,27.3)

# Kidney failure 

# For whole cohort
# ncas: 
table(cohort_g40_cleaned_f$kidney_failure)
sum(cohort_g40_cleaned_f$kidney_failure == 1)
# ncas <- 46012
# ntar: is the same as person years for the dead variable; shown above. ntar <- 197525.1
# Find the CI
ncas <- 46012; ntar <- 197525.1
tmp_cohort_g40_cleaned_f <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f, ctype = "inc.rate",method = "exact",N=143345, design= 1, conf.level= 0.95)* 1000
# Estimate is 232.9 with a CI: (230.8,235.1)

# For COPD cohort
# ncas: 
table(cohort_g40_cleaned_f_COPD$kidney_failure)
sum(cohort_g40_cleaned_f_COPD$kidney_failure == 1)
# ncas <- 6810
# ntar: is the same as person years for the dead variable; shown above. ntar <-22997.7
# Find the CI
ncas <- 6810; ntar <- 22997.7
tmp_cohort_g40_cleaned_f_COPD <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f_COPD, ctype = "inc.rate",method = "exact",N=17477, design= 1, conf.level= 0.95)* 1000
# Estimate is 296.1 with a CI: (289.1,303.2)

# For nCOPD cohort
# ncas: 
table(cohort_g40_cleaned_f_nCOPD$kidney_failure)
sum(cohort_g40_cleaned_f_nCOPD$kidney_failure == 1)
# ncas <- 39202
# ntar: is the same as person years for the dead variable; shown above. ntar <- 174527.4
# Find the CI
ncas <- 39202; ntar <- 174527.4
tmp_cohort_g40_cleaned_f_nCOPD <- as.matrix(cbind(ncas,ntar))
epi.conf(tmp_cohort_g40_cleaned_f_nCOPD, ctype = "inc.rate",method = "exact",N=106800, design= 1, conf.level= 0.95)* 1000
# Estimate is 224.6 with a CI: (222.4,226.9)

# Should we put the rest of others? 
# Done KM, Look over cox model- global does not violate the law of proportional hazards
# All that is left is the Poisson modeling and doing the yearly rates (need to check if dod var is date of death)


#Year 1 all cause death



table(cohort_g40_cleaned$deathdate)
cohort_g40_cleaned$deathdate <- as.Date(cohort_g40_cleaned$deathdate,"%YYYY-%mm-%dd")
cohort_g40_cleaned$deathdate <- na.omit(cohort_g40_cleaned$deathdate)
subset(cohort_g40_cleaned, deathdate >= "2017-01-01" & deathdate < "2018-01-01") %>%nrow()
ncas <- 17380    #with the cleaned dataset the ncas <- 17309


cohort_g40_cleaned_new$enter_date <- as.Date(cohort_g40_cleaned_new$enter_date,"%YYYY-%mm-%dd")
cohort_g40_cleaned_new$exit_date <- as.Date(cohort_g40_cleaned_new$exit_date,"%YYYY-%mm-%dd")

cohort_g40_cleaned$followup_time_1 <- cohort_g40_cleaned$exit_date_1 - cohort_g40_cleaned$enter_date
table(cohort_g40_cleaned$followup_time_1)

filter(cohort_g40_cleaned_new,followup_time_1<0) %>%nrow()


table(cohort_g40_cleaned_new$deathdate)


cohort_g40_cleaned_new$exit_date_1 <- as.Date("2017-01-31")
cohort_g40_cleaned_new$deathdate[!is.na(cohort_g40_cleaned_new$deathdate)]
cohort_g40_cleaned_new$exit_date_1[cohort_g40_cleaned_new$deathdate < cohort_g40_cleaned_new$exit_date_1] <- cohort_g40_cleaned_new$deathdate

#####################

For descriptive purposes of the table

install.packages("htmlTable")
library(boot)
install.packages("table1")
library(table1)

# Creating Table 1 

cohort_g40_f_2 <- cohort_g40_cleaned_f
cohort_g40_f_2$COPDstatus <- factor(cohort_g40_f_2$COPDstatus, levels=c(0,1), labels=c("non-COPD","COPD"))

View(cohort_g40_f_2)


table1(~ factor(gender) + factor(age_group_jan2017) + factor (imd2015_5) + factor (bmi_cat_2) + factor (smokstatus) + factor(asthma_jan17) + factor (cvd_hf_general_jan17) + factor(mras_jan17) + factor(lipid_lowering_drugs_jan17) + factor(oral_diuretics_jan17) + factor(calciumchannelblockers_jan17) + factor(betablockers_jan17) + factor(arbs_jan17) + factor(acei_jan17) + factor(ckd)| COPDstatus, data= cohort_g40_f_2, overall="Total")

cohort_g40_f_2$gender <- factor(cohort_g40_f_2$gender, levels=c(1,2), labels=c("Male","Female"))
label(cohort_g40_f_2$gender) <- "Sex"

cohort_g40_f_2$age_group_jan2017 <- factor(cohort_g40_f_2$age_group_jan2017, levels=c(3,4,5,6,7,8), labels=c("40-49","50-59","60-69","70-79","80-89","90 and over"))
label(cohort_g40_f_2$age_group_jan2017) <- "Age"
units(cohort_g40_f_2$age_group_jan2017) <- "years"

cohort_g40_f_2$imd2015_5 <- factor(cohort_g40_f_2$imd2015_5, levels=c(1,2,3,4,5), labels=c("1 (least deprived)","2","3","4","5 (most deprived)"))
label(cohort_g40_f_2$imd2015_5) <- "IMD Quintiles"

label(cohort_g40_f_2$bmi_cat_2) <- "BMI"

cohort_g40_f_2$smokstatus <- factor(cohort_g40_f_2$smokstatus, levels=c(0,1,2), labels=c("Never","Ex-Smoker","Current Smoker"))
label(cohort_g40_f_2$smokstatus) <- "Smoking Status"

cohort_g40_f_2$asthma_jan17 <- factor(cohort_g40_f_2$asthma_jan17, levels=c(0,1), labels=c("Absent","Present"))
label(cohort_g40_f_2$asthma_jan17) <- "Prior Asthma diagnosis"

cohort_g40_f_2$cvd_hf_general_jan17 <- factor(cohort_g40_f_2$cvd_hf_general_jan17, levels=c(0,1), labels=c("Absent","Present"))
label(cohort_g40_f_2$cvd_hf_general_jan17) <- "Prior Cardiovascular disease condition"

cohort_g40_f_2$mras_jan17 <- factor(cohort_g40_f_2$mras_jan17, levels=c(1), labels=c("Yes"))
label(cohort_g40_f_2$mras_jan17) <- "Use of MRAs"

cohort_g40_f_2$lipid_lowering_drugs_jan17 <- factor(cohort_g40_f_2$lipid_lowering_drugs_jan17, levels=c(0,1), labels=c("No","Yes"))
label(cohort_g40_f_2$lipid_lowering_drugs_jan17) <- "Use of LLDs"

cohort_g40_f_2$oral_diuretics_jan17 <- factor(cohort_g40_f_2$oral_diuretics_jan17, levels=c(0,1), labels=c("No","Yes"))
label(cohort_g40_f_2$oral_diuretics_jan17) <- "Use of ODs"

cohort_g40_f_2$calciumchannelblockers_jan17 <- factor(cohort_g40_f_2$calciumchannelblockers_jan17, levels=c(0,1), labels=c("No","Yes"))
label(cohort_g40_f_2$calciumchannelblockers_jan17) <- "Use of CCBs"

cohort_g40_f_2$betablockers_jan17 <- factor(cohort_g40_f_2$betablockers_jan17, levels=c(0,1), labels=c("No","Yes"))
label(cohort_g40_f_2$betablockers_jan17) <- "Use of BBs"

cohort_g40_f_2$arbs_jan17 <- factor(cohort_g40_f_2$arbs_jan17, levels=c(0,1), labels=c("No","Yes"))
label(cohort_g40_f_2$arbs_jan17) <- "Use of ARBs"

cohort_g40_f_2$acei_jan17 <- factor(cohort_g40_f_2$acei_jan17, levels=c(0,1), labels=c("No","Yes"))
label(cohort_g40_f_2$acei_jan17) <- "Use of ACEi"

cohort_g40_f_2$ckd <- factor(cohort_g40_f_2$ckd, levels=c(0,1,2,3,4,5), labels=c("1","2","3a","3b","4","5"))
label(cohort_g40_f_2$ckd) <- "Ckd stage"

table1(~ gender + age_group_jan2017 + imd2015_5 + bmi_cat_2 + smokstatus + asthma_jan17 + cvd_hf_general_jan17 + ckd + mras_jan17 + lipid_lowering_drugs_jan17 + oral_diuretics_jan17 + calciumchannelblockers_jan17 + betablockers_jan17 + arbs_jan17 + acei_jan17 | COPDstatus, data= cohort_g40_f_2, overall="Total")




#########

table(cohort_g40_cleaned$bronchiectasis_jan17)

# For all cohort: risk ratios for Year 1  
# Calculate the numerator which is number of deaths in Year 1 based on dod. I don't think dod is date of death
cohort_g40_cleaned_COPD$dod <- as.Date(cohort_g40_cleaned_COPD$dod,"%dd/%mm/%YYY")
subset(cohort_g40_cleaned, dod >= "01/01/2017" & dod < "01/01/2018") %>%nrow()
subset(cohort_g40_cleaned, dod >= "01/01/2018" & dod <= "01/01/2019") %>%nrow()
# Calculate the denominator in person years
subset(cohort_g40_cleaned, dod >= "01/01/2017" & dod <= "31/01/2017") %>%nrow()


# Using the person years in the survival package 
#py1 <- pyears(temp.time ~ temp.age + temp.yr, scale=1)
#temp.time <- total days of followup
#temp.age <- tcut(temp2-temp1, floor(c(-1, 18:31 * 365.24))), labels=c('0-18', paste(18:30, 19:31, sep('-')))
#temp.yr <- tcut(temp 2, mdy.date(1,1,
#temp 1 <- mdy.date (d,m,YY)
#temp 1 <- mdy.date (d,m,YY)


table(cohort_g40_cleaned$deathdate)
cohort_g40_cleaned_COPD$deathdate <- as.Date(cohort_g40_cleaned_COPD$deathdate,"%YYYY-%mm-%dd")
subset(cohort_g40_cleaned, deathdate >= "2017-01-01" & deathdate < "2018-01-01") %>%nrow()

pyears(followup_time_pos, weights, subset, ratetable, scale=365.25, expect=c("pyears", model= FALSE, x= FALSE, y= FALSE, data.frame= FALSE)

