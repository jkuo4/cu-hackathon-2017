# quantity of contracts awarded
library(tidyverse)

monthly <- read_csv("~/Downloads/monthly.csv")

monthly %>%
  ggplot(aes(effective_date, base_and_all_options_value)) +
  geom_line() +
  geom_smooth()


monthly %>%
  ggplot(aes(effective_date, count)) +
  geom_line() +
  scale_size_manual(values = c(0.1, 1)) +
  geom_rect(aes(xmin=as.Date("2000-09-01"),
                xmax=as.Date("2000-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2001-09-01"),
                xmax=as.Date("2001-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2002-09-01"),
                xmax=as.Date("2002-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2003-09-01"),
                xmax=as.Date("2003-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2004-09-01"),
                xmax=as.Date("2004-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2005-09-01"),
                xmax=as.Date("2005-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2006-09-01"),
                xmax=as.Date("2006-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2007-09-01"),
                xmax=as.Date("2007-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2008-09-01"),
                xmax=as.Date("2008-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2009-09-01"),
                xmax=as.Date("2009-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2010-09-01"),
                xmax=as.Date("2010-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2011-09-01"),
                xmax=as.Date("2011-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2012-09-01"),
                xmax=as.Date("2012-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2013-09-01"),
                xmax=as.Date("2013-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2014-09-01"),
                xmax=as.Date("2014-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2015-09-01"),
                xmax=as.Date("2015-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  geom_rect(aes(xmin=as.Date("2016-09-01"),
                xmax=as.Date("2016-09-30"),ymin=-Inf,ymax=Inf),alpha=0.1,fill="cornflowerblue") +
  ggtitle("Quantity of contracts awarded per year", "Month of September highlighted in blue") +
  xlab("Time") + ylab("Quantity")
ggsave("quant_contracts.png")

