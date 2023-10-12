/*create codes for ACE inhibitors - prescribed 3 months prior to 1st Jan 2018*/
/*created by Sarah Cook*/
/*05.07.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\aceinhibitors.dta"


gen acei=1 if _merge==3

drop _merge

keep if acei==1


/*generate indicator for taking ACE-I on 1 Jan 2019*/
/*use 3 month window -if prescribed ACE-I in 3 month period before 1st Jan 2019 count as on ace-i*/

gen acei_jan19=1 if acei==1 & issuedate<td(01jan2019) & issuedate>=td(01oct2018)


label variable acei "ever prescribed acei"
label variable acei_jan19 "using acei on 1st Jan 2019"

keep if acei_jan19==1

egen keepme=tag(patid)

keep if keepme==1

keep patid acei_jan19





merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}