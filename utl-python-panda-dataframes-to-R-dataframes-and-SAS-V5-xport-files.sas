Python panda dataframes to R dataframes and SAS V5 xport files                                                          
                                                                                                                        
Feather is very fast and lossless common formats for R and Python.                                                      
Feather honors binary doubles IEE floats.                                                                               
                                                                                                                        
You need MS C++ Redist 2015 Visual Studio                                                                               
                                                                                                                        
I could not get the Python xport package to create a SAS v5 XPORT FILE.                                                 
                                                                                                                        
Problem                                                                                                                 
                                                                                                                        
     a. Python: Read sas7bdat                                                                                           
     b. Python: Convert to Python Panda dataframe                                                                       
     c. Python: Convert Python dataframe to lossless binary file (extremeley fast - mutithreaded)                       
     d. R: Read Python binary file into a R dataframe  (extremeley fast - mutithreaded)                                 
     e. R: Export R dataframe to SAS V5 transport                                                                       
     f. SAS: Operate directly on the transport file (slight loss of precision - mainframe 8 byte exponent)              
                                                                                                                        
*_                   _                                                                                                  
(_)_ __  _ __  _   _| |_                                                                                                
| | '_ \| '_ \| | | | __|                                                                                               
| | | | | |_) | |_| | |_                                                                                                
|_|_| |_| .__/ \__,_|\__|                                                                                               
        |_|                                                                                                             
;                                                                                                                       
                                                                                                                        
libname sd1 'd:/sd1';                                                                                                   
options validvarname=upcase;                                                                                            
data sd1.class;                                                                                                         
  set sashelp.class(obs=10);                                                                                            
run;quit;                                                                                                               
                                                                                                                        
SD1.CLASS total obs=10                                                                                                  
                                                                                                                        
  NAME       SEX    AGE    HEIGHT    WEIGHT                                                                             
                                                                                                                        
  Alfred      M      14     69.0      112.5                                                                             
  Alice       F      13     56.5       84.0                                                                             
  Barbara     F      13     65.3       98.0                                                                             
  Carol       F      14     62.8      102.5                                                                             
  Henry       M      14     63.5      102.5                                                                             
  James       M      12     57.3       83.0                                                                             
  Jane        F      12     59.8       84.5                                                                             
  Janet       F      15     62.5      112.5                                                                             
  Jeffrey     M      13     62.5       84.0                                                                             
  John        M      12     59.0       99.5                                                                             
                                                                                                                        
*            _               _                                                                                          
  ___  _   _| |_ _ __  _   _| |_ ___                                                                                    
 / _ \| | | | __| '_ \| | | | __/ __|                                                                                   
| (_) | |_| | |_| |_) | |_| | |_\__ \                                                                                   
 \___/ \__,_|\__| .__/ \__,_|\__|___/                                                                                   
                |_|                                                                                                     
  __            _   _                  __ _ _                                                                           
 / _| ___  __ _| |_| |__   ___ _ __   / _(_) | ___                                                                      
| |_ / _ \/ _` | __| '_ \ / _ \ '__| | |_| | |/ _ \                                                                     
|  _|  __/ (_| | |_| | | |  __/ |    |  _| | |  __/                                                                     
|_|  \___|\__,_|\__|_| |_|\___|_|    |_| |_|_|\___|                                                                     
                                                                                                                        
;                                                                                                                       
                                                                                                                        
%utlrulr                                                                                                                
      (                                                                                                                 
       uinflt =d:/sd1/class.sas7bdat,                                                                                   
       uprnlen =80,    /* Linesize for Dump */                                                                          
       ulrecl  =80,    /* maximum record length */                                                                      
       urecfm   =f,                                                                                                     
       uobs = 10,       /* number of obs to dump */                                                                     
       uotflt =d:/txt/DataSampleHex.txt                                                                                 
      );                                                                                                                
                                                                                                                        
                                                                                                                        
SCII Flatfile Ruler & Hex                                                                                               
utlrulr                                                                                                                 
d:/sd1/class.sas7bdat                                                                                                   
d:/txt/DataSampleHex.txt                                                                                                
                                                                                                                        
                                                                                                                        
 --- Record Number ---  1   ---  Record Length ---- 80                                                                  
                                                                                                                        
...............`..........1...."".33..2..............."".33..2.3.#3..........                                        
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8                                        
000000000000CE86B11CB9000C381111220330030000000000001111220330030302301001000000                                        
0000000000002A10341FD280971C8F01220331224000000000318F0122033122431330C000310000                                        
                                                                                                                        
                                                                                                                        
 --- Record Number ---  2   ---  Record Length ---- 80                                                                  
                                                                                                                        
....SAS FILECLASS                           ................................DATA                                        
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8                                        
00005452444444455222222222222222222222222222000000000000000000000000000000004454                                        
0000313069C53C133000000000000000000000000000000000000000000000000000000000004141                                        
                                                                                                                        
                                                                                                                        
 --- Record Number ---  3   ---  Record Length ---- 80                                                                  
                                                                                                                        
    ......K....A..K....A....................................9.0401M6X64_7PRO....                                        
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8                                        
22220000CF4B91D4CF4B91D4000009DC000009DC0000000000000000000032333343533535540000                                        
00000000F7BD31C1F7BD31C100000C8000000C80001000101000000000009E0401D6864F702F0000                                        
                                                                                                                        
                                                                                                                        
 --- Record Number ---  4   ---  Record Length ---- 80                                                                  
                                                                                                                        
......................................................K...$...$...$.............                                        
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8                                        
0000000000000000000000000000000000000000000000000000CF4B8B2D8B2D8B2D000000000000                                        
0000000000000000000000000000000000000000000000000000F7BD394839483948000000000000                                        
                                                                                                                        
                                                                                                                        
 --- Record Number ---  5   ---  Record Length ---- 80                                                                  
                                                                                                                        
....c.........K....A............................................................                                        
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...8                                        
00006E910000CF4B91D4000000000000000000000000000000000000000000000000000000000000                                        
000036780000F7BD31C1000000000000000000000000000000000000000000000000000000000000                                        
                                                                                                                        
*____        _       _         __                                                                                       
|  _ \    __| | __ _| |_ __ _ / _|_ __ __ _ _ __ ___   ___                                                              
| |_) |  / _` |/ _` | __/ _` | |_| '__/ _` | '_ ` _ \ / _ \                                                             
|  _ <  | (_| | (_| | || (_| |  _| | | (_| | | | | | |  __/                                                             
|_| \_\  \__,_|\__,_|\__\__,_|_| |_|  \__,_|_| |_| |_|\___|                                                             
                                                                                                                        
;                                                                                                                       
                                                                                                                        
> library(feather);data<-read_feather(path="d:/fth/df.fth");data;                                                       
# A tibble: 10 x 5                                                                                                      
   NAME    SEX     AGE HEIGHT WEIGHT                                                                                    
   <chr>   <chr> <dbl>  <dbl>  <dbl>                                                                                    
 1 Alfred  M        14   69    112.                                                                                     
 2 Alice   F        13   56.5   84                                                                                      
 3 Barbara F        13   65.3   98                                                                                      
 4 Carol   F        14   62.8  102.                                                                                     
 5 Henry   M        14   63.5  102.                                                                                     
 6 James   M        12   57.3   83                                                                                      
 7 Jane    F        12   59.8   84.5                                                                                    
 8 Janet   F        15   62.5  112.                                                                                     
 9 Jeffrey M        13   62.5   84                                                                                      
10 John    M        12   59     99.5                                                                                    
>                                                                                                                       
                                                                                                                        
*                _        _     _                                                                                       
 ___  __ _ ___  | |_ __ _| |__ | | ___                                                                                  
/ __|/ _` / __| | __/ _` | '_ \| |/ _ \                                                                                 
\__ \ (_| \__ \ | || (_| | |_) | |  __/                                                                                 
|___/\__,_|___/  \__\__,_|_.__/|_|\___|                                                                                 
                                                                                                                        
;                                                                                                                       
                                                                                                                        
                                                                                                                        
WORK.CLASS total obs=10                                                                                                 
                                                                                                                        
  NAME       SEX    AGE    HEIGHT    WEIGHT                                                                             
                                                                                                                        
  Alfred      M      14     69.0      112.5                                                                             
  Alice       F      13     56.5       84.0                                                                             
  Barbara     F      13     65.3       98.0                                                                             
  Carol       F      14     62.8      102.5                                                                             
  Henry       M      14     63.5      102.5                                                                             
  James       M      12     57.3       83.0                                                                             
  Jane        F      12     59.8       84.5                                                                             
  Janet       F      15     62.5      112.5                                                                             
  Jeffrey     M      13     62.5       84.0                                                                             
  John        M      12     59.0       99.5                                                                             
                                                                                                                        
*                                                                                                                       
 _ __  _ __ ___   ___ ___  ___ ___                                                                                      
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                     
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                     
| .__/|_|  \___/ \___\___||___/___/                                                                                     
|_|                                                                                                                     
;                                                                                                                       
                                                                                                                        
* INPUT;                                                                                                                
                                                                                                                        
libname sd1 'd:/sd1';                                                                                                   
options validvarname=upcase;                                                                                            
data sd1.class;                                                                                                         
  set sashelp.class(obs=10);                                                                                            
run;quit;                                                                                                               
                                                                                                                        
* PYTHON;                                                                                                               
                                                                                                                        
%utlfkil(d:/fth/df.fth);                                                                                                
%utl_submit_py64_37('                                                                                                   
import pandas as pd;                                                                                                    
import feather;                                                                                                         
import numpy as np;                                                                                                     
import pandas as pd;                                                                                                    
from sas7bdat import SAS7BDAT;                                                                                          
with SAS7BDAT("d:/sd1/class.sas7bdat") as m:;                                                                           
.   mdata = m.to_data_frame();                                                                                          
print(mdata);                                                                                                           
feather.write_dataframe(mdata, "d:/fth/df.fth");                                                                        
');                                                                                                                     
                                                                                                                        
* R;                                                                                                                    
                                                                                                                        
%utl_submit_r64('                                                                                                       
library(SASxport);                                                                                                      
library(feather);                                                                                                       
library(data.table);                                                                                                    
want<-as.data.table(read_feather(path="d:/fth/df.fth"));                                                                
write.xport(want,file="d:/xpt/data.xpt");                                                                               
');                                                                                                                     
                                                                                                                        
* SAS;                                                                                                                  
                                                                                                                        
libname xpt xport "d:/xpt/data.xpt";                                                                                    
data class;                                                                                                             
  set xpt.want;                                                                                                         
run;quit;                                                                                                               
libname xpt clear;                                                                                                      
                                                                                                                        
                                                                                                                        
