/*create codes for calciumchannelblockers*/
/*created by Sarah Cook*/
/*24.04.21*/
clear

forvalues f=1/135 {
	local c=string(`f',"%03.0f") /*converting number f to 3 digit string so we get the correct number of preceeding zeros */

use "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\ckd2_drugissue_`c'.dta"


format prodcodeid %20.0g


merge m:1 prodcodeid using  "Z:\Group_work\ABC_CKD\Code_Lists\calciumchannelblockers.dta"


gen calciumchannelblockers=1 if _merge==3

drop _merge

keep if calciumchannelblockers==1


/*generate indicator for taking calciumchannelblockers on 1 july 2019*/
/*use 3 month window -if prescribed calciumchannelblockers in 3 month period before 1st july 2019 count as on calciumchannelblockers*/

gen calciumchannelblockers_july19=1 if calciumchannelblockers==1 & issuedate<td(01july2019) & issuedate>=td(01april2019)

label variable calciumchannelblockers "ever prescribed calciumchannelblockers"
label variable calciumchannelblockers_july19 "using calciumchannelblockers on 1st july 2019"

keep if calciumchannelblockers_july19==1

egen keepme=tag(patid)

keep if keepme==1

keep patid calciumchannelblockers_july19 


merge 1:1 patid using "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta"

drop _merge
save "Z:\Group_work\ABC_CKD\new_data\unzipped_2\AURUM\STATA_files\abc_ckd_cohort_all.dta", replace 
}


