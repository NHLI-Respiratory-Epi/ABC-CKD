/*create codes for ACE inhibitors*/
/*created by Sarah Cook*/
/*24.04.21*/

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\aceinhibitors.dta"


gen acei=1 if _merge==3

drop _merge

keep if acei==1





label variable acei "ever prescribed acei"


egen keepme=tag(patid)

keep if keepme==1

keep patid acei issuedate prodcodeid dosageid quantity quantunitid duration route formulation strength bnfcode

rename issuedate date_prescribed_acei_ever
rename prodcodeid acei_prodcodeid_ever





merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}


