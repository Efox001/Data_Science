install.packages("datarium")
install.packages("qqplotr")
install.packages("ggplot2")
install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")

library(datarium)
library(qqplotr)
library(ggplot2)
library(readr)
library(dplyr)

INSI <- read.csv('Income_Inequality_with_Social_Indicators.csv')
INSI

str(INSI)

INSI$LFI <- as.numeric(INSI$LFI)
INSI$LFA <- as.numeric(INSI$LFA)
INSI$Gini.index <- as.numeric(INSI$Gini.index)

str(INSI)

# nominal/categorical and ordinal measurement scale variables
count(INSI, Country.Name, SLRI)

# data visualization
install.packages("lessR")
library(lessR)

BarChart(SLRI, data=INSI, by1=Country.Name)

#continuous variables: interval or ratio measurement scales
Plot(Gini.index, data=INSI)
Plot(Gini.index, data=INSI, by1=Country.Name)

install.packages("psych")
library(psych)

describe(INSI)

Continuous_INSI <- INSI %>% select(GDP.growth..annual..., EPR, CCPR, LFI, LFA, Gini.index)
Continuous_INSI

head(Continuous_INSI)

Corr_INSI <- round(cor(Continuous_INSI, use = "pairwise.complete.obs"), digits = 2)
Corr_INSI

install.packages("corrplot")
library(corrplot)

corrplot(Corr_INSI, addCoef.col = "black")

ggplot(mapping = aes(sample=INSI$Gini.index)) +
  stat_qq_point(size = 2,color = "blue") +
  stat_qq_line(color="orange") +
  xlab("Theoretical") + ylab("Sample")

INSI

head(INSI)

New_INSI <- na.omit(INSI)

head(New_INSI)

summary(New_INSI)

Sample_data <-New_INSI$Gini.index[New_INSI$Country.Name=="Argentina"]
Sample_data

Sample_data <- as.data.frame(Sample_data)

Sample_data

mean(Sample_data)

hist(New_INSI$Gini.index)

t.test(New_INSI$Gini.index, mu=41.7, alternative="less")

str(New_INSI)

INSI_reduced <- New_INSI[ ,c(3, 4, 5, 7, 8, 9)]

INSI_reduced

str(INSI_reduced)

Corr_INSI_reduced <- round(cor(INSI_reduced, use = "pairwise.complete.obs"), digits = 2)

Corr_INSI_reduced

corrplot(Corr_INSI_reduced, addCoef.col = "black")

Corr_INSI_reduced <- as.data.frame(Corr_INSI_reduced)

model_1 <-lm(Gini.index ~ CCPR, Corr_INSI_reduced)

summary.lm(model_1)

plot(Gini.index ~ CCPR, Corr_INSI_reduced,
     col = "green",
     main = "Regression: Gini index & Control of corruption : Percentile Rank (CCPR)",
     xlab = "CCPR",
     ylab = "Gini.index")

abline(model_1, col="black")

plot(model_1, 1)

plot(model_1, 2)

plot(model_1, 3)
