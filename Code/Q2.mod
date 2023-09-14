/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Admin
 * Creation Date: Apr 14, 2022 at 7:00:11 PM
 *********************************************/

{string} Product = ... ;

float Max_Hour1 = ... ;
float Max_Hour2 = ... ;
float Max_Hour3 = ... ;
float Profit[Product] = ... ;
int Min_Product = ... ;
float Set_Up[Product] = ... ;
float Production[Product] = ... ;
float Assembeling[Product] = ... ;
float Shipping[Product] = ... ;

dvar int+ P[Product] ;
dvar boolean x[Product] ;

maximize sum(i in Product) P[i]*Profit[i] ;

subject to{
  sum(i in Product) Set_Up[i]*x[i] + sum(j in Product) Production[j]*P[j] <= Max_Hour1 ;
  sum(i in Product) Assembeling[i]*P[i] <= Max_Hour2 ;
  sum(i in Product) Shipping[i]*P[i] <= Max_Hour3 ;
  forall (i in Product)
    P[i] >= Min_Product*x[i] ;
  forall (i in Product)
    P[i] <= 10000*x[i] ;
}