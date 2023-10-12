/*Table 2 - baseline characteristics of the study participants at end of study period 31st Dec 2019*/

tab gender if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab gender if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

sum age_jan2020 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

sum age_jan2020 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

tab age_group_jan2020 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab age_group_jan2020 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab eth5 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab eth5 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis

tab eth5 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

tab eth5 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis

tab bmi_cat_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1 , mis

tab bmi_cat_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1 & ckd_composite_7!=., mis

sum serum_potassium_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1, detail

sum serum_potassium_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1 & ckd_composite_7!=., detail


tab potassium_cat_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1 , mis

tab potassium_cat_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1 & ckd_composite_7!=., mis

sum sbp_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1

sum sbp_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1 & ckd_composite_7!=.



tab hypertension_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1 

tab hypertension_med_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 


tab hypertension_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &  & regenddate>td(31dec2019) & regstartdate<td(31dec2018)  & hes_e==1 & death_e==1 & ckd_composite_7!=.

tab hypertension_med_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.


tab hypotension_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 


tab hypotension_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1  & ckd_composite_7!=.

tab hf_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 


tab hf_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1  & ckd_composite_7!=.

tab copd if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) &copd_diagnosis_date<td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab angina_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab angina_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.


tab af_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 


tab af_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.

tab mi_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab mi_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.

tab cvd_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab cvd_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1  & ckd_composite_7!=.

tab cvd_general_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab cvd_general_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019)  & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1  & ckd_composite_7!=.

tab stroke_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab stroke_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.

tab diabetic_retino_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab diabetic_retino_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.


tab diabetic_neuro_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab diabetic_neuro_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.

tab anaemia_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab anaemia_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.

tab pad_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab pad_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.


tab copd_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab copd_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 & ckd_composite_7!=.


tab hyperthyroidism if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & hyperthyroidism_diagnosis_date<td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 
tab hypothyroid if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & hypothyroid_diagnosis_date<td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 
tab sleep_apnoea if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & sleep_apnoea_diagnosis_date<td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 
tab lipid_disorders if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & lipid_disorders_diagnosis_date<td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 
tab hyperkalemia if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & hyperkalemia_diagnosis_date<td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 
tab bronchiectasis if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & bronchiectasis_diagnosis_date<td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 
tab asthma if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & asthma_diagnosis_date<td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab hf if date_diabetes<td(31dec2019) & age_jan2020>=18 & cprd_ddate>td(31dec2019) & hf_diagnosis_date<td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hes_e==1 & death_e==1 

tab uacr_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis

tab uacr_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis

tab egfr_kidgo_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis

tab egfr_kidgo_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis


tab egfr_bin_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis

tab egfr_bin_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis


tab albuminuria_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis

tab albuminuria_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis

tab fidelio_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis

tab fidelio_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis

tab figaro_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis

tab figaro_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis


tab ckd_composite if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)
tab ckd_composite if date_diabetes<td(31dec2019) & age_jan2020>=18 & albuminuria<2 & egfr<. & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab lipid_disorder_med_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab lipid_disorder_med_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab acei_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) 

tab acei_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

tab arbs_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab arbs_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

tab acei_arb_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab acei_arb_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab mras_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab mras_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate> td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab sglt2i_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab sglt2i_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & sglt2i_dec19!=. & ckd_composite_7!=.


tab ddp4_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab ddp4_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

tab glp_1_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) 

tab glp_1_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab lipid_lowering_drugs_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab lipid_lowering_drugs_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab betablockers_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab betablockers_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab calciumchannelblockers_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab calciumchannelblockers_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab oral_diuretics_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab oral_diuretics_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

tab antiplatelets_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab antiplatelets_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab insulin_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab insulin_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

tab biguanides_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab biguanides_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.


tab sulfonureas_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab sulfonureas_dec19 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=.

tab ckd_composite_7 age_group_jan2020 if date_diabetes<td(31dec2019) & age_jan2020>=18 & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


/*Table 1 row percentages*/
tab gender ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row

tab gender ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row

tab gender ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

bysort ckd_composite_7: sum age_jan2020 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018)

tab age_group_jan2020 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row

tab age_group_jan2020 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row

tab age_group_jan2020 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab eth5 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis row chi

tab eth5 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis row chi

tab eth5 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7!=., mis col chi

tab bmi_cat_7 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi

tab bmi_cat_7 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab bmi_cat_7 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col mis


tab potassium_cat_7 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi

tab potassium_cat_7 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab potassium_cat_7 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col mis

sum serum_potassium_7  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, detail

sum sbp_7  if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & ckd_composite_7==1, detail

tab cvd_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi

tab cvd_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab cvd_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab cvd_general_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi

tab cvd_general_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab cvd_general_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab hypotension_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi

tab hypotension_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab hypotension_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab angina_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi

tab angina_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab angina_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab lipid_disorder_med_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi

tab lipid_disorder_med_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab lipid_disorder_med_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col



tab hf_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab hf_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab hf_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab hypertension_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi

tab hypertension_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab hypertension_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab hypertension_med_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi

tab hypertension_med_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab hypertension_med_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab stroke_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab stroke_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi


tab stroke_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab copd_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab copd_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi


tab copd_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab diabetic_retino_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab diabetic_retino_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi


tab diabetic_retino_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab diabetic_neuro_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab diabetic_neuro_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi


tab diabetic_neuro_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab pad_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab pad_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab pad_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab anaemia_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab anaemia_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi


tab anaemia_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab mi_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab mi_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab mi_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab af_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab af_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab af_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab copd_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab copd_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col chi


tab asthma_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab asthma_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col chi

tab sleep_apnoea_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col chi

tab hyperthyroidism_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col chi

tab hypothyroidism_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col chi

tab hyperkalemia_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col chi

tab bronchiectasis_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab uacr egfr_bin if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi 

tab uacr egfr_bin if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), mis row chi 


tab acei_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab acei_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab acei_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col chi


tab arbs_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab arbs_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab arbs_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab acei_arb_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab acei_arb_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab acei_arb_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab acei_arb_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018) & hypertension_jan17==1 & albuminuria==1, col

tab mras_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab mras_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab mras_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab sglt2i_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab sglt2i_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab sglt2i_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab ddp4_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab ddp4_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab ddp4_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab glp_1_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab glp_1_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab glp_1_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab betablockers_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab betablockers_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab betablockers_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab calciumchannelblockers_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab calciumchannelblockers_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab calciumchannelblockers_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab lipid_lowering_drugs_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab lipid_lowering_drugs_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab lipid_lowering_drugs_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab oral_diuretics_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab oral_diuretics_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab oral_diuretics_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab antiplatelets_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab antiplatelets_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab antiplatelets_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab insulin_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab insulin_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab insulin_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab biguanides_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab biguanides_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab biguanides_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab sulfonureas_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018),mis  row chi

tab sulfonureas_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), row chi

tab sulfonureas_dec19 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col


tab creatinine_dec18 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col

tab uacr_dec18 ckd_composite_7 if date_diabetes<td(31dec2019) & age_jan2020>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(31dec2019) & regenddate>td(31dec2019) & regstartdate<td(31dec2018), col