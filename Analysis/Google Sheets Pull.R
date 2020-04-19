library(tidyverse)
library(dplyr)
library(lubridate)
library(tidyr)
library(googlesheets4)


#main       <-  read_sheet("https://docs.google.com/spreadsheets/d/1fPaFaDq9XK6PiDpGK2qx-Z9yODEWRCmsXc2vfj4VSTQ/edit#gid=1764921743",
main        <-  read.csv("Analysis/Data from G Drive/Coffee Analysis - Data.csv",
                            sheet = "Data") %>%
                            unite(helper, Date, 'Total Seconds')

#brewMaster <-  read_sheet("https://docs.google.com/spreadsheets/d/1d5VpUbqruQvQ95_BI1FW2vM3iAUUPnJQXVBOnpltPUI/edit#gid=1705883784",
brewMaster  <-  read.csv("Analysis/Data from G Drive/Untitled - Untitled.csv",
                            sheet = "Untitled") %>% 
                            mutate(date  = as.Date(createdAt)) %>%
                            unite(helper, date, 'total time')

merged <- merge.data.frame(main, brewMaster, by.x = "helper", by.y = "helper")