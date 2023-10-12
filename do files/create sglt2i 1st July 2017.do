/*create codes for sglt2 usage at second time point -July 2017*/
/*created by Sarah Cook*/
/*10.06.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\sglt2i.dta"


gen sglt2i=1 if _merge==3

drop _merge

keep if sglt2i==1


/*generate indicator for taking sglt2i on 1 Jan 2017*/
/*use 3 month window -if prescribed sglt2i in 3 month period before 1st Jan 2017 count as on sglt2i*/

gen sglt2i_july17=1 if sglt2i==1 & issuedate<td(01july2017) & issuedate>=td(01april2017)

drop sglt2i

label variable sglt2i_july17 "using sglt2i on 1st July 2017"

keep if sglt2i_july17==1

egen keepme=tag(patid)

keep if keepme==1

keep patid sglt2i_july17 

merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}


