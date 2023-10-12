/*baseline table*/

preserve

drop  if cprd_ddate<td(01jan2017)
drop if regenddate<td(1jan2017)

count if age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

count if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

count if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

count if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1

/*Table 1 - baseline characteristics of the study participants at baseline (1st Jan 2017)*/
tab gender if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab gender if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

sum age_jan2017 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

sum age_jan2017 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab age_group_jan2017 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab age_group_jan2017 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

bysort ckd_composite_1: sum age_jan2017 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)


tab eth5 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab eth5 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis

tab eth5 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab eth5 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=., mis


tab hypertension_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1 

tab hypertension_med_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab bmi_cat_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1, mis

tab bmi_cat_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=., mis

sum hba1c_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1, detail

sum hba1c_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1 & ckd_composite_1!=., detail

sum serum_potassium_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1, detail

sum serum_potassium_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1 & ckd_composite_1!=., detail



tab potassium_cat_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1, mis

tab potassium_cat_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=., mis

sum sbp_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1 , detail

sum sbp_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1 & ckd_composite_1!=., detail


tab hypertension_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &  & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & hes_e==1 & death_e==1 & ckd_composite_1!=.

tab hypertension_med_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.


tab hypotension_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 


tab hypotension_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1  & ckd_composite_1!=.

tab hf_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 


tab hf_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1  & ckd_composite_1!=.

tab copd if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) &copd_diagnosis_date<td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab angina_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab angina_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.


tab af_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 


tab af_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.

tab mi_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab mi_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.

tab cvd_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab cvd_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1  & ckd_composite_1!=.


tab cvd_general_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab cvd_general_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017)  & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1  & ckd_composite_1!=.

tab stroke_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab stroke_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.


tab diabetic_neuro_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab diabetic_neuro_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.

tab diabetic_retino_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab diabetic_retino_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.

tab anaemia_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab anaemia_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.

tab copd_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab copd_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.

tab pad_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab pad_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 & ckd_composite_1!=.



tab hyperthyroidism if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & hyperthyroidism_diagnosis_date<td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 
tab hypothyroid if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & hypothyroid_diagnosis_date<td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 
tab sleep_apnoea if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & sleep_apnoea_diagnosis_date<td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 
tab lipid_disorders if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & lipid_disorders_diagnosis_date<td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 
tab hyperkalemia if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & hyperkalemia_diagnosis_date<td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 
tab bronchiectasis if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & bronchiectasis_diagnosis_date<td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 
tab asthma if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & asthma_diagnosis_date<td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab hf if date_diabetes<td(01jan2017) & age_jan2017>=18 & cprd_ddate>td(01jan2017) & hf_diagnosis_date<td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hes_e==1 & death_e==1 

tab uacr if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis

tab uacr if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=., mis

tab ckd if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis

tab ckd if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=., mis

tab figaro_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis

tab figaro_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=., mis

tab fidelio_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis

tab fidelio_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=., mis


tab egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis

tab egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=., mis


tab albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis

tab albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=., mis


tab ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)
tab ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & albuminuria<2 & egfr<. & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab lipid_disorder_med_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab lipid_disorder_med_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.


tab acei_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) 

tab acei_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab arbs_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab arbs_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab acei_arb_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab acei_arb_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab mras_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) 

tab mras_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate> td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.


tab sglt2i_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab sglt2i_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & sglt2i_jan17!=. & ckd_composite_1!=.


tab ddp4_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab ddp4_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab glp_1_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) 

tab glp_1_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.


tab lipid_lowering_drugs_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab lipid_lowering_drugs_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.


tab betablockers_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab betablockers_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.


tab calciumchannelblockers_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab calciumchannelblockers_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.


tab oral_diuretics_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab oral_diuretics_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.


tab antiplatelets_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab antiplatelets_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab insulin_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab insulin_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab biguanides_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab biguanides_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab sulfonureas_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab sulfonureas_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=.

tab ckd_composite age_group_jan2017 if date_diabetes<td(01jan2017) & age_jan2017>=18 & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


/*Table 1 row percentages*/
tab gender ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row

tab gender ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row

tab gender ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab age_group_jan2017 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row

tab age_group_jan2017 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row

tab age_group_jan2017 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab eth5 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis row chi

tab eth5 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=., mis row chi

tab eth5 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1!=., mis col chi


tab bmi_cat_1 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi

tab bmi_cat_1 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab bmi_cat_1 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col mis

tab potassium_cat_1 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi

tab potassium_cat_1 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab potassium_cat_1 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col mis

sum serum_potassium_1  if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1, detail

sum sbp_1  if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1, detail


sum hba1c_1  if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1, detail

tab cvd_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi

tab cvd_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab cvd_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab cvd_general_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi

tab cvd_general_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab cvd_general_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab hypotension_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi

tab hypotension_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab hypotension_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab angina_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi

tab angina_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab angina_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab lipid_disorder_med_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi

tab lipid_disorder_med_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab lipid_disorder_med_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col



tab hf_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab hf_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab hf_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab hypertension_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi

tab hypertension_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab hypertension_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab hypertension_med_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi

tab hypertension_med_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab hypertension_med_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab stroke_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab stroke_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi


tab stroke_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab diabetic_neuro_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab diabetic_neuro_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab diabetic_neuro_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab pad_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab pad_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab pad_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col



tab diabetic_retino_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab diabetic_retino_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab diabetic_retino_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab anaemia_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab anaemia_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab anaemia_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab copd_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab copd_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab copd_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab mi_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab mi_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab mi_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab af_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab af_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab af_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab copd_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab copd_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi


tab asthma_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab asthma_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab sleep_apnoea_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab hyperthyroidism_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab hypothyroidism_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab hyperkalemia_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab bronchiectasis_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab uacr egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi 

tab uacr egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis row chi 


tab acei_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab acei_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab acei_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi


tab arbs_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab arbs_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab arbs_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab acei_arb_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab acei_arb_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab acei_arb_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab acei_arb_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & hypertension_jan17==1 & albuminuria==1, col

tab mras_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab mras_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab mras_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab sglt2i_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab sglt2i_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab sglt2i_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab ddp4_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab ddp4_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab ddp4_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab glp_1_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab glp_1_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab glp_1_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab betablockers_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab betablockers_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab betablockers_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab calciumchannelblockers_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab calciumchannelblockers_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab calciumchannelblockers_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab lipid_lowering_drugs_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab lipid_lowering_drugs_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab lipid_lowering_drugs_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab oral_diuretics_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab oral_diuretics_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab oral_diuretics_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab antiplatelets_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab antiplatelets_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab antiplatelets_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab insulin_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab insulin_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab insulin_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab biguanides_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab biguanides_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab biguanides_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


tab sulfonureas_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016),mis  row chi

tab sulfonureas_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), row chi

tab sulfonureas_jan17 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col



tab creatinine_jan16 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col

tab uacr_jan16 ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col


/*Table 3*/

tab acei_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab acei_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab acei_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab arbs_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab arbs_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab arbs_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab mras_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab mras_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab mras_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab sglt2i_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab sglt2i_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab sglt2i_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi


tab ddp4_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab ddp4_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab ddp4_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab glp_1_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab glp_1_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab glp_1_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab betablockers_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) 


tab betablockers_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab betablockers_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

tab calciumchannelblockers_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab calciumchannelblockers_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab calciumchannelblockers_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi


tab lipid_lowering_drugs_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab lipid_lowering_drugs_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab lipid_lowering_drugs_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi


tab oral_diuretics_jan17 egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab oral_diuretics_jan17 albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi
tab oral_diuretics_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), col chi

/*table 3a*/
/*ace inhibitors*/
tab  acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

tab hypertension_dec19 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab hf_dec19 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row


tab cvd_general_dec19 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_dec19 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab albuminuria_7 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab albuminuria_7 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab fidelio_dec19 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab fidelio_dec19 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab figaro_dec19 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab figaro_dec19 acei_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis


/*arbs*/
tab  arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

tab hypertension_dec19 arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_dec19 arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_general_dec19 arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab hf_dec19 arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row


tab albuminuria_7 arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab albuminuria_7 arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab fidelio_dec19 arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab fidelio_dec19 arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab figaro_dec19 arbs_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

/*beta blockers*/
tab  betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

tab hypertension_dec19 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row


tab cvd_dec19 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_general_dec19 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab hf_dec19 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab albuminuria_7 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab albuminuria_7 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab fidelio_dec19 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab fidelio_dec19 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab figaro_dec19 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab figaro_dec19 betablockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

/*calcium channel blockers*/
tab  calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

tab hypertension_dec19 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row


tab hf_dec19 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_dec19 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_general_dec19 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab albuminuria_7 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab albuminuria_7 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab fidelio_dec19 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab fidelio_dec19 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab figaro_dec19 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab figaro_dec19 calciumchannelblockers_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

/*oral diuretics*/
tab  oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

tab hypertension_dec19 oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row


tab hf_dec19 oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_dec19 oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_general_dec19 oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab albuminuria_7 oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab albuminuria_7 oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab fidelio_dec19 oral_diuretics_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab fidelio_dec19 oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab figaro_dec19 oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab figaro_dec19 oral_diuretics_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

/*ddp4*/
tab  ddp4_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

tab hypertension_dec19 ddp4_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab hf_dec19 ddp4_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_dec19 ddp4_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_general_dec19 ddp4_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row


tab albuminuria_7 ddp4_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab albuminuria_7 ddp4_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab fidelio_dec19 ddp4_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab fidelio_dec19 ddp4_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab figaro_dec19 ddp4_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab figaro_dec19 ddp4_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

/*sglt2i*/
tab  sglt2i_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

tab hypertension_dec19 sglt2i_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab hf_dec19 sglt2i_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_dec19 sglt2i_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_general_dec19 sglt2i_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab albuminuria_7 sglt2i_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab albuminuria_7 sglt2i_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab fidelio_dec19 sglt2i_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab fidelio_dec19 sglt2i_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab figaro_dec19 sglt2i_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab figaro_dec19 sglt2i_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

/*GLP-1*/
tab  glp_1_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

tab hypertension_dec19 glp_1_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab hf_dec19 glp_1_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_dec19 glp_1_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_general_dec19 glp_1_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab albuminuria_7 glp_1_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab albuminuria_7 glp_1_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab fidelio_dec19 glp_1_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab fidelio_dec19 glp_1_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab figaro_dec19 glp_1_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab figaro_dec19 glp_1_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

/*MRAS*/
tab  mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

tab hypertension_dec19 mras_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab hf_dec19 mras_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab cvd_general_dec19 mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row


tab cvd_dec19 mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row

tab albuminuria_7 mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab albuminuria_7 mras_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab fidelio_dec19 mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab fidelio_dec19 mras_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis

tab figaro_dec19 mras_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row
tab figaro_dec19 mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, row mis



/*table 4*/
/*time point 1 1st Jan 2017*/
count if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab egfr_bin if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab ckd if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab egfr_bin albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & denominator1_jan2017==1,mis

tab ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & denominator1_jan2017==1

tab ckd_composite_1 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), mis


tab ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd!=. & albuminuria!=.


/*time point 2 1st July 2017*/
count if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017) & regenddate>td(1july2017) & regstartdate<td(1july2016)

tab egfr_bin_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017) & creatinine_measurement_date_2>td(01jul2015) & regenddate>td(1july2017) & regstartdate<td(1july2016)

tab ckd_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017) & creatinine_measurement_date_2>td(01jul2015) & regenddate>td(1july2017) & regstartdate<td(1july2016)

tab egfr_bin_2 albuminuria_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & denominator1_july2017==1, mis


tab ckd_composite_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & denominator1_july2017==1


tab ckd_composite_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) , mis



/*time point 3 1st Jan 2018*/
count if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab egfr_bin_3 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018)  & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab ckd_3 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018)  & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab ckd_composite_3 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018)  & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab ckd_composite_3 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017), mis


/*4th time point 1st July 2018*/
count if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(1july2018) & regstartdate<td(1july2017)

tab egfr_bin_4 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & creatinine_measurement_date_4>td(01july2016) & regenddate>td(1july2018) & regstartdate<td(1july2017)


tab ckd_4 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & creatinine_measurement_date_4>td(01july2016) & regenddate>td(1july2018) & regstartdate<td(1july2017)

tab ckd_composite_4 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & creatinine_measurement_date_4>td(01july2016) & regenddate>td(1july2018) & regstartdate<td(1july2017)

tab ckd_composite_4 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & creatinine_measurement_date_4>td(01july2016) & regenddate>td(1july2018) & regstartdate<td(1july2017) & ckd_4!=. & albuminuria_4!=.


/*5th time point 1st Jan 2019*/
count if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(1jan2019) & regstartdate<td(1jan2018)


tab egfr_bin_5 if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & creatinine_measurement_date_5>td(01jan2017) & regenddate>td(1jan2019) & regstartdate<td(1jan2018)


tab ckd_5 if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & creatinine_measurement_date_5>td(01jan2017) & regenddate>td(1jan2019) & regstartdate<td(1jan2018)


tab ckd_composite_5 if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & creatinine_measurement_date_5>td(01jan2017) & regenddate>td(1jan2019) & regstartdate<td(1jan2018)

tab ckd_composite_5 if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & creatinine_measurement_date_5>td(01jan2017) & regenddate>td(1jan2019) & regstartdate<td(1jan2018) &ckd_5!=. & albuminuria_5!=.

/*6th time point 1st July 2019*/
count if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(1july2019) & regstartdate<td(1july2019) & regenddate>td(1july2019) & regstartdate<td(1july2018)



tab egfr_bin_6 if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & creatinine_measurement_date_6>td(01july2017) & regenddate>td(1july2019) & regstartdate<td(1july2018)



tab ckd_6 if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & creatinine_measurement_date_6>td(01july2017) & regenddate>td(1july2019) & regstartdate<td(1july2018)

tab ckd_composite_6 if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & creatinine_measurement_date_6>td(01july2017) & regenddate>td(1july2019) & regstartdate<td(1july2018)

tab ckd_composite_6 if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & creatinine_measurement_date_6>td(01july2017) & regenddate>td(1july2019) & regstartdate<td(1july2018) & ckd_6!=. & albuminuria_6!=.


/*7th time point 31st Dec 2019*/
count if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab egfr_bin_7 if date_diabetes<td(31dec2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & creatinine_measurement_date_7>td(31dec2017) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)


tab ckd_7 if date_diabetes<td(31dec2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & creatinine_measurement_date_7>td(31dec2017) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & creatinine_measurement_date_7>td(31dec2017) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & creatinine_measurement_date_7>td(31dec2017) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_7!=. & albuminuria!=.


/*table 5 - albuminuria across time*/
/*time point 1 1st Jan 2017*/
count if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab uacr if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab ckd uacr if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), cell

/*time point 2 1st July 2017*/
count if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016)

tab albuminuria_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017) & creatinine_measurement_date_2>td(01jul2015)  & regenddate>td(1july2017) & regstartdate<td(1july2016)

tab uacr_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017) & creatinine_measurement_date_2>td(01jul2015)  & regenddate>td(1july2017) & regstartdate<td(1july2016)

tab egfr_kidgo_2 uacr_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017) & creatinine_measurement_date_2>td(01jul2015)  & regenddate>td(1july2017) & regstartdate<td(1july2016)

/*time point 3 1st Jan 2018*/
count if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab albuminuria_3 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & creatinine_measurement_date_3>td(01jan2016) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab uacr_3 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & creatinine_measurement_date_3>td(01jan2016) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab egfr_kidgo_3 uacr_3 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & creatinine_measurement_date_3>td(01jan2016) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)


/*time point 4 1st July 2018*/
count if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)

tab albuminuria_4 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab uacr_4 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)

tab egfr_kidgo_4 uacr_4 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


/*time point 5 1st Jan 2019*/
count if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)

tab albuminuria_5 if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab uacr_5 if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)

tab egfr_kidgo_5 uacr_5 if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)

/*time point 6 1st July 2019*/
count if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)

tab albuminuria_6 if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab uacr_6 if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)

tab egfr_kidgo_6 uacr_6 if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)

/*time point 7 31st dec 2019*/
count if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab albuminuria_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)


tab uacr_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab egfr_kidgo_7 uacr_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis cell

/*Table 6 CKD composite across time*/
*time point 1 1st Jan 2017*/
count if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab egfr_bin albuminuria if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite!=., mis


*time point 2 1st July 2017*/
count if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016)

tab ckd_composite_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017) & creatinine_measurement_date_2>td(01jul2015)  & regenddate>td(1july2017) & regstartdate<td(1july2016)

tab egfr_bin_2 albuminuria_2  if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017) & creatinine_measurement_date_2>td(01jul2015)  & regenddate>td(1july2017) & regstartdate<td(1july2016)

tab egfr_bin_2 albuminuria_2  if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)   & regenddate>td(1july2017) & regstartdate<td(1july2016) & ckd_composite_2!=., mis



*time point 3 1st Jan 2018*/
count if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab ckd_composite_3 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & creatinine_measurement_date_3>td(01jan2016) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & albuminuria_3!=. & egfr_bin_3!=.

tab egfr_bin_3 albuminuria_3  if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & creatinine_measurement_date_3>td(01jan2016) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab egfr_bin_3 albuminuria_3  if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & creatinine_measurement_date_3>td(01jan2016) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3!=., mis


*time point 4 1st July 2018*/
count if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)

tab ckd_composite_4  if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & albuminuria_4!=. & egfr_bin_4!=.

tab egfr_bin_4 albuminuria_4  if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & albuminuria_4!=. & egfr_bin_4!=.

tab egfr_bin_4 albuminuria_4  if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4!=., miss cell

*time point 5 1st Jan 2019*/

count if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)

tab ckd_composite_5 if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & albuminuria_5!=. & egfr_bin_5!=.


tab egfr_bin_5 albuminuria_5   if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018), cell


*time point 6 1st July 2019
count if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)

tab ckd_composite_6 if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & albuminuria_6!=. & egfr_bin_6!=.


tab egfr_bin_6 albuminuria_6  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018), cell

*time point 7 31st Dec 2019
count if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

tab ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis


tab egfr_bin_7 albuminuria_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis cell 


tab egfr_kidgo_7 uacr_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis cell

tab egfr_cat_25_7 uacr_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis cell

/*Medication use over time*/
/*SGLT-2 I*/
/*Jan 17*/
tab sglt2i_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab sglt2i_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1



/*1st July 17*/
tab sglt2i_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) 


tab sglt2i_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & ckd_composite_2==1




/*1st Jan 2018*/
tab sglt2i_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab sglt2i_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3==1



/*1st July 2018*/
tab sglt2i_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab sglt2i_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4==1



/*1st Jan 2019*/
tab sglt2i_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab sglt2i_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & ckd_composite_5==1



/*1st July 2019*/
tab sglt2i_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab sglt2i_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & ckd_composite_6==1




/*31st Dec 2019*/
tab sglt2i_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab sglt2i_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

/*DDP4*/
/*Jan 17*/
tab ddp4_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab ddp4_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1



/*1st July 17*/
tab ddp4_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) 


tab ddp4_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & ckd_composite_2==1




/*1st Jan 2018*/
tab ddp4_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab ddp4_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3==1



/*1st July 2018*/
tab ddp4_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab ddp4_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4==1



/*1st Jan 2019*/
tab ddp4_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab ddp4_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & ckd_composite_5==1



/*1st July 2019*/
tab ddp4_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab ddp4_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & ckd_composite_6==1




/*31st Dec 2019*/
tab ddp4_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab ddp4_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1




/*ACE-I*/
/*Jan 17*/
tab acei_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab acei_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1



/*1st July 17*/
tab acei_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) 


tab acei_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & ckd_composite_2==1




/*1st Jan 2018*/
tab acei_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab acei_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3==1



/*1st July 2018*/
tab acei_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab acei_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4==1



/*1st Jan 2019*/
tab acei_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab acei_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & ckd_composite_5==1



/*1st July 2019*/
tab acei_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab acei_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & ckd_composite_6==1




/*31st Dec 2019*/
tab acei_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab acei_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

/*MRAS*/
/*Jan 17*/
tab mras_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab mras_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1



/*1st July 17*/
tab mras_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) 


tab mras_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & & ckd_composite_2==1




/*1st Jan 2018*/
tab mras_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab mras_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3==1



/*1st July 2018*/
tab mras_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab mras_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4==1




/*1st Jan 2019*/
tab mras_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab mras_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & ckd_composite_5==1





/*1st July 2019*/
tab mras_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab mras_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & ckd_composite_6==1




/*31st Dec 2019*/
tab mras_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab mras_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1


tab hf_dec19 mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, col


tab hypertension_dec19 mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, col


tab hypertension_med_dec19 mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, col

tab hf_ht_dec19 mras_dec19  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, col




/*Oral diuretics*/
/*Jan 17*/
tab oral_diuretics_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab oral_diuretics_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1



/*1st July 17*/
tab oral_diuretics_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) 


tab oral_diuretics_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & ckd_composite_2==1




/*1st Jan 2018*/
tab oral_diuretics_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab oral_diuretics_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3==1



/*1st July 2018*/
tab oral_diuretics_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab oral_diuretics_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4==1



/*1st Jan 2019*/
tab oral_diuretics_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab oral_diuretics_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & ckd_composite_5==1



/*1st July 2019*/
tab oral_diuretics_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab oral_diuretics_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & ckd_composite_6==1




/*31st Dec 2019*/
tab oral_diuretics_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab oral_diuretics_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1

/*GLP_1*/
/*Jan 17*/
tab glp_1_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab glp_1_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1



/*1st July 17*/
tab glp_1_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) 


tab glp_1_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & ckd_composite_2==1




/*1st Jan 2018*/
tab glp_1_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab glp_1_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3==1



/*1st July 2018*/
tab glp_1_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab glp_1_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4==1



/*1st Jan 2019*/
tab glp_1_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab glp_1_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & ckd_composite_5==1



/*1st July 2019*/
tab glp_1_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab glp_1_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & ckd_composite_6==1




/*31st Dec 2019*/
tab glp_1_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab glp_1_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1



/*Co-morbidity - HF & HT*/
/*1st Jan 2017*/
tab hypertension_med_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), cell

tab hypertension_med_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & mras_jan17==1, cell


tab hf_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016), cell

tab hf_jan17 ckd_composite if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & mras_jan17==1, cell

/*1st July 2017*/
tab  hypertension_med_july17 ckd_composite_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016), cell 

tab  hypertension_med_july17 ckd_composite_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & mras_july17==1, cell

tab  hf_july17 ckd_composite_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016), cell 

tab  hf_july17 ckd_composite_2 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & mras_july17==1, cell

/*1st Jan 2018*/
tab hf_jan18 ckd_composite_3  if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017), cell

tab hf_jan18 ckd_composite_3  if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & mras_jan18==1, cell


/*1st July 2018*/

tab hf_july18 ckd_composite_4 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017), cell

tab hf_july18 ckd_composite_4 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & mras_july18==1, cell


/*1st Jan 2019*/
tab hf_jan19 ckd_composite_4  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(1jan2019) & regstartdate<td(1jan2018), cell

tab hf_jan19 ckd_composite_4  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(1jan2019) & regstartdate<td(1jan2018) & mras_jan19==1, cell

/*1st July 2019*/
tab hf_july19 ckd_composite_5  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018), cell

tab hf_july19 ckd_composite_5  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & mras_july19==1, cell

/*31st Dec 2019*/
tab hf_dec19 mras_dec19 if date_diabetes<td(31dec2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, col mis

tab hypertension_dec19 mras_dec19 if date_diabetes<td(31dec2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, col mis

tab hypertension_med_dec19 mras_dec19 if date_diabetes<td(31dec2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, col mis

tab hf_ht_dec19 mras_dec19 if date_diabetes<td(31dec2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, col mis


/*ARBS*/
/*Jan 17*/
tab arbs_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab arbs_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1



/*1st July 17*/
tab arbs_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) 


tab arbs_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & ckd_composite_2==1




/*1st Jan 2018*/
tab arbs_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab arbs_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3==1



/*1st July 2018*/
tab arbs_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab arbs_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4==1



/*1st Jan 2019*/
tab arbs_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab arbs_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & ckd_composite_5==1



/*1st July 2019*/
tab arbs_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab arbs_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & ckd_composite_6==1




/*31st Dec 2019*/
tab arbs_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab arbs_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1


/*betablockers*/
/*Jan 17*/
tab betablockers_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab betablockers_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1



/*1st July 17*/
tab betablockers_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) 


tab betablockers_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & ckd_composite_2==1




/*1st Jan 2018*/
tab betablockers_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab betablockers_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3==1



/*1st July 2018*/
tab betablockers_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab betablockers_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4==1



/*1st Jan 2019*/
tab betablockers_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab betablockers_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & ckd_composite_5==1



/*1st July 2019*/
tab betablockers_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab betablockers_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & ckd_composite_6==1




/*31st Dec 2019*/
tab betablockers_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab betablockers_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1


/*calciumchannelblockers*/
/*Jan 17*/
tab calciumchannelblockers_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)

tab calciumchannelblockers_jan17 if date_diabetes<td(01jan2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1



/*1st July 17*/
tab calciumchannelblockers_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) 


tab calciumchannelblockers_july17 if date_diabetes<td(01jul2017) & age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jul2017)  & regenddate>td(1july2017) & regstartdate<td(1july2016) & ckd_composite_2==1




/*1st Jan 2018*/
tab calciumchannelblockers_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017)

tab calciumchannelblockers_jan18 if date_diabetes<td(01jan2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2018) & regenddate>td(1jan2018) & regstartdate<td(1jan2017) & ckd_composite_3==1



/*1st July 2018*/
tab calciumchannelblockers_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017)


tab calciumchannelblockers_july18 if date_diabetes<td(01july2018) & age_jan2018>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2018) & regenddate>td(01july2018) & regstartdate<td(1july2017) & ckd_composite_4==1



/*1st Jan 2019*/
tab calciumchannelblockers_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018)


tab calciumchannelblockers_jan19  if date_diabetes<td(01jan2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2019) & regenddate>td(01jan2019) & regstartdate<td(01jan2018) & ckd_composite_5==1



/*1st July 2019*/
tab calciumchannelblockers_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018)


tab calciumchannelblockers_july19  if date_diabetes<td(01july2019) & age_jan2019>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01july2019) & regenddate>td(01july2019) & regstartdate<td(01july2018) & ckd_composite_6==1




/*31st Dec 2019*/
tab calciumchannelblockers_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab calciumchannelblockers_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1



