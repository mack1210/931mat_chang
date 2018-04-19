setwd("C:\\Users\\CHANGGYUNMA\\Desktop\\My Documents\\서울시립대학교\\2018년 1학기\\1. 전공\\통계학 개론 및 실습 (한상문 교수님)\\6주차")
getwd()


data <- read.csv('lm_data.csv', header = T, stringsAsFactors = F)

co_var <- c() #covariance
co_rel <-c() #correlation

for(i in 1:4)
{
  co_var[i] <- cov(data[2*i-1],data[2*i])
  co_rel[i] <- cor(data[2*i-1],data[2*i])
}

co_var
co_rel

par(mfrow = c(2,2))
plot(data$x1,data$y1,main = "Scatter plot for (x1,y1)",xlab = 'x1',ylab = 'y1')
plot(data$x2,data$y2,main = "Scatter plot for (x2,y2)",xlab = 'x2',ylab = 'y2')
plot(data$x3,data$y3,main = "Scatter plot for (x3,y3)",xlab = 'x3',ylab = 'y3')
plot(data$x4,data$y4,main = "Scatter plot for (x4,y4)",xlab = 'x4',ylab = 'y4')
