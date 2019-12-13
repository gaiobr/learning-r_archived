library(tidyverse)
library(rvest)
library(XML)

url <- "https://www.tripadvisor.com/Attraction_Review-g303509-d2425803-Reviews-or5-Parque_Nacional_da_Serra_dos_Orgaos-Teresopolis_State_of_Rio_de_Janeiro.html#REVIEWS"

reviews <- read_html(url) %>%
  html_nodes(".location-review-review-list-parts-SingleReview__mainCol--1hApa")

tmp = html_nodes(reviews, css = '.location-review-review-list-parts-ExpandableReview__reviewText--gOmRC')

print(tmp[1])

doc <- htmlParse(tmp[1], asText = TRUE)
xmlValue(doc[["/html/body/q/span/text()"]])

# Original above
#library(XML)
#doc <- htmlParse('<p attribute="blabla">this is what I need</p>', asText = TRUE)
#xmlValue(doc[["/html/body/p/text()"]]  )

rating<-reviews%>%
  html_node(".location-review-review-list-parts-ExpandableReview__containerStyles--1G0AE")

rating <- reviews %>%
  html_attr("class") %>%
  str_extract(string = .,
              pattern = "bubble_[0-9]{2}")
