library(MASS)

# データの読み込み, 構造を確認
my_data <- read.csv("./test.csv")
names(my_data) <- c("income", "years")
str(my_data)

# 線形モデル作成
lm.fit = lm(income~years, data=my_data)
summary(lm.fit)