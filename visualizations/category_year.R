## Category year analysis
library(broom)
library(tidyverse)
category_year <- read_csv("~/Downloads/category_year_positive_value_drop_idc_00_09.csv")

cy2 <- read_csv("~/Downloads/category_year_positive_value_drop_idc_10_16.csv")

tidy_cy <- category_year %>%
  bind_rows(cy2) %>%
  select(agency = agency_index, year = fiscal_year, amount = base_and_all_options_value)

tidy_cy %>%
  filter(amount > 0) %>%
  mutate(year = year) %>%
  nest(-agency) %>%
  mutate(models = map(data, ~ lm(amount ~ year, .))) %>%
  mutate(tidied = map(models, tidy)) %>%
  unnest(tidied) %>%
  filter(term == "year") %>%
  arrange(desc(estimate))
  

tidy_cy %>%
  filter(amount > 0) %>%
  filter(!is.na(amount)) %>%
  mutate(year = as.numeric(year)) %>%
  nest(-agency) %>%
  mutate(models = map(data, ~ lm(amount ~ year, .))) %>%
  mutate(tidied = map(models, tidy)) %>%
  unnest(tidied) %>%
  filter(term == "year") %>%
  arrange(estimate)

tidy_cy %>%
  filter(amount > 0) %>%
  filter(agency %in% c("Veterans Affairs", 
                             "Department of Defense", 
                             "Department of Health and Human Services",
                             "Department of Justice")) %>%
  ggplot(aes(year, amount, col = agency)) +
  geom_line()

tidy_cy %>%
  group_by(year) %>%
  mutate(year_spend = sum(amount),
         proportion = amount/year_spend)



tidy_cy %>%
  filter(agency %in% c("Department of Defense", 
                       "General Services Administration", 
                       "Department of Veterans Affairs",
                       "AGRICULTURE, DEPARTMENT OF",
                       "Department of Justice",
                       "Department of the Interior",
                       "Department of State",
                       "Department of Labor"
                       )) %>%
  group_by(year) %>%
  mutate(year_spend = sum(amount),
         proportion = amount/year_spend) %>%
  ggplot(aes(year, proportion, fill = agency)) + geom_bar(stat = "identity", position = "fill") +
  ylab("Proportion of contracts given") + xlab("Year")







