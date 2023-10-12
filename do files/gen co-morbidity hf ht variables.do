/* Gen indicator of HT & HF co-morbidity*/

gen co_morbidity_jan17=.
replace co_morbidity_jan17=0 if hypertension_med_jan17==0 & hf_jan17==0 & (ckd_composite==0 | ckd_composite==.)
replace co_morbidity_jan17=1 if hypertension_med_jan17==1 & hf_jan17==0 & (ckd_composite==0 | ckd_composite==.)
replace co_morbidity_jan17=2 if hypertension_med_jan17==0 & hf_jan17==1 & (ckd_composite==0 | ckd_composite==.)
replace co_morbidity_jan17=3 if hypertension_med_jan17==1 & hf_jan17==1 & (ckd_composite==0 | ckd_composite==.)
replace co_morbidity_jan17=4 if hypertension_med_jan17==0 & hf_jan17==0 & ckd_composite==1
replace co_morbidity_jan17=5 if hypertension_med_jan17==1 & hf_jan17==0 & ckd_composite==1 
replace co_morbidity_jan17=6 if hypertension_med_jan17==0 & hf_jan17==1 & ckd_composite==1
replace co_morbidity_jan17=7 if hypertension_med_jan17==1 & hf_jan17==1 & ckd_composite==1

label define co_morbidity 0"No HT, HF, CKD" 1"HT only" 2"HF only" 3"HT & HF, no CKD" 4"CKD only" 5"HT & CKD" 6 "HF & CKD" 7"HT, HF, CKD"

label values co_morbidity_jan17 co_morbidity 


gen hf_july17=0
replace hf_july17=1 if hf_diagnosis_date<td(01july2017) & hf==1

gen hf_jan18=0
replace hf_jan18=1 if hf_diagnosis_date<td(01jan2018) & hf==1

gen hf_july18=0
replace hf_july18=1 if hf_diagnosis_date<td(01july2018) & hf==1

gen hf_jan19=0
replace hf_jan19=1 if hf_diagnosis_date<td(01jan2019) & hf==1

gen hf_july19=0
replace hf_july19=1 if hf_diagnosis_date<td(01july2019) & hf==1

gen hf_dec19=0
replace hf_dec19=1 if hf_diagnosis_date<td(31dec2019) & hf==1


gen hypertension_med_july17=hypertension_july17
replace hypertension_med_july17=1 if (acei_july17==1 | arbs_july17==1 |  betablockers_july17==1 | calciumchannelblockers_july17==1 | oral_diuretics_july17==1)

gen hypertension_med_jan18=hypertension_jan18
replace hypertension_med_jan18=1 if (acei_jan18==1 | arbs_jan18==1 |  betablockers_jan18==1 | calciumchannelblockers_jan18==1 | oral_diuretics_jan18==1)

gen hypertension_med_july18=hypertension_july18
replace hypertension_med_july18=1 if (acei_july18==1 | arbs_july18==1 |  betablockers_july18==1 | calciumchannelblockers_july18==1 | oral_diuretics_july18==1)

gen hypertension_med_jan19=hypertension_jan19
replace hypertension_med_jan19=1 if (acei_jan19==1 | arbs_jan19==1 |  betablockers_jan19==1 | calciumchannelblockers_jan19==1 | oral_diuretics_jan19==1)

gen hypertension_med_july19=hypertension_july19
replace hypertension_med_july19=1 if (acei_july19==1 | arbs_july19==1 |  betablockers_july19==1 | calciumchannelblockers_july19==1 | oral_diuretics_july19==1)



