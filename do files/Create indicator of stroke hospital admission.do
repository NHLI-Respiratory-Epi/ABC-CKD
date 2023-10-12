/*Do file to create indicator of 1st hospitalisation for stroke from HES admissions data using ICD-10 codes from
Bidulka, P., Fu, E.L., Leyrat, C. et al. Stopping renin-angiotensin system blockers after acute kidney injury and risk of adverse outcomes: parallel population-based cohort studies in English and Swedish routine care. BMC Med 18, 195 (2020). https://doi.org/10.1186/s12916-020-01659-x */

/*Do file created Sarah Cook 23.09.21*/
clear

use "Z:\Group_work\ABC_CKD\Linked data\Results\Results\Aurum_linked\Final\hes_primary_diag_hosp_20_000167_DM_stata.dta"

merge m:1 icd_primary using "Z:\Group_work\ABC_CKD\Code_Lists\icd10_stroke.dta" 

gen stroke_hes=1 if _merge==3

sort patid admidate

keep if stroke_hes==1

gsort patid admidate
egen keepme= tag(patid)

keep if keepme==1

gen date_stroke_hes=date(admidate, "DMY")


label variable stroke_hes "Stroke admission hes"
label variable date_stroke_hes "admission date 1st stroke episode"

keep patid stroke_hes date_stroke_hes

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace
