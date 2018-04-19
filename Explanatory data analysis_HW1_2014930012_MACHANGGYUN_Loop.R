#####HW1#####
#1. for 문
x=0
for(i in 1:9)
{
  for(j in 1:9)
  {
    x=i*j
    print(x)
  }
}

#2. break문
x=0
for(i in 1:9)
{
  
  for(j in 1:9)
  {
    ##2단일때 break
    if(i==2) 
    {
      break
    }
    x=i*j
    print(x)
  }
}

#3. stop문
x=0
for(i in 1:9)
{
  
  for(j in 1:9)
  {
    ##2단일때 stop
    if(i==2) 
    {
      stop("Can not continue")
    }
    x=i*j
    print(x)
  }
}