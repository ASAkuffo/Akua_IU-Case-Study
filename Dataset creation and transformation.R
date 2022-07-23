
#Install dplyr package

install.packages("dplyr")
install.packages("tidyverse")
install.packages("utils")
install.packages("xlsx")
install.packages("writexl")

# importing data from excel
library(tidyverse)
library(purrr)
library(readxl)
library(ggplot2)
library(dplyr)
library(writexl)

#Importing data from excel, selecting variables, renaming variables and selecting schools of interest 
#for comparison

hd2020 <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/HD2020/hd2020.csv", header=TRUE)
hd2020_2 <-hd2020 %>%  
  select("INSTNM",  "OPEFLAG", "ICLEVEL", "HLOFFER", 'UNITID')%>%
  rename('TITLEIV' = 'OPEFLAG', 'PROGLVL' = 'ICLEVEL', 'HILVLOFFERED' = 'HLOFFER')%>%
  filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  

eap2020 <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/EAP2020/eap2020.csv")
eap2020_2 <- eap2020 %>%
  select("OCCUPCAT", "EAPTYP", "EAPFT","EAPPT", "EAPTOT",  "FACSTAT", "EAPCAT", "UNITID")%>%
  rename("OCCUPATION" = "OCCUPCAT", "EMPLOYEES" = "EAPTYP", "FULLTIMEEMPLOYEES" = "EAPFT",
                   "PART-TIMEEMPLOYEES" = "EAPPT", "TOTALEMPLOYEES" = "EAPTOT",  "TENURESTAT" = "FACSTAT",
                   "OCCUPATIONANDFAC" = "EAPCAT")%>%
   filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  

f1920 <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/F1920_F1A/f1920_f1a.csv")
f1920_2 <- f1920 %>% 
  select("F1C011", "F1C051", "F1C021", "F1C031", "F1C061", "F1C071","F1C101", "F1C191", "F1E01", "F1E02" ,"F1E03",
                 "F1E04", "F1N07", "F1H03A", "F1A06", "F1A13", "UNITID")%>%
  rename("INSTRUCTION" = "F1C011", "ACADEMICSUPPORT" ="F1C051", "RESEARCH" ="F1C021", "PUBLICSERVICE" ="F1C031",
         "STUDENTSERVICES" = "F1C061", "INSTITUTSUPPORT" = "F1C071", "SCHOLARSHIPS&FELLOWS" = "F1C101", "TOTALEXPENSES"= "F1C191",
         "PELLGRANTS" = "F1E01","OTHERFEGRANTS" = "F1E02", "STATEGRANTS" = "F1E03",  "LOCALGRANT" = "F1E04",
         "TOTALEXPENSESINST" = "F1N07",  "GIFTS" = "F1H03A", "ASSSETS" = "F1A06", "LIABILITIES"="F1A13")%>%
  filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  
  
adm2020 <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/adm2020.csv")
adm2020_2 <- adm2020 %>% 
  select("ADMCON1", "ADMCON7", "ENRLT", "ENRLM", "ENRLW","ENRLFT", "ENRLPT", "UNITID")%>%
  rename("SECSCHOOLRANK" = "ADMCON1", "ADMTESTSCORES" = "ADMCON7", "TOTALENROLLED" = "ENRLT", 
         "MEN ENROLLED" = "ENRLM", "WOMENENROLLED" = "ENRLW","FULLTIME" = "ENRLFT", 
         "PARTTIME" = "ENRLPT")%>%
  filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  

effy2020 <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/effy2020.csv")
effy2020_2 <- effy2020 %>% 
  select("EFYTOTLT", "EFYTOTLM", "EFYTOTLW", "EFYAIANT", "EFYASIAT", "EFYBKAAT", "EFYHISPT", "EFYNHPIT", "EFYWHITT",
                    "EFY2MORT", "EFYUNKNT", "EFYNRALT", "UNITID")%>%
  filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  

c2020_c <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/C2020_C/c2020_c.csv")
c2020_c2 <- c2020_c %>%
  select("CSTOTLT", "AWLEVELC", "CSTOTLM", "CSTOTLW", "CSAIANT", "CSASIAT", "CSBKAAT","CSHISPT", "CSWHITT", "CSNHPIT",
                 "CS2MORT","CSUNKNT", "CSNRALT", "CSUND18", "CS18_24","CS25_39", "CSABV40", "CSUNKN", "UNITID")%>%
  rename("TOTALCOMPLETED" = "CSTOTLT", "AWARDLEVEL" = "AWLEVELC", "MENCOMPLETED" = "CSTOTLM", "WOMENCOMPLETED" = "CSTOTLW",
          "AMERICANINDIAN" = "CSAIANT", "ASIAN" = "CSASIAT", "BLACK" = "CSBKAAT", "HISPNAIC" = "CSHISPT", "WHITE" = "CSWHITT", 
         "HAWAIIAN" = "CSNHPIT", "TWOORMORE" = "CS2MORT", "UNKNOWN" = "CSUNKNT", "INTERNATIONAL" = "CSNRALT", "UNDER 18" = "CSUND18",
         "18_24com" = "CS18_24", "25_39com" = "CS25_39", "ABOVE40com" = "CSABV40", "UNKNOWNcom" = "CSUNKN")%>%
  filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  

c2020dep <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/C2020DEP/c2020dep.csv")
c2020dep_2 <- c2020dep %>% 
  select("PTOTAL", "PTOTALDE", "PMASTR", "PASSOC", "PBACHL", "PDOCOT", "PCERT1A", "PCERT1B", "PCERT2", "PPBACC", "PPMAST", 
                    "PCERT4", "CIPCODE", "UNITID")%>%
  filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  

ic2020 <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/IC2020/ic2020.csv")
ic2020_2 <- ic2020 %>% select( "CALSYS", "CNTLAFFI", "LEVEL1","LEVEL1A", "LEVEL1B", "LEVEL2", "LEVEL3","LEVEL4", "LEVEL5", "LEVEL6",
                               "LEVEL7","LEVEL8", "LEVEL12","LEVEL17", "LEVEL18","LEVEL19","DISTCRS", "DISTPGS", "UNITID")%>%
  rename("CERTLESSTHANAYEAR"= "LEVEL1",  "CONTROLORAFFIL" = "CNTLAFFI","CERTLESS12WKS" = "LEVEL1A", "CERTLESSYEAR" = "LEVEL1B", 
         "CERTLESS2YRS" = "LEVEL2", "ASSOC" = "LEVEL3", "CERTLESS4YRS"= "LEVEL4", "BACHELORS"= "LEVEL5", "POSTBAC" ="LEVEL6", 
         "MASTERS" = "LEVEL7","POSTMAST" = "LEVEL8", "OTHER" = "LEVEL12","DOCDEGRES" = "LEVEL17", "DOCPROF" = "LEVEL18", 
         "DOCOTHER" ="LEVEL19", "DISTEDUCOU" = "DISTCRS", "DISEDUPROG"= "DISTPGS", "CALENDERSYS" = "CALSYS")%>%
  filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  

ic2020ay <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/IC2020_AY/ic2020_ay.csv")
ic2020ay_2 <- ic2020ay %>% 
  select("TUITION2","TUITION3", "TUITION6", "TUITION7", "CHG4AY2","CHG6AY2", "CHG6AY3", "CHG9AY2", "UNITID")%>%
  rename("INSTATEUNDERGRAD" = "TUITION2","OUTSTTEUNDERGRAD" = "TUITION3", "INSTATEGRAD"= "TUITION6", "OUTSTATEGRAD" = "TUITION7",
         "BOOKS&SUPPLIES" = "CHG4AY2", "ROOMANDBOARDCAMPUS" = "CHG6AY2", "OTHEREXPENSES" = "CHG6AY3", "OFFCAMPUS" = "CHG9AY2")%>%
  filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  

ic2020py <- read.csv("C:/Users/Sakyiabea/Desktop/IU Case Use Activity/IC2020_PY/ic2020_py.csv")
ic2020py_2 <- ic2020_py %>%
  select("V1", "V2", "V3")%>%
  rename("NUMBEROFPROGRAMS" = "V2",  "LARGESTPROG" = "V3", "UNITID" = "V1")%>%
  filter(UNITID == '151351' | UNITID == '243780')%>%
  mutate(as.character('UNITID'))  

#Creating a list and merging data frames
IU_list<- list(hd2020_2, eap2020_2, f1920_2, adm2020_2, effy2020_2, c2020dep_2) 
IU_list_1<- list(c2020_c2,  ic2020_2, ic2020ay_2)

IU_list_2 <-IU_list %>%
  reduce(left_join, by = "UNITID")

IU_list_3 <-IU_list_1 %>%
  reduce(left_join, by = "UNITID")

#Exporting data to Excel
write_xlsx(IU_list_2, "IU_list_2.xlsx")
write_xlsx(IU_list_3, "IU_list_3.xlsx")

            
  