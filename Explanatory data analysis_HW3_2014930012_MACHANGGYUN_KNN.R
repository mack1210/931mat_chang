set.seed(1)
library(FNN)

x <- sort(rnorm(100))
y<- 3+x^2 + rnorm(100)
plot(x, y, pch = 20)
eval.n = 100
eval.point = seq(-3,3, length= eval.n)
plot(x, y, pch = 20)
idx_1 <- knnx.index(x, eval.point , k = 1)
idx_5 <- knnx.index(x, eval.point , k = 5)
idx_30 <- knnx.index(x, eval.point , k = 30)

yhat_1 = rep(0,eval.n)
yhat_5 = rep(0,eval.n)
yhat_30 = rep(0,eval.n)
for (i in 1:eval.n)
{
  yhat_1[i]<-mean(y[idx_1[i,]])
  yhat_5[i]<-mean(y[idx_5[i,]])
  yhat_30[i]<-mean(y[idx_30[i,]])
}

lines(eval.point , yhat_1, type= 'l', lty = 2, col = 'red')
lines(eval.point , yhat_5, type= 'l', lty = 2, col = 'purple')
lines(eval.point , yhat_30, type= 'l', lty = 2, col = 'blue')

legend("bottomright", c("k=1", "k=5", "k=30"), col=c("red", "purple", "blue"), lty=c(2,2,2))
