### 1. 다음 데이터를 벡터 x에 다음 숫자열이 입력되어 있다.
###   17 16 20 24 22 15 21 18
x<-c(17,16,20,24,22,15,21,18)
x
### 1) 벡터 x의 값증 20 이상인 것만 출력하라.
x[x>20]
### 2) 벡터 x의 값중 20 이상인 숫자를 100으로 바꾸어 y로 저장하여라.
x[x>20]=100
y=x



### 2. 아래는 입력하고자 하는 행렬값이다.
### 1) 다음 행렬을 x로 저장하여라.
x<-matrix(0,5,5) #비어있는 행렬 initialize한다.
#입력하고자 하는 행렬의 규칙을 찾아 입력해준다.
for(i in 1:5)
{
  for(j in 1:5)
  {
    if(i==j)
    {
      x[i,j]=i+2 
    }else{
      x[i,j]=-1
    }
  }
}
#데이터프레임에 입력
x=data.frame(x)
x
### 2) 5열을 제거한 부분행렬을 y 로 저장하여라.
#5열을 제거한 매트릭스 y를 생성
y<-matrix(0,5,4)
y=x[,-length(x)]
y
### 3) y 행렬의 행과 열의 수를 yinfo 벡터로 저장하여라.
yinfo=c(NO.row=nrow(y), No.col=ncol(y))
yinfo
### 4) y 행렬에서 –1 에 해당하는 숫자를 0으로 바꾼 후 y1 행렬로 저장하여라.
y1=matrix(0,length(y[,1]), length(y[1,])) #y와 같은 nrow와 ncol을 갖는 y1 매트릭스 생성
for(i in 1:length(y[,1])) #행의 수만큼 반복
{
  for(j in 1:length(y[1,])) #열의 수만큼 반복
  {
    if(y[i,j]==-1)
    {
      y1[i,j]=0
    }else{
      y1[i,j]=y[i,j]
    }
  }
}
y1



###3. rowdata.txt 파일이 c:\tmp 폴더에 저장되어 있다. 파일 데이터의 1-5줄은 다음과 같다.
### 파일 데이터는 총 101줄이며, 첫 행은 데이터의 이름이다. 데이터에는 결측치가 포함되어 있고
### 결측치는 r 작업공간으로 데이터를 불렀을 때 NA로 표시된다.
### 이 때 변수 v2 와 v3가 결측치가 아닌 데이터만 모아서 데이터 프레임으로 저장하고자 한다. 
### 1) 다음 파일을 데이터 프레임 rdata 로 저장하는 코드를 작성하여라.
x<-read.table("rowdata.txt", header=T,sep="\t")
save(x,rdata)
### 2) NA를 확인할 수 있는 함수를 적어라.
is.na(x)
### 3) 변수 v2 와 v3가 동시에 NA가 아닌 행의 위치를 표시하는 코드를 적어라.
count=0
vacant=vector()
for(i in 1:101)
{
  if(x[i]$v2==NULL&x[i]$v3==NULL)
  {vacant[i]=i
  count=count+1}
}
count
### 4) 변수 v2 와 v3가 결측치가 아닌 데이터만 모아서 데이터 프레임 rdata1으로 저장하여라.
y=0
for(i in vacant)
{
  y=x[-vacant[i]]
}
save(y, rdata1)





### 4. 
### 1)
a=c(TRUE, FALSE)
b=diag(1,2)
c=seq(0,1, length=100)
temp<-list(a,b,c,1,2,3,4)
temp
### 2)
temp[[2]]<-NULL
### 4)
length(temp)

###5. 다음은 벡터의 연산이다. 벡터연산의 결과를 적고 설명하여라.
###1)
a1 <- -1:3
a2 <- 1:2
a1 + a2
###2)
a1 <- -(1:2)
a2 <- 1:2
a1 + a2
###3)
a1 <- matrix(0,2,2)
a2 <- c(3,4)
a1 + a2
###4)
a1 <- matrix(1:4,2,2)
a1
a1[a1>2] = 0
###5)
a1 <- 1:5
a1[-1] - a1[-length(a1)]