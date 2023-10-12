/*Master do file

Purpose: Create dataset for ABC CKD project

Author: Sarah Cook

Creation date February 2021*/
clear
set more off

/*set up diabetes cohort - using first record of type 2 diabetes to give date of diagnosis*/
do "H:\ABC_CKD\Dataset\Creating diabetes cohort.do"

/*add key info from patient files age, sex to diabetes cohort*/
use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\edmckd_patient_practice.dta"
assert acceptable
assert patienttype==3
assert (gender==1 | gender==2)
drop _merge

save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace

/*add code for COPD*/
do "H:\ABC_CKD\Dataset\Create COPD variable.do"

/*add code for hypertension*/
do "H:\ABC_CKD\Dataset\creating hypertension variable.do"

/*add code for hypotension*/
do "H:\ABC_CKD\Dataset\create hypotension variable.do"

/*add code for heart failure*/
do "H:\ABC_CKD\Dataset\create heart failure variable.do"

/*add code for stroke*/
do "H:\ABC_CKD\Dataset\create stroke variable.do"

/*add code for CV diseases*/
do "H:\ABC_CKD\Dataset\create cv diseases variable.do"

/*add code for MI*/
do "H:\ABC_CKD\Dataset\create myocardial infarction variable.do"

/*add code for angina*/
do "H:\ABC_CKD\Dataset\create angina variable.do"

/*add code for kidney failure*/
do "H:\ABC_CKD\Dataset\create kidney failure variable.do"


/*add code for hyperthyroidism*/
do "H:\ABC_CKD\Dataset\create hyperthyroidism variable.do"


/*add code for hypothyroid*/
do "H:\ABC_CKD\Dataset\create hypothyroid variable.do"


/*add code for atrial fibrillation/atrial flutter*/
do "H:\ABC_CKD\Dataset\create atrial_fibrillation variable.do"


/*add code for alcohol use*/
do "H:\ABC_CKD\Dataset\create alcohol intake variable.do"


/*add code for hyperkalemia*/
do "H:\ABC_CKD\Dataset\create hyperkalemia.do"

/*add code for sleep apnoea*/
do "H:\ABC_CKD\Dataset\create sleep apnoea variable.do"

/*add code for lipid disorders variable*/
do "H:\ABC_CKD\Dataset\create lipid_disorders variable.do"

/*add code for anaemia variable*/
do "H:\ABC_CKD\Dataset\create anaemia variable.do"

/*add code for HbA1c*/
do "H:\ABC_CKD\Dataset\create hba1c_1.do"
do "H:\ABC_CKD\Dataset\create hba1c 31st Dec 2019.do"


/*gen code to create egfr*/
do "H:\ABC_CKD\Dataset\create eGFR.do"

do "H:\ABC_CKD\Dataset\create egfr 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create egfr 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create egfr 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create egfr 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create egfr 1st July 2019.do"
do "H:\ABC_CKD\Dataset\create egfr 31st Dec 2019.do"

/*gen code for create albuminuria variable*/
do "H:\ABC_CKD\Dataset\create albuminuria.do"
do "H:\ABC_CKD\Dataset\create albuminuria 1st July 2017.do"

do "H:\ABC_CKD\Dataset\create albuminuria variable_1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create albuminuria variable_1st July 2018.do"
do "H:\ABC_CKD\Dataset\create albuminuria variable_1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create albuminuria variable_1st July 2019.do"
do "H:\ABC_CKD\Dataset\create albuminuria variable_31st Dec 2019.do"




/*gen code for medication use on 1st Jan 2017*/
do "H:\ABC_CKD\Dataset\create ace inhibitor 1st Jan 2017.do"

do "H:\ABC_CKD\Dataset\create arbs 1st Jan 2017.do"

do "H:\ABC_CKD\Dataset\create mras 1st Jan 2017.do"

do "H:\ABC_CKD\Dataset\create lipid_lowering_drugs_1st_Jan_2017.do"

do "H:\ABC_CKD\Dataset\create calcium channel blockers 1st Jan 2017.do"

do "H:\ABC_CKD\Dataset\create beta blockers 1st Jan 2017.do"

do "H:\ABC_CKD\Dataset\create sglti2 1st Jan 2017.do"

do "H:\ABC_CKD\Dataset\create ddp4 1st Jan 2017.do"

replace copd=0 if copd==.
replace hypertension=0 if hypertension==.
replace hf=0 if hf==.
replace angina=0 if angina==.
replace stroke=0 if stroke==.
replace cvd=0 if cvd==.
replace mi=0 if mi==.
replace kidney_failure=0 if kidney_failure==.
replace lipid_disorders=0 if lipid_disorders==.
replace hyperkalemia=0 if hyperkalemia==.
replace hyperthyroidism=0 if hyperthyroidism==.
replace af=0 if af==.
replace hypotension=0 if hypotension==.
replace hypothyroid=0 if hypothyroid==.
replace sleep_apnoea=0 if sleep_apnoea==.
replace bronchiectasis=0 if bronchiectasis==.
replace asthma=0 if asthma==.
replace anaemia=0 if anaemia==.
replace diabetic_retino=0 if diabetic_retino==.
replace diabetic_neuro=0 if diabetic_neuro==.
replace pad=0 if pad==.

gen alcohol_status_1=1 if alcohol_status=="current drinker"
replace alcohol_status_1=1 if alcohol_status=="current drinker "
replace alcohol_status_1=2 if alcohol_status=="ex drinker"
label define drinking_status 1"current drinker" 2"ex drinker"
label values alcohol_status_1 drinking_status


replace acei_jan17=0 if acei_jan17==.
replace arbs_jan17=0 if arbs_jan17==.
replace mras_jan17=0 if mras_jan17==.
replace sglt2i_jan17=0 if sglt2i_jan17==.
replace lipid_lowering_drugs_jan17=0 if lipid_lowering_drugs_jan17==.
replace betablockers_jan17=0 if betablockers_jan17==.
replace calciumchannelblockers_jan17=0 if calciumchannelblockers_jan17==.
replace oral_diuretics_jan17=0 if oral_diuretics_jan17==.
replace ddp4_jan17=0 if ddp4_jan17==.
replace glp_1_jan17=0 if glp_1_jan17==. 
replace antiplatelets_jan17=0 if antiplatelets_jan17==. 


gen pad_jan17=0
replace pad_jan17=1 if pad_diagnosis_date<td(01jan2017) & pad==1

gen pad_dec19=0
replace pad_dec19=1 if pad_diagnosis_date<td(31dec2019) & pad==1

gen hypertension_jan17=0
replace hypertension_jan17=1 if hypertension_diagnosis_date<td(01jan2017) & hypertension==1

gen hypertension_med_jan17=hypertension_jan17
replace hypertension_med_jan17=1 if (acei_jan17==1 | arbs_jan17==1 |  betablockers_jan17==1 | calciumchannelblockers_jan17==1 | oral_diuretics_jan17==1)

gen hypertension_dec19=0
replace hypertension_dec19=1 if hypertension_diagnosis_date<td(31dec2019) & hypertension==1

gen hypertension_med_dec19=hypertension_dec19
replace hypertension_med_dec19=1 if (acei_dec19==1 | arbs_dec19==1 |  betablockers_dec19==1 | calciumchannelblockers_dec19==1 | oral_diuretics_dec19==1)

gen hf_ht_dec19=1 if hypertension_med_dec19==1 | hf_dec19==1
replace hf_ht_dec19=0 if hf_ht_dec19==.

gen hypotension_jan17=0
replace hypotension_jan17=1 if hypotension_diagnosis_date<td(01jan2017) & hypotension==1

gen stroke_jan17=0
replace stroke_jan17=1 if stroke_diagnosis_date<td(01jan2017) & stroke==1

gen mi_jan17=0
replace mi_jan17=1 if mi_diagnosis_date<td(01jan2017) & mi==1

gen af_jan17=0
replace af_jan17=1 if af_diagnosis_date<td(01jan2017) & af==1

gen angina_jan17=0
replace angina_jan17=1 if angina_diagnosis_date<td(01jan2017) & angina==1

gen copd_jan17=0
replace copd_jan17=1 if copd_diagnosis_date<td(01jan2017) & copd==1

gen copd_dec19=0
replace copd_dec19=1 if copd_diagnosis_date<td(31dec2019) & copd==1

gen hf_jan17=0
replace hf_jan17=1 if hf_diagnosis_date<td(01jan2017) & hf==1

gen hf_dec19=0
replace hf_dec19=1 if hf_diagnosis_date<td(31dec2019) & hf==1

gen cvd_jan17=0
replace cvd_jan17=1 if cvd_diagnosis_date<td(01jan2017) & cvd==1

gen hyperkalemia_jan17=0
replace hyperkalemia_jan17=1 if hyperkalemia_diagnosis_date<td(01jan2017) & hyperkalemia==1

gen sleep_apnoea_jan17=0
replace sleep_apnoea_jan17=1 if sleep_apnoea_diagnosis_date<td(01jan2017) & sleep_apnoea==1

gen hyperthyroidism_jan17=0
replace hyperthyroidism_jan17=1 if hyperthyroidism_diagnosis_date<td(01jan2017) & hyperthyroidism==1

gen hypothyroidism_jan17=0
replace hypothyroidism_jan17=1 if hypothyroid_diagnosis_date<td(01jan2017) & hypothyroid==1

gen asthma_jan17=0
replace asthma_jan17=1 if asthma_diagnosis_date<td(01jan2017) & asthma==1

gen currentsmoker_jan17=0
replace currentsmoker_jan17=1 if smoking_diagnosis_date<td(01jan2017) & smokstat==2


gen highdrinker_jan17=0
replace highdrinker_jan17=1 if alcohol_intake_diagnosis_date<td(01jan2017) & alcohol_level=="High"


gen bronchiectasis_jan17=0
replace bronchiectasis_jan17=1 if bronchiectasis_diagnosis_date<td(01jan2017) & bronchiectasis==1


gen lipid_disorder_jan17=0
replace lipid_disorder_jan17=1 if lipid_disorders_diagnosis_date<td(01jan2017) & lipid_disorders==1

gen lipid_disorder_med_jan17=lipid_disorder_jan17
replace lipid_disorder_med_jan17=1 if (lipid_lowering_drugs_jan17==1 )

gen anaemia_jan17=0
replace anaemia_jan17=1 if anaemia_diagnosis_date<td(01jan2017) & anaemia==1

gen diabetic_neuro_jan17=0
replace diabetic_neuro_jan17=1 if diabetic_neuro_diagnosis_date<td(01jan2017) & diabetic_neuro==1

gen diabetic_retino_jan17=0
replace diabetic_retino_jan17=1 if diabetic_retino_diagnosis_date<td(01jan2017) & diabetic_retino==1


gen hypotension_dec19=0
replace hypotension_dec19=1 if hypotension_diagnosis_date<td(31dec2019) & hypotension==1

gen stroke_dec19=0
replace stroke_dec19=1 if stroke_diagnosis_date<td(31dec2019) & stroke==1

gen mi_dec19=0
replace mi_dec19=1 if mi_diagnosis_date<td(31dec2019) & mi==1

gen af_dec19=0
replace af_dec19=1 if af_diagnosis_date<td(31dec2019) & af==1

gen angina_dec19=0
replace angina_dec19=1 if angina_diagnosis_date<td(31dec2019) & angina==1

gen copd_dec19=0
replace copd_dec19=1 if copd_diagnosis_date<td(31dec2019) & copd==1

gen anaemia_dec19=0
replace anaemia_dec19=1 if anaemia_diagnosis_date<td(31dec2019) & anaemia==1

gen diabetic_neuro_dec19=0
replace diabetic_neuro_dec19=1 if diabetic_neuro_diagnosis_date<td(31dec2019) & diabetic_neuro==1

gen diabetic_retino_dec19=0
replace diabetic_retino_dec19=1 if diabetic_retino_diagnosis_date<td(31dec2019) & diabetic_retino==1





gen cvd_dec19=0
replace cvd_dec19=1 if cvd_diagnosis_date<td(31dec2019) & cvd==1

gen hyperkalemia_dec19=0
replace hyperkalemia_dec19=1 if hyperkalemia_diagnosis_date<td(31dec2019) & hyperkalemia==1

gen sleep_apnoea_dec19=0
replace sleep_apnoea_dec19=1 if sleep_apnoea_diagnosis_date<td(31dec2019) & sleep_apnoea==1

gen hyperthyroidism_dec19=0
replace hyperthyroidism_dec19=1 if hyperthyroidism_diagnosis_date<td(31dec2019) & hyperthyroidism==1

gen hypothyroidism_dec19=0
replace hypothyroidism_dec19=1 if hypothyroid_diagnosis_date<td(31dec2019) & hypothyroid==1

gen asthma_dec19=0
replace asthma_dec19=1 if asthma_diagnosis_date<td(31dec2019) & asthma==1

gen bronchiectasis_dec19=0
replace bronchiectasis_dec19=1 if bronchiectasis_diagnosis_date<td(31dec2019) & bronchiectasis==1


gen lipid_disorder_dec19=0
replace lipid_disorder_dec19=1 if lipid_disorders_diagnosis_date<td(31dec2019) & lipid_disorders==1

gen lipid_disorder_med_dec19=lipid_disorder_dec19
replace lipid_disorder_med_dec19=1 if (lipid_lowering_drugs_dec19==1 )


/*meds across time*/
do "H:\ABC_CKD\Dataset\create sglt2i 1st July 2017.do"

do "H:\ABC_CKD\Dataset\create sglt2i 1st Jan 2018.do"

do "H:\ABC_CKD\Dataset\create sglt2i 1st July 2018.do"

do "H:\ABC_CKD\Dataset\create sglt2i 1st Jan 2019.do"

do "H:\ABC_CKD\Dataset\create sglt2i 1st July 2019.do"

do "H:\ABC_CKD\Dataset\create sglt2i 31st Dec 2019.do"

replace sglt2i_jan19=0 if sglt2i_jan19==.
replace sglt2i_july18=0 if sglt2i_july18==.
replace sglt2i_jan18=0 if sglt2i_jan18==.
replace sglt2i_july19=0 if sglt2i_july19==.
replace sglt2i_july17=0 if sglt2i_july17==.
replace sglt2i_dec19=0 if sglt2i_dec19==.

do "H:\ABC_CKD\Dataset\create mras 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create mras 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create mras 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create mras 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create mras 1st July 2019.do"
do "H:\ABC_CKD\Dataset\create mras 31st Dec 2019.do"

replace mras_jan19=0 if mras_jan19==.
replace mras_july18=0 if mras_july18==.
replace mras_jan18=0 if mras_jan18==.
replace mras_july19=0 if mras_july19==.
replace mras_july17=0 if mras_july17==.
replace mras_dec19=0 if mras_dec19==.

do "H:\ABC_CKD\Dataset\create ace inhibitor 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create ace inhibitor 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create ace inhibitor 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create ace inhibitor 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create ace inhibitor 1st July 2019.do"
do "H:\ABC_CKD\Dataset\create ace inhibitor 31st Dec 2019.do"

replace acei_jan19=0 if acei_jan19==.
replace acei_july18=0 if acei_july18==.
replace acei_jan18=0 if acei_jan18==.
replace acei_july19=0 if acei_july19==.
replace acei_july17=0 if acei_july17==.
replace acei_dec19=0 if acei_dec19==.

do "H:\ABC_CKD\Dataset\create arbs 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create arbs 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create arbs 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create arbs 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create arbs 1st July 2019.do"
do "H:\ABC_CKD\Dataset\create arbs 31st Dec 2019.do"

replace arbs_jan19=0 if arbs_jan19==.
replace arbs_july18=0 if arbs_july18==.
replace arbs_jan18=0 if arbs_jan18==.
replace arbs_july19=0 if arbs_july19==.
replace arbs_july17=0 if arbs_july17==.
replace arbs_dec19=0 if arbs_dec19==.

do "H:\ABC_CKD\Dataset\create beta blockers 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create beta blockers 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create beta blockers 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create beta blockers 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create beta blockers 1st July 2019.do"
do "H:\ABC_CKD\Dataset\create beta blockers 31st Dec 2019.do"

do "H:\ABC_CKD\Dataset\create calcium channel blockers 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create calcium channel blockers 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create calcium channel blockers 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create calcium channel blockers 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create calcium channel blockers 1st July 2019.do"
do "H:\ABC_CKD\Dataset\create calcium channel blockers 31st Dec 2019.do"

do "H:\ABC_CKD\Dataset\create oral diuretics 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create oral diuretics 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create oral diuretics 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create oral diuretics 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create oral diuretics 1st July 2019.do"

do "H:\ABC_CKD\Dataset\create ddp4 31st Dec 2019.do"
do "H:\ABC_CKD\Dataset\create glp_1 31st Dec 2019.do"


do "H:\ABC_CKD\Dataset\create ddp4 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create ddp4 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create ddp4 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create ddp4 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create ddp4 1st July 2019.do"

do "H:\ABC_CKD\Dataset\create glp_1 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create glp_1 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create glp_1 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create glp_1 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create glp_1 1st July 2019.do"

do "H:\ABC_CKD\Dataset\create oral diuretics 1st July 2017.do"
do "H:\ABC_CKD\Dataset\create oral diuretics 1st Jan 2018.do"
do "H:\ABC_CKD\Dataset\create oral diuretics 1st July 2018.do"
do "H:\ABC_CKD\Dataset\create oral diuretics 1st Jan 2019.do"
do "H:\ABC_CKD\Dataset\create oral diuretics 1st July 2019.do"


do "H:\ABC_CKD\Dataset\create biguanides 1st Jan 2017.do"
do "H:\ABC_CKD\Dataset\create biguanides 31st Dec 2019.do"

do "H:\ABC_CKD\Dataset\create acarbose 1st Jan 2017.do"
do "H:\ABC_CKD\Dataset\create acarbose 31st Dec 2019.do"

do "H:\ABC_CKD\Dataset\create sulfonureas 1st Jan 2017.do"
do "H:\ABC_CKD\Dataset\create sulfonureas 31st Dec 2019.do"

replace betablockers_jan19=0 if betablockers_jan19==.
replace betablockers_july18=0 if betablockers_july18==.
replace betablockers_jan18=0 if betablockers_jan18==.
replace betablockers_july19=0 if betablockers_july19==.
replace betablockers_july17=0 if betablockers_july17==.
replace betablockers_dec19=0 if betablockers_dec19==.

replace calciumchannelblockers_jan19=0 if calciumchannelblockers_jan19==.
replace calciumchannelblockers_july18=0 if calciumchannelblockers_july18==.
replace calciumchannelblockers_jan18=0 if calciumchannelblockers_jan18==.
replace calciumchannelblockers_july19=0 if calciumchannelblockers_july19==.
replace calciumchannelblockers_july17=0 if calciumchannelblockers_july17==.
replace calciumchannelblockers_dec19=0 if calciumchannelblockers_dec19==.

replace ddp4_jan19=0 if ddp4_jan19==.
replace ddp4_july18=0 if ddp4_july18==.
replace ddp4_jan18=0 if ddp4_jan18==.
replace ddp4_july19=0 if ddp4_july19==.
replace ddp4_july17=0 if ddp4_july17==.
replace ddp4_dec19=0 if ddp4_dec19==.

replace glp_1_jan19=0 if glp_1_jan19==.
replace glp_1_july18=0 if glp_1_july18==.
replace glp_1_jan18=0 if glp_1_jan18==.
replace glp_1_july19=0 if glp_1_july19==.
replace glp_1_july17=0 if glp_1_july17==.
replace glp_1_dec19=0 if glp_1_dec19==.

replace oral_diuretics_jan19=0 if oral_diuretics_jan19==.
replace oral_diuretics_july18=0 if oral_diuretics_july18==.
replace oral_diuretics_jan18=0 if oral_diuretics_jan18==.
replace oral_diuretics_july19=0 if oral_diuretics_july19==.
replace oral_diuretics_july17=0 if oral_diuretics_july17==.

replace oral_diuretics_dec19=0 if oral_diuretics_dec19==.

replace lipid_lowering_drugs_dec19=0 if lipid_lowering_drugs_dec19==.

replace antiplatelets_dec19=0 if antiplatelets_dec19==.

replace insulin_dec19=0 if insulin_dec19==.
replace insulin_jan17=0 if insulin_jan17==.

replace biguanides_dec19=0 if biguanides_dec19==.
replace biguanides_jan17=0 if biguanides_jan17==.

replace acarbose_dec19=0 if acarbose_dec19==.
replace acarbose_jan17=0 if acarbose_jan17==.

replace sulfonureas_dec19=0 if sulfonureas_dec19==.
replace sulfonureas_jan17=0 if sulfonureas_jan17==.

gen cvd_general_jan17=1 if (cvd_jan17==1 | mi_jan17==1 | stroke_jan17==1 | angina_jan17==1 | pad_jan17==1)
replace cvd_general_jan17=0 if cvd_general_jan17==.

gen cvd_general_dec19=1 if (cvd_dec19==1 | mi_dec19==1 | stroke_dec19==1 | angina_dec19==1 | pad_dec19==1)
replace cvd_general_dec19=0 if cvd_general_dec19==.


/*variables to indicate creatine and ACR testing in past year*/
gen creatinine_jan16=1 if serum_creatine_1!=. & creatinine_measurement_date>=td(1jan2016) & creatinine_measurement_date<=td(1jan2017)
replace creatinine_jan16=0 if creatinine_jan16==.

gen uacr_jan16=1 if albuminuria!=. & ACR_measurement_date>=td(1jan2016) & ACR_measurement_date<=td(1jan2017)
replace uacr_jan16=0 if uacr_jan16==.

gen creatinine_dec18=1 if serum_creatine_7!=. & creatinine_measurement_date_7>=td(31dec2018) & creatinine_measurement_date<=td(31dec2019)
replace creatinine_dec18=0 if creatinine_dec18==.

gen uacr_dec18=1 if albuminuria_7!=. & ACR_measurement_date_7>=td(31dec2018) & ACR_measurement_date_7<=td(31dec2019)
replace uacr_dec18=0 if uacr_dec18==.

* make an age at entry to cohort 1st Jan 2017 variable
	gen age_jan2017=0
	replace age_jan2017= 2017- yob 
	
egen age_group_jan2017=cut(age_jan2017), at (0, 18, 30, 40, 50, 60, 70, 80, 90, 120)

recode age_group_jan2017 0=0 18=1 30=2 40=3 50=4 60=5 70=6 80=7 90=8
label define age_group_10 0"<18" 1"18-29" 2"30-39" 3"40-49" 4"50-59" 5"60-69" 6"70-79" 7"80-89" 8"90+"
label values age_group_jan2017 age_group_10

* make an age at entry to cohort 1st Jan 2017 variable
	gen age_jan2017=0
	replace age_jan2017= 2017- yob 
	
egen age_group_jan2017=cut(age_jan2017), at (0, 18, 30, 40, 50, 60, 70, 80, 90, 120)

recode age_group_jan2017 0=0 18=1 30=2 40=3 50=4 60=5 70=6 80=7 90=8
label define age_group_10 0"<18" 1"18-29" 2"30-39" 3"40-49" 4"50-59" 5"60-69" 6"70-79" 7"80-89" 8"90+"
label values age_group_jan2017 age_group_10

* make an age at exit to cohort 1st Jan 2020 variable
	gen age_jan2020=0
	replace age_jan2020= 2020- yob 
	
egen age_group_jan2020=cut(age_jan2020), at (0, 18, 30, 40, 50, 60, 70, 80, 90, 120)

recode age_group_jan2020 0=0 18=1 30=2 40=3 50=4 60=5 70=6 80=7 90=8

label values age_group_jan2020 age_group_10


/*ckd at different time points variables*/
replace egfr_2=. if creatinine_measurement_date_2<td(01july2015)
replace egfr_3=. if creatinine_measurement_date_3<td(01jan2016)
replace egfr_4=. if creatinine_measurement_date_4<td(01july2016)
replace egfr_5=. if creatinine_measurement_date_5<td(01jan2017)
replace egfr_6=. if creatinine_measurement_date_6<td(01july2017)
replace egfr_7=. if creatinine_measurement_date_7<td(31dec2017)

replace egfr_bin_2=. if creatinine_measurement_date_2<td(01july2015)
replace egfr_bin_3=. if creatinine_measurement_date_3<td(01jan2016)
replace egfr_bin_4=. if creatinine_measurement_date_4<td(01july2016)
replace egfr_bin_5=. if creatinine_measurement_date_5<td(01jan2017)
replace egfr_bin_6=. if creatinine_measurement_date_6<td(01july2017)
replace egfr_bin_7=. if creatinine_measurement_date_7<td(31dec2017)

replace albuminuria_2=. if ACR_measurement_date_2<td(01july2015)
replace albuminuria_3=. if ACR_measurement_date_3<td(01jan2016)
replace albuminuria_4=. if ACR_measurement_date_4<td(01july2016)
replace albuminuria_5=. if ACR_measurement_date_5<td(01jan2017)
replace albuminuria_6=. if ACR_measurement_date_6<td(01july2017)
replace albuminuria_7=. if ACR_measurement_date_7<td(31dec2017)

replace ckd_7=. if creatinine_measurement_date_7<td(31dec2017)
replace uacr_7=. if ACR_measurement_date_7<td(31dec2017)

gen denominator1_jan2017=1 if (egfr!=. | albuminuria!=.)
gen denominator1_july2017=1 if (egfr_2!=. | albuminuria_2!=.)
gen denominator1_jan2018=1 if (egfr_3!=. | albuminuria_3!=.)
gen denominator1_july2018=1 if (egfr_4!=. | albuminuria_4!=.)
gen denominator1_jan2019=1 if (egfr_5!=. | albuminuria_5!=.)
gen denominator1_july2019=1 if (egfr_6!=. | albuminuria_6!=.)
gen denominator1_dec2019=1 if (egfr_7!=. | albuminuria_7!=.)


gen ckd_composite_1=.
replace ckd_composite_1=0 if (egfr>60 & egfr<.)
replace ckd_composite_1=1 if egfr<=60 & egfr<.
replace ckd_composite_1=1 if albuminuria==1
replace ckd_composite_1=0 if albuminuria==0 & egfr==.


gen ckd_composite_2=.
replace ckd_composite_2=0 if (egfr_2>60 & egfr_2<.)
replace ckd_composite_2=1 if egfr_2<=60 & egfr_2<.
replace ckd_composite_2=1 if albuminuria_2==1
replace ckd_composite_2=0 if albuminuria_2==0 & egfr_2==.



gen ckd_composite_3=.
replace ckd_composite_3=0 if (egfr_3>60 & egfr_3<.)
replace ckd_composite_3=1 if egfr_3<=60 & egfr_3<.
replace ckd_composite_3=1 if albuminuria_3==1
replace ckd_composite_3=0 if albuminuria_3==0 & egfr_3==.


gen ckd_composite_4=.
replace ckd_composite_4=0 if (egfr_4>60 & egfr_4<.)
replace ckd_composite_4=1 if egfr_4<=60 & egfr_4<.
replace ckd_composite_4=1 if albuminuria_4==1
replace ckd_composite_4=0 if albuminuria_4==0 & egfr_4==.


gen ckd_composite_5=.
replace ckd_composite_5=0 if (egfr_5>60 & egfr_5<.)
replace ckd_composite_5=1 if egfr_5<=60 & egfr_5<.
replace ckd_composite_5=1 if albuminuria_5==1
replace ckd_composite_5=0 if albuminuria_5==0 & egfr_5==.


gen ckd_composite_6=.
replace ckd_composite_6=0 if (egfr_6>60 & egfr_6<.)
replace ckd_composite_6=1 if egfr_6<=60 & egfr_6<.
replace ckd_composite_6=1 if albuminuria_6==1
replace ckd_composite_6=0 if albuminuria_6==0 & egfr_6==.

gen ckd_composite_7=.
replace ckd_composite_7=0 if (egfr_7>60 & egfr_7<.)
replace ckd_composite_7=1 if egfr_7<=60 & egfr_7<.
replace ckd_composite_7=1 if albuminuria_7==1
replace ckd_composite_7=0 if albuminuria_7==0 & egfr_7==.


gen fidelio_jan17=.
replace fidelio_jan17=1 if uacr==2 & egfr>=25 & egfr<60
replace fidelio_jan17=1 if uacr==3 & egfr>=25 & egfr<75
replace fidelio_jan17=0 if fidelio_jan17!=1 & egfr!=. & uacr!=.


gen fidelio_dec19=.
replace fidelio_dec19=1 if uacr_7==2 & egfr_7>=25 & egfr_7<60
replace fidelio_dec19=1 if uacr_7==3 & egfr_7>=25 & egfr_7<75
replace fidelio_dec19=0 if fidelio_dec19!=1 & egfr_7!=. & uacr_7!=.

gen figaro_jan17=.
replace figaro_jan17=1 if uacr==2 & egfr>=25 & egfr<90
replace figaro_jan17=1 if uacr==3 & egfr>=60 & egfr!=.
replace figaro_jan17=0 if figaro_jan17!=1 & egfr!=. & uacr!=.

gen figaro_dec19=.
replace figaro_dec19=1 if uacr_7==2 & egfr_7>=25 & egfr_7<90
replace figaro_dec19=1 if uacr_7==3 & egfr_7>=60 & egfr_7!=.
replace figaro_dec19=0 if figaro_dec19!=1 & egfr_7!=. & uacr_7!=.


/*generate marker of ckd incidence and date of incident ckd*/
"H:\ABC_CKD\Dataset\Gen CKD incidence variables.do"

/*merging the linked data*/
merge 1:1 patid using "Z:\Group_work\ABC_CKD\Linked data\Results\Results\Aurum_linked\Final\death_patient_20_000167_DM_stata.dta"
drop _merge

merge 1:1 patid using "Z:\Group_work\ABC_CKD\Linked data\Results\Results\Aurum_linked\Final\patient_imd2015_20_000167_stata.dta"
drop  _merge

merge 1:1 patid using "Z:\Group_work\ABC_CKD\Linked data\Results\Results\Aurum_linked\Final\hes_procedures_epi_20_000167_DM_stata.dta"
drop _merge

do "H:\ABC_CKD\Dataset\Generate cause of death variable.do"


save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace