# 1) 데이터생성
# 2) K-NN적합(yhat)
# 3) 또 데이터 생성(y)
# 4) 시그마{(y-yhat)^2} 구하기
# 5) K 선택하기
# eval.point만 잘 잡으면 yhat을 중간에 따로 구해놓을 필요없이 쉽게 끝난다?
# 적절한 K를 찾는것이 목표

library(FNN)
set.seed(1)

eval.n = 100
x <- sort(rnorm(eval.n))
y <- 3+x^2 + rnorm(eval.n)
plot(x, y, pch = 20, main="Finding Most Proper Value of k in KNN")


eval.point = sort(rnorm(eval.n))
yhat = rep(0,eval.n)

p_k <-c() #적절한 K
delta_y <- c() #편차의 제곱을 저장할 벡터
TofindminSum <- c() #가장 작은 편차의 합을 찾기위한 벡터 생성

x_test <- sort(rnorm(eval.n))
y_test <- 3+x_test^2 + rnorm(eval.n) #다시 생성한 y데이터


for(i in 1:eval.n) #적절한 k를 찾기위해 1부터 100까지 반복한다
{
  idx <- knnx.index(x, eval.point , k = i)
  for (j in 1:eval.n)
  {
    yhat[j]<-mean(y[idx[j,]]) #yhat은 y data로 구하고
    delta_y[j] <- (y_test[j]-yhat[j])^2 # (y-yhat)^2(편차의 제곱)은 y_test로 구한 값을 저장
  }
  TofindminSum[i] <- sum(delta_y)
}
p_k <- which.min(TofindminSum)

#100까지 반복실행한 결과 적절한 k값을 구할 수 있었으나
# k값이 커져서 평균이 균일해지므로 우리가 구한 적절한 k로 다시 한번 yhat과 편차의 제곱을 구해준다.
idx <- knnx.index(x, eval.point , k = p_k)
for (j in 1:eval.n)
{
  yhat[j]<-mean(y[idx[j,]])
  delta_y[j] <- (y_test[j]-yhat[j])^2
}


points(x_test, y_test , col = "red", pch=1)
lines(eval.point, yhat, type= 'l', lty = 2, col = 'red')

legend('bottomright',c('yhat', 'Random data','Test data'), lty=c(2,NA,NA),pch=c(NA,20,1),col=c("red", "black", "red"))

plot(TofindminSum, type='b', col='blue', main = 'Conform the point of minimum value of k') #가장 값이 작은 지점의 index를 확인할 수 있다.

