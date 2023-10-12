/*Do file to create indicator of 1st hospitalisation for MI from HES admissions data using ICD-10 codes from
 Iwagami, Masao; Caplin, Ben; Smeeth, Liam; Tomlinson, Laurie A; Nitsch, Dorothea; (2018) Chronic kidney disease and cause-specific hospitalisation: a matched cohort study using primary and secondary care patient data. The British journal of general practice, 68 (673). e512-e523. ISSN 0960-1643 DOI: https://doi.org/10.3399/bjgp18X697973 */

/*Do file created Sarah Cook 23.09.21*/
clear

use "Z:\Group_work\ABC_CKD\Linked data\Results\Results\Aurum_linked\Final\hes_primary_diag_hosp_20_000167_DM_stata.dta"

merge m:1 icd_primary using "Z:\Group_work\ABC_CKD\Code_Lists\icd10_mi.dta" 

gen mi_hes=1 if _merge==3

sort patid admidate

keep if mi_hes==1

gsort patid admidate
egen keepme= tag(patid)

keep if keepme==1

gen date_mi_hes=date(admidate, "DMY")


label variable mi_hes "mi admission hes"
label variable date_mi_hes "admission date 1st mi episode"

keep patid mi_hes date_mi_hes

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace
