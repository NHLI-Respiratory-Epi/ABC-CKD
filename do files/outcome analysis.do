/*Do file for Outcome analysis ABC-CKD project*/

/*Do file created by Sarah Cook 20.09.21*/
/*reformat death date from ONS*/
gen deathdate=date(dod, "DMY")

/*enter date*/
gen enter_date=td(01jan2017)


format enter_date %td

/*gen exit date variable  - either end of study period 31st Dec 2019 OR death date OR end of registration with CPRD - whichever is earliest*/
gen exit_date=td(31dec2019)

format exit_date %td
format deathdate %td

replace exit_date=deathdate if deathdate<td(31dec2019)  
replace exit_date=regenddate if regenddate<td(31dec2019)  & regenddate<deathdate 


gen dead=1 if gen_death_id!=.
replace dead=0 if gen_death_id==.
replace dead=.b if death_e==0

gen ckd_prev_inc=ckd_incident
replace ckd_prev_inc=1 if ckd_composite_1==1

gen hf_ckd_prev_inc=0
replace hf_ckd_prev_inc=1 if cvd_diagnosis_date<enter_date & cvd==1

gen cvd_ckd_prev_inc=0
replace cvd_ckd_prev_inc=1 if cvd_diagnosis_date<enter_date & cvd==1

gen copd_ckd_prev_inc=0
replace copd_ckd_prev_inc=1 if copd_diagnosis_date<enter_date & copd==1

gen asthma_ckd_prev_inc=0
replace asthma_ckd_prev_inc=1 if asthma_diagnosis_date<enter_date & asthma==1

gen bronchiectasis_ckd_prev_inc=0
replace bronchiectasis_ckd_prev_inc=1 if bronchiectasis_diagnosis_date<enter_date & bronchiectasis==1

gen cvd_composite=0
replace cvd_composite=1 if first_mi==1 | first_stroke==1 | first_hf==1 | cvd_death==1
/*replace as missing if first cvd event before 1st Jan 2017*/
replace cvd_composite=.b if first_mi==.b | first_stroke==.b | first_hf==.b 

egen cvd_exit_date=rowmin(date_mi_hes date_stroke_hes date_hf_hes exit_date) if cvd_composite==1
replace cvd_exit_date=exit_date if cvd_exit_date>td(31dec2019)
replace cvd_exit_date=exit_date if cvd_composite==0
replace cvd_exit_date=. if cvd_exit_date<enter_date
replace cvd_composite=. if cvd_exit_date<enter_date
format cvd_exit_date %td

/*stset data with death as outcome*/
stset exit_date, fail(dead) origin(enter_date) enter(enter_date) id(patid) scale(365.25)


strate ckd_composite_1, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & date_diabetes<td(01jan2017)


strate hf_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)


strate cvd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate copd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate asthma_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate bronchiectasis_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_prev_inc==1 & date_diabetes<td(01jan2017)

strate, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate ckd, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate uacr, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate acei_arb_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate acei_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate arbs_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate hypertension_med_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate hypertension_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

/*stset data with first MI as outcome*/
replace mi_hes=0 if mi_hes==. & hes_e==1
gen first_mi=1 if mi_hes==1 & date_mi_hes>enter_date
replace first_mi=0 if mi_hes==0
replace first_mi=.b if mi_hes==1 & date_mi_hes<enter_date

gen exit_date_mi=exit_date
replace exit_date_mi=date_mi_hes if first_mi==1 & date_mi_hes<exit_date
replace exit_date_mi=. if first_mi==.

format exit_date_mi %td
format date_mi_hes %td


stset exit_date_mi, fail(first_mi) origin(enter_date) enter(enter_date) id(patid) scale(365.25)


strate ckd_composite_1, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) &  date_diabetes<td(01jan2017) & first_mi<=.


strate hf_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1  & date_diabetes<td(01jan2017) & first_mi<=.


strate cvd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1  & date_diabetes<td(01jan2017) & first_mi<=.
 
strate copd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1  & date_diabetes<td(01jan2017) & first_mi<=.

strate asthma_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1  & date_diabetes<td(01jan2017) & first_mi<=.

strate bronchiectasis_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1  & date_diabetes<td(01jan2017) & first_mi<=.

strate, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_mi<=.

strate ckd, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_mi<=.

strate uacr, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_mi<=.

strate acei_arb_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_mi<=.
 
strate acei_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_mi<=.

strate arbs_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_mi<=.

strate hypertension_med_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_mi<=.

strate hypertension_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_mi<=.


/*stset data with first stroke as outcome*/
replace stroke_hes=0 if stroke_hes==. & hes_e==1
gen first_stroke=1 if stroke_hes==1 & date_stroke_hes>enter_date
replace first_stroke=0 if stroke_hes==0
replace first_stroke=.b if stroke_hes==1 & date_stroke_hes<enter_date

gen exit_date_stroke=exit_date
replace exit_date_stroke=date_stroke_hes if first_stroke==1 & date_stroke_hes<exit_date
replace exit_date_stroke=. if first_stroke==.

stset exit_date_stroke, fail(first_stroke) origin(enter_date) enter(enter_date) id(patid) scale(365.25)


strate ckd_composite_1, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & date_diabetes<td(01jan2017) & first_stroke<=.


strate hf_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.


strate cvd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate copd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate asthma_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate bronchiectasis_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.


strate, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate ckd, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate uacr, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate acei_arb_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate acei_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate arbs_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate hypertension_med_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.

strate hypertension_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_stroke<=.


/*stset data with first hf as outcome*/
replace hf_hes=0 if hf_hes==. & hes_e==1
gen first_hf=1 if hf_hes==1 & date_hf_hes>enter_date
replace first_hf=0 if hf_hes==0
replace first_hf=.b if hf_hes==1 & date_hf_hes<enter_date

gen exit_date_hf=exit_date
replace exit_date_hf=date_hf_hes if first_hf==1 & date_hf_hes<exit_date
replace exit_date_hf=. if first_hf==.

stset exit_date_hf, fail(first_hf) origin(enter_date) enter(enter_date) id(patid) scale(365.25)


strate ckd_composite_1, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & date_diabetes<td(01jan2017) & first_hf<=.


strate hf_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.


strate cvd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.

strate copd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.
 
strate asthma_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.

strate bronchiectasis_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.


strate, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.

strate ckd, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.

strate uacr, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.

strate acei_arb_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.

strate acei_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.

strate arbs_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.

strate hypertension_med_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.

strate hypertension_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017) & first_hf<=.



/*stset data with CVD mortality as outcome*/
stset exit_date, fail(cvd_death) origin(enter_date) enter(enter_date) id(patid) scale(365.25)


strate ckd_composite_1, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & date_diabetes<td(01jan2017)


strate hf_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017)


strate cvd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) &  ckd_composite_1==1 & date_diabetes<td(01jan2017)


strate copd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) &  ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate asthma_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) &  & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate bronchiectasis_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate ckd, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate uacr, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate acei_arb_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate acei_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate arbs_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate hypertension_med_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)

strate hypertension_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)



/*stset data with CVD composite (first of CVD death, first instance MI, first instance stroke, or first hospitalisation for Heart Failure) as outcome*/
stset cvd_exit_date, fail(cvd_composite) origin(enter_date) enter(enter_date) id(patid) scale(365.25)

strate ckd_composite_1, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & date_diabetes<td(01jan2017) & cvd_composite<=.


strate hf_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.


strate cvd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.


strate copd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.

strate asthma_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.

strate bronchiectasis_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.

strate, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.

strate ckd, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.

strate uacr, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.


strate acei_arb_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.

strate acei_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.

strate arbs_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.

strate hypertension_med_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.

strate hypertension_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017) & cvd_composite<=.


/*all-cause hospitalisation*/
preserve
merge 1:m patid using "Z:\Group_work\ABC_CKD\Linked data\Results\Results\Aurum_linked\Final\hes_episodes_20_000167_DM_stata.dta"

drop if _merge==2

gen hosp_start_date=date(admidate, "DMY")
format hosp_start %td

gen hosp_end_date=date(discharged, "DMY")
format hosp_end_date %td



sort patid hosp_start_date

bysort patid: gen hes_N=_N
bysort patid: gen hes_n=_n

replace hes=0 if _merge==1


replace hes=2 if hosp_start_date<td(1jan2017)
replace hes=3 if hosp_start_date>td(31dec2019) & hosp_start_date!=.

replace hes=0 if hes==2 & hes_N==1
replace hes=0 if hes==3 & hes_N==1


drop hes_n hes_N

sort patid hosp_start_date
bysort patid: gen hes_N=_N
bysort patid: gen hes_n=_n

gen hes_enter_date=enter_date
replace hes_enter_date=hosp_start_date if hes==1 & hosp_start_date>td(1jan2017) & hosp_start_date<td(31dec2019) & hes_n>1 & hes_n!=.


format hes_enter_date %td

gen enddate=td(31dec2019)
egen hes_exit_date=rowmin(hosp_start_date regenddate deathdate enddate) if hes==1
replace hes_exit_date=exit_date if hes==0

format hes_exit_date %td

format hes_exit_date %td


drop _merge


keep if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & date_diabetes<td(01jan2017)

sort patid hosp_start_date
egen keepme=tag(patid)

sort patid hes hosp_start_date
egen keepme2=tag(patid)
replace hes=0 if hes==2 & keepme2==1
replace hes=0 if hes==3 & keepme2==1

drop keepme keepme2
sort patid hes hosp_start_date
egen keepme=tag(patid)



drop hes_n hes_N

sort patid hosp_start_date
bysort patid: gen hes_N=_N
bysort patid: gen hes_n=_n

/*code to reshape dataset if using multiple event info*/
keep exit_date  enter_date hes_exit_date hes_enter_date hosp_start_date hosp_end_date patid ckd_composite_1 age_jan2017 hes_e death_e hes hes_n hes_N cprd_ddate regenddate regstartdate date_diabetes hf_ckd_prev_inc cvd_ckd_prev_inc ckd uacr acei_arb_jan17 hypertension_med_jan17

reshape wide hes_exit_date hes_enter_date hosp_start_date hosp_end_date, i(patid) j(hes_n)


replace hes_enter_date2=hosp_end_date1 if hosp_end_date1!=.  & hes==1
replace hes_enter_date2=. if hosp_end_date2==.  &  hosp_end_date1==.

replace hes_exit_date2=hosp_start_date3 if hosp_start_date3!=. & hes==1
replace hes_exit_date2=exit_date if hosp_end_date2==. &  hes==1

gen hes2=0 if hosp_end_date2==. & hes==1
replace hes2=1 if hosp_end_date2!=. & hes==1


forvalues i=3/532 {
local c=`i'
local d=`c'+1
local e=`c'-1

replace hes_enter_date`c'=hosp_end_date`e' if hosp_end_date`e'!=.  & hes==1
replace hes_enter_date`c'=. if hosp_end_date`c'==.  &  hosp_end_date`e'==.

replace hes_exit_date`c'=hosp_start_date`d' if hosp_start_date`d'!=. & hes==1
replace hes_exit_date`c'=exit_date if hosp_end_date`c'==. & hosp_end_date`d'==. & hes==1
replace hes_exit_date`c'=. if hosp_end_date`c'==. & hosp_end_date`e'==.

gen hes`c'=.
replace hes`c'=0 if hosp_end_date`c'==. & hosp_end_date`e'!=. & hes==1
replace hes`c'=1 if hosp_end_date`c'!=. & hes==1
}

rename hes hes1

gen hes533=.

reshape long hes_exit_date hes_enter_date hosp_start_date hosp_end_date hes, i(patid) j(hes_n)
drop if hosp_start_date==. & hosp_end_date==. & hes_enter_date==. & hes_exit_date==.

sort patid hosp_start_date

duplicates drop patid enter_date hes_exit_date, force

/*multiple events*/
stset hes_exit_date, fail(hes==1) origin(enter_date) enter(hes_enter_date) id(patid) scale(365.25)  exit(time .)

/*single event*/
keep if keepme==1

stset hes_exit_date, fail(hes) origin(enter_date) enter(enter_date) id(patid) scale(365.25)

strate ckd_composite_1, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & date_diabetes<td(01jan2017) 


strate hf_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)



strate cvd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)


strate copd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_prev_inc==1 & date_diabetes<td(01jan2017)


strate asthma_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_prev_inc==1 & date_diabetes<td(01jan2017)


strate bronchiectasis_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_prev_inc==1 & date_diabetes<td(01jan2017)


strate, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & date_diabetes<td(01jan2017)


strate ckd, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)


strate uacr, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)



strate acei_arb_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)


strate acei_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)


strate arbs_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)


strate hypertension_med_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)


strate hypertension_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)


restore

/*End stage renal failure*/
replace esrd_p_cprd=.b if esrd_p_cprd_diagnosis_date<td(01jan2017)

replace esrd_opcs=.b if date_esrd_opcs<td(01jan2017)

gen esrd_composite=1 if esrd_p_cprd==1 | esrd_opcs==1 | egfr_reduced_15==1

replace esrd_composite=.b if esrd_p_cprd==.b | esrd_opcs==.b | egfr_reduced_15==.b


egen esrd_composite_date=rowmin (esrd_p_cprd_diagnosis_date date_esrd_opcs egfr_15_date) if esrd_composite==1

format esrd_composite_date %td

gen exit_date_esrd=exit_date
replace exit_date_esrd=esrd_composite_date if esrd_composite==1 & esrd_composite_date<td(31dec2019)

stset exit_date_esrd, fail(esrd_composite) origin(enter_date) enter(enter_date) id(patid) scale(365.25)

strate ckd_composite_1, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & date_diabetes<td(01jan2017) & esrd_composite<=.



strate hf_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.



strate cvd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate copd_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate asthma_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate bronchiectasis_ckd_prev_inc, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016)  & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate ckd, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate uacr, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.



strate acei_arb_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate acei_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate arbs_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate hypertension_med_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.


strate hypertension_jan17, per (1000), if age_jan2017>=18 & hes_e==1 & death_e==1 & cprd_ddate>td(01jan2017) & regenddate>td(1jan2017) & regstartdate<td(1jan2016) & ckd_composite_1==1 & date_diabetes<td(01jan2017)  & esrd_composite<=.