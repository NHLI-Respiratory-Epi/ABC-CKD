/*Do file to create indicator of End Stage Renal Disease from HES procedure data indicating dialysis using opcs codes from
Bidulka, P., Fu, E.L., Leyrat, C. et al. Stopping renin-angiotensin system blockers after acute kidney injury and risk of adverse outcomes: parallel population-based cohort studies in English and Swedish routine care. BMC Med 18, 195 (2020). https://doi.org/10.1186/s12916-020-01659-x */

/*Do file created Sarah Cook 23.09.21*/
clear

use "Z:\Group_work\ABC_CKD\Linked data\Results\Results\Aurum_linked\Final\hes_procedures_epi_20_000167_DM_stata.dta"


merge m:1 opcs using  "Z:\Group_work\ABC_CKD\Code_Lists\OPCD_end stage renal disease.dta"

gen esrd_opcs=1 if _merge==3

sort patid evdate

keep if esrd_opcs==1

gsort patid evdate
egen keepme= tag(patid)

keep if keepme==1

gen date_esrd_opcs=date(evdate, "DMY")


label variable esrd_opcs "HES proceedure indicating ESRD"
label variable date_esrd_opcs "event date for 1st HES proceedure indicating ESRD"

keep patid esrd_opcs date_esrd_opcs

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace


