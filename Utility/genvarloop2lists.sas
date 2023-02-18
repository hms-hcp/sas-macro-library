/*--------------------------------------------------------------------------*
| Department of Health Care Policy - Harvard Medical School - Boston, MA   |
|--------------------------------------------------------------------------|
| File Name      = genvarloop2list.sas                                          |
| Path or URL    = /usr/apps/sas/maclib/                                   |
| Version        =  I                                                      |
| Creation Date  = Dec 8 2009                                              |
| Author         = Rita Volya                                              |
| Affiliation    = HCP                                                     |
| Category       = Working with Data variables                             |
| Keys           =                                                         |
|                                                                          |
|--------------------------------------------------------------------------|
| Brief Description:The macro extracts one by one the names of the variable| 
|  from two lists and performs a code supplied to the macro on using       |
|   two extracted variables: one from the main list and the second one from!
! the second list but the same position on list as the first variable      |
*--------------------------------------------------------------------------*;

*--------------------------------------------------------------------------*
| Update Information: Repeat below fields for each update                  |
|--------------------------------------------------------------------------|
| Modified Date  = DD MMM YYYY                                             |
| By Whom        =                                                         |
| Reason:                                                                  |
*--------------------------------------------------------------------------*;

*--------------------------------------------------------------------------*
| DISCLAIMER:                                                              |
|--------------------------------------------------------------------------|
   The information contained within this file is provided "AS IS" by the
Department of Health Care Policy (HCP), Harvard Medical School, as a 
service to the HCP Programmers Group and the Department's other users of
SAS.  There are no warranties, expressed or implied, as to the
merchantability or fitness for a particular purpose regarding the accuracy
of the materials or programming code contained herein. This macro may be
distributed freely as long as all comments, headers and related files are
included.

   Copyright (C) 2005 by The Department of Health Care Policy, Harvard 
Medical School, Boston, MA, USA. All rights reserved.
*--------------------------------------------------------------------------*;

*--------------------------------------------------------------------------*
| Full Description: The macro extracts one by one the names of the variable| 
|  from a list and performs a code supplied to the macro on using          |
|   the extracted variable                                                 |
|--------------------------------------------------------------------------|*;
   
*--------------------------------------------------------------------------*
| Instructions:                                                            |
|--------------------------------------------------------------------------|*;
 /* 
   Keyword Parameter:
  1. VARLIST, VARLIST2= supply a list of variables separated by blanks
     Ex. %let list=age sex white;
         varlist=&list
  2. VARLIST2= second list of variables separated by blanks- has to have
                 the same number of variables as the first list
  3.CODE= Supply the SAS code or a SAS macro call that will perform 
          necessary operations involving each variable from the list VARLIST.
          The code hast to be included into %nrstr() function to delay.
          The macro resolution of the code.
          Reference the extracted variable name by &nextvar.
     Ex. code=%nrstr(proc freq data=mydata; tables &nextvar; run;)
 Macro call example:
 %genvarloop(varlist=&list,code=%nrstr(proc freq data=mydata; 
             tables &nextvar*&nextvar2; run;))
 If the list &list is very long and you want to use any valid list of
 variables valid in  SAS Data Step variables names you can use the macro
 %listvars before calling %genvarloop 
*--------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------*
| Macro Code Begins Here.                                                  |
*--------------------------------------------------------------------------*;*/
%macro genvarloop2lists(varlist=,varlist2=,code=);
%local i nextvar nextvar2 ;
%let i=1;
%do %while(%length(%scan("&varlist",&i," "))>0);
    %let nextvar=%trim(%scan("&varlist",&i," "));
    %let nextvar2=%trim(%scan("&varlist2",&i," "));
    %unquote(&code)
    %let i=%eval(&i+1);
  %end;

%mend genvarloop2lists;

