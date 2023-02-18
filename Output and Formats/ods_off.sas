*--------------------------------------------------------------------------*
| Department of Health Care Policy - Harvard Medical School - Boston, MA   |
|--------------------------------------------------------------------------|
| File Name      = _MACRO_HEADER.sas                                       |
| Path or URL    = /usr/apps/sas/maclib/                                   |
| Version        =  1                                                       |
| Creation Date  = 22 02 2016                                              |
| Author         = adopted by Rita Volya from Rick Wicklin                 |
| Affiliation    = HCP                                                     |
| Category       = Utility                                                 |
| Keys           =                                                         |
|                                                                          |
|--------------------------------------------------------------------------|
| Brief Description: Turns OFF ODS settings to ensure efficiency for       |
| programs analizing simulated data. Run the macro %ODS_ON afterr the      |
| procedure to restore ODS settings                                        |
|--------------------------------------------------------------------------|
   Template for Macro Header.

*--------------------------------------------------------------------------*;

*--------------------------------------------------------------------------*
| Update Information: Repeat below fields for each update                  |
|--------------------------------------------------------------------------|
| Modified Date  = 22 02 2016                                              |
| By Whom        =    Rita Volya                                           |
| Reason:

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
| Macro Code Begins Here.                                                  |
*--------------------------------------------------------------------------*;


%macro ods_off();
ods graphics off;
ods exclude all;
ods results off;
options nonotes;
%mend ods_off;