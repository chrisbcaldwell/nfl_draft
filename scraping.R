library(rvest)

# Data I want:
#
# Name
# Position
# College (useful to distinguish two players w same name)
# Overview text (could be something there)
# Strengths
# Weaknesses

# --------------------------------
# Feeling my way around this with Richard Sherman
# --------------------------------

sherman <- read_html("http://www.nfl.com/combine/profiles?id=2495507")

# Heading: "Strengths"
sherman %>% 
  html_node("article h4") %>%
  html_text()

# Position
sherman %>% 
  html_node(".banner span") %>%
  html_text()

# Name
sherman %>% html_node("h2") %>% html_text()

# ----------------
# Testing methods on a randonly selected page
# ----------------

test_guy <- read_html("http://www.nfl.com/combine/profiles?id=2495500")
# Congratulations, Will Hill!

# Position
test_guy %>% html_node(".banner span") %>% html_text()
# Adds two spaces to the end

# Name
test_guy %>% html_node("h2") %>% html_text()
# Full name

# College
test_guy %>% html_node(".banner h4") %>% html_text()
# Position space space college e.g. "FS  Florida"

# Overview
test_guy %>% html_node("#player-info p") %>% html_text()

# Strengths
test_guy %>% html_node("h3+ article") %>% html_text()
# Has word "Strengths" at the beginning -- need to remove

# Weaknesses
test_guy %>% html_node("article+ article") %>% html_text()
# Has word "Weaknesses" at the beginning -- need to remove

# ------------------------------
# Blank profile
# ------------------------------

blank <- read_html("http://www.nfl.com/combine/profiles?id=2508061")
blank %>% html_node("#player-info p") %>% html_text()
# NA.  This is good.  It will not fail if I pull a non-existent
# player page.

# ------------------------------
# Trying to get player ID ranges for each draft class
# ------------------------------

# generating a sample
test_ids <- seq(2490014, 2560014, 100)
base_url <- "http://www.nfl.com/combine/profiles?id="
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# exploring gaps in id#

# looking for start of 2011 guys
test_ids <- seq(2494000, 2495114, 4)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# looking for boundary btw 2011 and 2007!?
test_ids <- seq(2495300, 2495600, 4)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# looking for boundary btw 2007 and 2006
test_ids <- seq(2495716, 2495812, 4)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# looking for boundary btw 2006 and 2012
test_ids <- seq(2496000, 2532800, 25)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# looking for boundary btw 2012 and 2013
test_ids <- seq(2533012, 2539316, 17)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# looking for boundary btw 2013 and 2014
test_ids <- seq(2540012, 2543616, 11)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# looking for boundary btw 2014 and 2015
test_ids <- seq(2543712, 2552316, 37)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# looking for boundary btw 2015 and 2016
test_ids <- seq(2552414, 2555250, 11)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# looking for boundary btw 2016 and 2017
test_ids <- seq(2555514, 2557950, 7)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# finding end of 2017 players
test_ids <- seq(2557950, 2560000,7)
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# finding exact end of 2011 guys
# (2011 end is very close to those garbage 2007 guys)
test_ids <- 2495504:2495524
tests <- array(dim = c(length(test_ids), 2))
for(i in 1:length(test_ids)) {
  url <- paste0(base_url, test_ids[i])
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  tests[i,] <- c(test_ids[i], name)
}
populated_ids <- tests[,2] != " "
tests <- tests[populated_ids,]

# ----------------------
# Moment of truth: data scraping for realzies
# ----------------------

columns <- c("Year", "Name", "NFLid", "Pos", "Coll", "Overview",
  "Strengths", "Weaknesses")

# 2011

year <- 2011
range <- 2494900:2495511
draft2011 <- c()
for(id in range) {
  url <- paste0(base_url, id)
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  pos <- guy %>% html_node(".banner span") %>% html_text()
  coll <- guy %>% html_node(".banner h4") %>% html_text()
  overview <- guy %>% html_node("#player-info p") %>% html_text()
  strengths <- guy %>% html_node("h3+ article") %>% html_text()
  weaknesses <-
    guy %>% html_node("article+ article") %>% html_text()
  res <-
    c(year, name, id, pos, coll, overview, strengths, weaknesses)
  draft2011 <- rbind(draft2011, res)
}
colnames(draft2011) <- columns

# 2012
# ### = change this for each year
year <- 2012 ###
range <- 2532600:2533700 ###
draft2012 <- c() ###
for(id in range) {
  url <- paste0(base_url, id)
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  pos <- guy %>% html_node(".banner span") %>% html_text()
  coll <- guy %>% html_node(".banner h4") %>% html_text()
  overview <- guy %>% html_node("#player-info p") %>% html_text()
  strengths <- guy %>% html_node("h3+ article") %>% html_text()
  weaknesses <-
    guy %>% html_node("article+ article") %>% html_text()
  res <-
    c(year, name, id, pos, coll, overview, strengths, weaknesses)
  draft2012 <- rbind(draft2012, res) ### two places
}
colnames(draft2012) <- columns ###

# 2013
# ### = change this for each year
year <- 2013 ###
range <- 2539000:2540500 ###
draft2013 <- c() ###
for(id in range) {
  url <- paste0(base_url, id)
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  pos <- guy %>% html_node(".banner span") %>% html_text()
  coll <- guy %>% html_node(".banner h4") %>% html_text()
  overview <- guy %>% html_node("#player-info p") %>% html_text()
  strengths <- guy %>% html_node("h3+ article") %>% html_text()
  weaknesses <-
    guy %>% html_node("article+ article") %>% html_text()
  res <-
    c(year, name, id, pos, coll, overview, strengths, weaknesses)
  draft2013 <- rbind(draft2013, res) ### two places
}
colnames(draft2013) <- columns ###

# 2014
# ### = change this for each year
year <- 2014 ###
range <- 2543400:2550200 ###
draft2014 <- c() ###
for(id in range) {
  url <- paste0(base_url, id)
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  pos <- guy %>% html_node(".banner span") %>% html_text()
  coll <- guy %>% html_node(".banner h4") %>% html_text()
  overview <- guy %>% html_node("#player-info p") %>% html_text()
  strengths <- guy %>% html_node("h3+ article") %>% html_text()
  weaknesses <-
    guy %>% html_node("article+ article") %>% html_text()
  res <-
    c(year, name, id, pos, coll, overview, strengths, weaknesses)
  draft2014 <- rbind(draft2014, res) ### two places
}
colnames(draft2014) <- columns ###

# 2014 part 2
# ### = change this for each year
year <- 2014 ###
range <- 2547464:2550200 ###
#draft2014 <- c() ###
for(id in range) {
  url <- paste0(base_url, id)
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  pos <- guy %>% html_node(".banner span") %>% html_text()
  coll <- guy %>% html_node(".banner h4") %>% html_text()
  overview <- guy %>% html_node("#player-info p") %>% html_text()
  strengths <- guy %>% html_node("h3+ article") %>% html_text()
  weaknesses <-
    guy %>% html_node("article+ article") %>% html_text()
  res <-
    c(year, name, id, pos, coll, overview, strengths, weaknesses)
  draft2014 <- rbind(draft2014, res) ### two places
}
colnames(draft2014) <- columns ###

# 2015
# ### = change this for each year
year <- 2015 ###
range <- 2552000:2552900 ###
draft2015 <- c() ###
for(id in range) {
  url <- paste0(base_url, id)
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  pos <- guy %>% html_node(".banner span") %>% html_text()
  coll <- guy %>% html_node(".banner h4") %>% html_text()
  overview <- guy %>% html_node("#player-info p") %>% html_text()
  strengths <- guy %>% html_node("h3+ article") %>% html_text()
  weaknesses <-
    guy %>% html_node("article+ article") %>% html_text()
  res <-
    c(year, name, id, pos, coll, overview, strengths, weaknesses)
  draft2015 <- rbind(draft2015, res) ### two places
  print(paste0(id, "\r"))
}
colnames(draft2015) <- columns ###

# 2016
# ### = change this for each year
year <- 2016 ###
range <- 2555000:2555700 ###
draft2016 <- c() ###
for(id in range) {
  url <- paste0(base_url, id)
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  pos <- guy %>% html_node(".banner span") %>% html_text()
  coll <- guy %>% html_node(".banner h4") %>% html_text()
  overview <- guy %>% html_node("#player-info p") %>% html_text()
  strengths <- guy %>% html_node("h3+ article") %>% html_text()
  weaknesses <-
    guy %>% html_node("article+ article") %>% html_text()
  res <-
    c(year, name, id, pos, coll, overview, strengths, weaknesses)
  draft2016 <- rbind(draft2016, res) ### two places
}
colnames(draft2016) <- columns ###

# 2017
# ### = change this for each year
year <- 2017 ###
range <- 2557700:2558713 ###
draft2017 <- c() ###
for(id in range) {
  url <- paste0(base_url, id)
  guy <- read_html(url)
  name <- guy %>% html_node("h2") %>% html_text()
  pos <- guy %>% html_node(".banner span") %>% html_text()
  coll <- guy %>% html_node(".banner h4") %>% html_text()
  overview <- guy %>% html_node("#player-info p") %>% html_text()
  strengths <- guy %>% html_node("h3+ article") %>% html_text()
  weaknesses <-
    guy %>% html_node("article+ article") %>% html_text()
  res <-
    c(year, name, id, pos, coll, overview, strengths, weaknesses)
  draft2017 <- rbind(draft2017, res) ### two places
}
colnames(draft2017) <- columns ###

# ---------------------------
# Data cleaning
# ---------------------------

########## First, testing on 2011 data

# finding NA rows
na.2011 <- draft2011[,"Name"] == " "
tempdf.2011 <- draft2011[!na.2011,]

# removing "POS  " from "POS  College"
tempdf.2011[,5] <- 
  apply(tempdf.2011[,4:5], 1, function(x) sub(x[1], "", x[2]))

# removing whitespace in pos
tempdf.2011[,"Pos"] <- 
  sapply(tempdf.2011[,"Pos"], function(x) gsub("[[:space:]]", "", x))

# removing "Strengths" from the beginning of Strengths
tempdf.2011[,"Strengths"] <- 
  sapply(tempdf.2011[,"Strengths"],
         function(x) sub("Strengths ", "", x))

# removing "Weaknesses" from the beginning of Strengths
tempdf.2011[,"Weaknesses"] <- 
  sapply(tempdf.2011[,"Weaknesses"],
         function(x) sub("Weaknesses ", "", x))

########### Applying to all data

# Merging data
draftdata <- rbind(draft2011, draft2012, draft2013, draft2014,
  draft2015, draft2016, draft2017)

# finding and removing NA rows
na.all <- draftdata[,"Name"] == " "
draftdata <- draftdata[!na.all,]

# removing "POS  " from "POS  College"
draftdata[,5] <- 
  apply(draftdata[,4:5], 1, function(x) sub(x[1], "", x[2]))

# removing whitespace in pos
draftdata[,"Pos"] <- 
  sapply(draftdata[,"Pos"], function(x) gsub("[[:space:]]", "", x))

# removing "Strengths" from the beginning of Strengths
draftdata[,"Strengths"] <- 
  sapply(draftdata[,"Strengths"],
         function(x) sub("Strengths ", "", x))

# removing "Weaknesses" from the beginning of Strengths
draftdata[,"Weaknesses"] <- 
  sapply(draftdata[,"Weaknesses"],
         function(x) sub("Weaknesses ", "", x))

# ----------------------------------------
# Saving data to file
# ----------------------------------------
write.table(draftdata, file = "draftdata.txt", sep = "\t",
  row.names = FALSE, quote = FALSE)
# That did a crappy job, lines too long or something

save(draftdata, file = "draftdata.Rdata")
save(file = "scraping.Rdata")
