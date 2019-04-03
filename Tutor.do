use "D:\HFrEF combined\HFrEF_labs_ccb.dta", clear

*keep if trial==1							// keeping only PARADIGM-HF


recode bmi_b2 (min/18.49=1)(18.5/24.9=2)(25/29.9=3)(30/max=4), gen (bmi_fr1)    

gen un_wt_c=1 if bmi_fr1==1 & bmi_b2!=.
replace un_wt_c=0 if un_wt_c!=1 & bmi_b2!=.

gen obese_c=1 if bmi_fr1==4 & bmi_b2!=.
replace obese_c=0 if obese_c!=1 & bmi_b2!=.

gen pvd_c=llsimag_flg1==1 | intcl_flg1==1 
recode pvd_c .=0

gen ckd_c=0
replace ckd_c=1 if gfr_b2<60 & gfr_b2!=.

egen comor_c=rowtotal(afib_ecg anem ckd_c copd_flg1 dbt_flg2 hyp_flg1 mi_flg1 obese_c pvd_c stk_flg1 un_wt_c)

table1 afib_ecg anem ckd_c copd_flg1 dbt_flg2 hyp_flg1 mi_flg1 obese_c pvd_c stk_flg1 un_wt_c


this is a tutorial

today if wednesday
