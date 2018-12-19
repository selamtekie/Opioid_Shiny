#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
library(tidyverse)
library(ggplot2)
library(ggmap)
library(plotly)
library(ggmap)
library(shinydashboard)
library(dplyr)

overdoses_shiny <- readRDS('./data/overdoses.rds')
overdoses_shiny <- overdoses_shiny %>% mutate(Deaths_Per_100K =  Deaths/Population * 100000)
states <- as.data.frame(overdoses_shiny) %>% 
    select(Abbrev,State) %>% 
   unique()

states <- sort(states$Abbrev)

