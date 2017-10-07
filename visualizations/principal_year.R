## principal

principal_year1 <- read_csv("~/Downloads/principal_year_positive_drop_idc_00_09.csv")
principal_year2 <- read_csv("~/Downloads/principal_year_positive_drop_idc_10_16.csv")
code_map<- read_csv("~/Documents/naics_code.csv") %>%
  select(num_code, naics_code)
sector_map <- read_csv("~/Downloads/sector map - Sheet1 (1).csv") %>% 
  select(sect_code = Code, sect_name = `NAICS Sectors`)

tidy_py <- principal_year1 %>%
  bind_rows(principal_year2) %>%
  select(naics_code, year = fiscal_year, amount = base_and_all_options_value) %>%
  left_join(code_map) %>%
  mutate(sect_code = as.numeric(substr(num_code,1,2))) %>%
  left_join(sector_map) %>%
  filter(!is.na(sect_name))

tidy_py %>%
  ggplot(aes(year, amount, fill = sect_name)) + geom_bar(stat = "identity", position = "fill")

tidy_py %>%
  nest(-naics_code) %>%
  mutate(models = map(data, ~ lm(amount ~ year, .))) %>%
  mutate(tidied = map(models, tidy)) %>%
  unnest(tidied) %>%
  filter(term == "year") %>%
  arrange(desc(estimate))
  
tidy_py %>%
  nest(-naics_code) %>%
  mutate(models = map(data, ~ lm(amount ~ year, .))) %>%
  mutate(tidied = map(models, tidy)) %>%
  unnest(tidied) %>%
  filter(term == "year") %>%
  arrange(desc(estimate))

tidy_py %>%
  filter(amount > 0) %>%
  filter(naics_code %in% c("TRAVEL AGENCIES", 
                       "SEAFOOD PRODUCT PREPARATION AND PACKAGING", 
                       "GRAIN AND FIELD BEAN MERCHANT WHOLESALERS",
                       "LESSORS OF NONRESIDENTIAL BUILDINGS (EXCEPT MINIWAREHOUSES)",
                       "ENGINEERING SERVICES",
                       "RESEARCH AND DEVELOPMENT IN THE PHYSICAL, ENGINEERING, AND LIFE SCIENCES (EXCEPT BIOTECHNOLOGY)")) %>%
  ggplot(aes(year, amount, col = naics_code )) +
  geom_line()

tidy_py %>%
  filter(amount > 10000000) %>%
  #filter(naics_code %in% c("TRAVEL AGENCIES", 
   #                        "SEAFOOD PRODUCT PREPARATION AND PACKAGING", 
    #                       "GRAIN AND FIELD BEAN MERCHANT WHOLESALERS",
     #                      "LESSORS OF NONRESIDENTIAL BUILDINGS (EXCEPT MINIWAREHOUSES)",
      #                     "ENGINEERING SERVICES",
       #                    "RESEARCH AND DEVELOPMENT IN THE PHYSICAL, ENGINEERING, AND LIFE SCIENCES (EXCEPT BIOTECHNOLOGY)")) %>%
  ggplot(aes(year, amount, fill = naics_code )) + geom_bar(stat = "identity", position = "fill")
