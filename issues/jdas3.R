#' ---
#' title: JDAS bevindingen
#' author: Edwin de Jonge
#' date: ""
#' output:
#'    cbsmarkdown::cbs_pdf_document: default
#'    pdf_document: default
#' ---
#+ include=FALSE
library(validatetools)
version <- packageVersion("validatetools")
#' 1
#' ==========
#'
#' Gefixed in versie 0.3.4: had te maken met gelijkheidsconstraints:die werden niet goed
#' als soft constraints toegevoegd.
#' 
#+ test 
rules <- validator(x==0, x==1)
detect_infeasible_rules(rules)

#' 2
#' ==============
#' 
#' Gefixed in versie 0.3.4: had te maken dat componenten onterecht werden toegevoegd als
#' soft constraints.  
detect_infeasible_rules( validator( if ( x > 1 ) y < 0
                                  , x > 2
                                  , y > 1 
                                  )
                        )
#' #3
#' 
#' Terechte opmerking: gefixed in versie 0.3.4
rules <- validator( rule1 = x > 0
                  , rule2 = y > 0
                  , rule3 = x + y == -1
                  )

is_contradicted_by(rules,"rule3")

#' #4 
#' Gefixed in versie 0.3.4
is_implied_by(validator( rule1 = x == 12
                       , rule2 = x > 6
                       ), "rule2")

#' #5
#' Dit is correct gedrag: rule 2 is specifieker dan rule 1, dus hoeft niet gefixed
is_implied_by(validator(rule1=x>1, rule2=x>6),"rule2")


#' #Run with:
packageVersion("validatetools")
packageVersion("validate")
