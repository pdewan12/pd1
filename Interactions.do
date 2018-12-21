*interaction loop
 foreach V of varlist log_sfrp3-log_gal_10 {
 qui stcox i.trtnum##c.`V' corona_risk
 matrix R=r(table)'
 local pval=R[5,4]
 if `pval'<0.05 {
 disp "`V'"  _col(30)  "P = " %8.6f  `pval'
 }
 }

 
 *interaction loop
 foreach V of varlist  cerebro_c mi_flg1 hyp_flg1 vhd_flg1 dbt_flg2  af_history copd_flg1 renal_flg1 {
 qui stcox i.pvd_c##i.`V' 
 matrix R=r(table)'
 local pval=R[4,4]
 if `pval'<0.05 {
 disp "`V'"  _col(30)  "P = " %8.6f  `pval'
 }
 }

 *thank you Pooja
