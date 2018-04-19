###1.
a <- c(1,3)
i=1
while(i+2<=20)
{
  a[i+2] = 0.9*a[i+1]-0.1*a[i]+1
  i=i+1
}
###2.
min(which(a>4))
###3
v<-c(0)
A <- matrix( runif(100), 50, 5)
for(i in 1:length(A[,1]))
{
  v[i]<-sum(A[i,])
}

###4
tmp = rep(0, 10)
a <- 10:1
idx = 1
for ( j in a)
{
  if (j<5)
  {
    tmp[idx] <- a[j]
    print(idx)
    idx <- idx + 1
  }
}

###5. 
#관측치의 값이 0~10까지가 아닌
#1~10이라는 것은 자연수라는 해석이 더 합리적이라고 생각
x<-matrix(0,1000,5)
#sid를 할당 결과를 가진 행렬이라고 생각하면 매번 random number를 생산해 x[i,]에 결과를 입력해준다.
for(i in 1:length(x[,1]))
{
  sid<-round(runif(5,1,10),digits=0)
  x[i,]<-sid
}
x

###6.
#sid를 난수표처럼 활용하기 위하여 다시 정의해준다.
sid <- round(runif(1000,1,10),0)
sid
m.mat<-matrix(0,10,5)

for(i in 1:10)
{
  #sid가 i값을 가지는 위치를 location에 저장
  location = c((which(sid==i)))
  sumdata <- rep(0,5)
  for(j in location)
  {
    #sid가 i값을 가지는 위치 값들의 합산
    sumdata = sumdata + x[j,]
  }
  m.mat[i,] = sumdata / length(location) # 더한값을 a의 길이로 나누어 평균을 m.mat에 저장
}
m.mat

###6-2
idist <- matrix(0,1000,10)
for(i in 1:length(idist[,1]))
{
  dat = x[i,] #특정 관측치
  
  for(j in 1:10)
  {
    avr = m.mat[sid[j],] #데이터셋 각각의 평균값
    xy = 0
    crossx = 0
    crossy = 0
    for(k in 1:5)
    {
      xy = xy + dat[k]*avr[k]
      crossx = crossx + dat[k]^2
      crossy = crossy + avr[k]^2
    }
    # 관측치와 각 sid의 평균치와의 거리를 idist에 저장
    idist[i,j] <- xy/(sqrt(crossx*crossy))
  }
}
idist

###7. 
ivec <- vector()
for(i in 1:1000)
{#각 데이터가 어떤 그룹과 거리가 가장 짧은지 표시
  ivec[i] <- which.min(idist[i,])}
ivec




###8.
### 1)
set.seed(1)
a = list()

for (i in 1:1000)
{
  #출전인원이 1명인 게임이 있어 +2로 수정함
  x = rpois(1,4)+2
  x = min(x,10)
  a[[i]] = sample(1:10, x)
}
freq<-vector() #빈도를 세어줄 벡터 초기화
leng<-vector() #출전인원을 세어줄 벡터 초기화

for(i in 1:1000)
{leng[i]<-length(a[[i]])}

for(i in 1:10)
{freq[i] = length(which(leng==i))} #여기서 lengtt는 개수를 세는 역할
freq

### 2)
score <-rep(0,10)
for( i in 1:1000)
{
  # 2~4명 출전인 경우
  #1등에게 1점 부여
  if(leng[i] >= 2 & leng[i] <= 4 )
  {
    first <- a[[i]][1] #1등한 선수를 first에 저장
    score[first] <- score[first] + 1 #1등힌 선수에게 1점 부여
  }
  # 5~6명 출전인 경우
  # 1등 2점, 2등 1점
  else if(leng[i] >= 5 & leng[i] <= 6 )
  {
    first <- a[[i]][1]
    second <- a[[i]][2]
    score[first] <- score[first] + 2
    score[second] <- score[second] + 1
  }
  # 7~10명 출전인 경우
  #1등 3점, 2등 2점, 3등 1점
  else
  {
    first <- a[[i]][1]
    second <- a[[i]][2]
    third <- a[[i]][3]
    score[first] <- score[first] + 3
    score[second] <- score[second] + 2
    score[third] <- score[third] + 1
  }
}
score
which.max(score)




###9. 
###1)
set.seed(1)
m1 = 10
m2 = 5
num = 0
for(i in 1:4)
{
  g=rbinom(1,1,1/2)
  if(g==0)
  {
    m1=m1-1
    m2=m2+1
    print(m1)
    print(m2)
  }else{
    m1=m1+1
    m2=m2-1
    print(m1)
    print(m2)
  }
}

###2)
set.seed(1)
m1 = 10
m2 = 5
num=0

while(m1>0&m2>0)
{
  g=rbinom(1,1,1/2)
  if(g==0)
  {
    m1=m1-1
    m2=m2+1
    num=num+1
    print(m1)
    print(m2)
  }else{
    m1=m1+1
    m2=m2-1
    num=num+1
    print(m1)
    print(m2)
  }
}
num
###3)
m1 = 10
m2 = 5
num = 0
for (k in 1:200)
{
  set.seed(k)
  
  g=rbinom(1,1,1/2)
  if(g==0)
  {
    m1=m1-1
    m2=m2+1
    print(m1)
    print(m2)
    num=num+1
  }else{
    m1=m1+1
    m2=m2-1
    print(m1)
    print(m2)
  }
  #### 가상 실험 ####
}
num

###10.
##1) 10원
num = 0
for(i in 1:10000)
{
  m1 = 25
  m2 = 5
  while(m1>0&m2>0)
  {
    g=rbinom(1,1,1/2)
    if(g==0)
    {
      m1=m1-1
      m2=m2+1
    }else{
      m1=m1+1
      m2=m2-1
    }
  }
  if(m2==0)
  {
    num=num+1
  }
}
num

