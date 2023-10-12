/*Do file to create cause of death Using code from Alicia Gayle*/
/*Do file adapted for use ABC-CKD project by sarah Cook 5/10/21*/


icd10 generate ICD10 = cause, category

*Pull ICD-10 letter from cause of death codes
generate str cause_letter = substr(ICD10,1,1)


*Combine cause letters from same chapters
***Place neoplasms labelled 'D' (D00-D49) --> 'C'
generate cause_number = substr(cause,2,4)
destring cause_number, replace
replace cause_letter = subinstr(cause_letter, "D", "C", .) if cause_number < 50
drop cause_number

***Combine all letters referring to external causes of morbidity (S, T, V, W, X, Y) --> 'X'
replace cause_letter = subinstr(cause_letter, "S", "X", .)
replace cause_letter = subinstr(cause_letter, "T", "X", .)
replace cause_letter = subinstr(cause_letter, "V", "X", .)
replace cause_letter = subinstr(cause_letter, "W", "X", .)
replace cause_letter = subinstr(cause_letter, "Y", "X", .)

***Combine all letters referring to infectious diseases (A, B) --> 'A'
replace cause_letter = subinstr(cause_letter, "B", "A", .)

*list cause if cause_letter == "U"
/* All U50.9 or U99
	...U50.9 is used to code for other deaths if someone has been chared with an
		offense in relation to the death (such as possible homicides)
		- replaced when final information becomes available
		- according to ONS
	...U99 ??? - there is literally no other info available
	...either way appear NOT to be underlying cause of death
*/

***Replace all U50.9 codes with the letter from cause1
replace cause_letter = substr(cause1,1,1) if cause == "U50.9"

***Replace R codes that point towards a defintiive code
* Respiratory arrest -> J Senility ->F
replace cause_letter = subinstr(cause_letter, "R","J",.) if cause == "R09.2"
replace cause_letter = subinstr(cause_letter, "R","F",.) if cause == "R54"

replace cause_letter = subinstr(cause_letter, "S", "X", .)
replace cause_letter = subinstr(cause_letter, "T", "X", .)
*make sure that all causes are counted where the death is valid
replace cause_letter = "." if dead == 0
 
*then create disease specific death flag variables
generate resp_death = 1 if cause_letter == "J"
replace resp_death = 0 if cause_letter != "J"
generate cvd_death = 1 if cause_letter == "I"
replace cvd_death = 0 if cause_letter != "I"
generate cancer_death = 1 if cause_letter == "C"
replace cancer_death = 0 if cause_letter != "C"
generate digest_death = 1 if cause_letter == "K"
replace digest_death = 0 if cause_letter != "K"
generate mental_death = 1 if cause_letter == "F"
replace mental_death = 0 if cause_letter != "F"
generate other_death = 1 if inlist(cause_letter, "A", "D", "E","G" ,"H", "L")
replace other_death = 1 if inlist(cause_letter,  "M", "O", "P", "N", "Q", "R", "U", "X")
replace other_death = 1 if (dead == 1 & missing(cause_letter))
replace other_death = 0 if missing(other_death)
