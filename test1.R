attach(mtcars)
head(mtcars, n = 2)

plot(mpg ~ disp, data = mtcars)
plot(hp ~ disp, data = mtcars)
tail(mtcars, n=3)
mtcars

plot(hp ~ disp, data=mtcars)

x = rnorm(1000)
y = 2+2*x + rnorm(1000)
plot(x,y, main = "plot (x-y)")

x = seq(-2,2, length = 10)
y = x^2
plot(x,y, type = 'p', main = "y = x^2")

x = seq(-2,2, length = 10)
y = x^2
par(mfrow = c(2,2))
plot(x,y, type = 'p', main = "(a)")
plot(x,y, type = 'b', main = "(b)")
plot(x,y, type = 'l', main = "(c)")
plot(x,y, type = 's', main = "(d)")

plot(x,y, type = "b", lty = 3, main = "y = x^2")

plot(x,y, type = "b", lty = 3, pch = 2, main = "y = x^2")
plot(x = 1:25,y = rep(0, 25), pch = 1:25)
plot(x,y, type = "b", lty = 3, pch = 2, col = "blue", main = "y = x^2")
colors()[1:10]
plot(x,y, type = "b", xlab = "xx", ylab = "yy", main = "y = x^2")
xlim = c(-1,1), ylim = c(-1,1))
plot(mpg~disp, data = cars, xlab = "displacement", ylab = "mile/gallon",
     main = "scatter plot", pch = 20, col = 'darkblue')