system.time({
tab1 <<- matrix(nrow=1, ncol=3)
tab10 <<- matrix(nrow=1, ncol=3)
s <- 1						#initial starting point
j <- 2						#initial ending point
k <- 2						#must be at least 2 points
blk <- 0					#lock variable "k" to disable the 2nd while loop
x1 <- function(x)
{		#x <<- round(seq(s,j, length.out=k), 3) #do not round X values, otherwise it takes too long to find y's
		x <<- seq(s,j, length.out=k)} 
fy1 <- function(x)
{		x1(x)
		y1 <<- round(8*(x^2), 3)} 	#round(,3) gives rounding to 3 decimal places
fy2 <- function(x)
{		x1(x)
		y2 <<- round(64*x*(log(x)), 3)}
spr1 <- function(){
tab1 <<- cbind(c(x), c(fy1(x)), c(fy2(x)), deparse.level=0)
tab2 <<- tab1[tab1[,2] == tab1[,3]] #discovery of the season!!!!
if(length(tab2) != 0){
	v10 <<- tab2[c(1)]
	h10 <<- tab2[c(2)]
	tab3 <<- tab1[tab1[,1] <= v10, c(1)] # vector of values from column 1 up to value v10
	p10 <<- length(tab3)		# length of this vector gives the position in the table
	cat(" The graphs of the functions intersect at the point with coordinates: \n")
	cat(" X =",v10,"\n","Y =",h10,"\n","Position in table =",p10,"\n")
	blk <<- 1	}}
kp1 <- function(b){			#=========k increased by 1=============
			if (b != 1){	#lock in case two equal values appear in the functions
			k <<- k+1	}}
while(fy1(x[j]) < fy2(x[j])) 	{	#====1st while loop checks if the functions intersect========
					fy1(x)
					fy2(x)
					j <- j+1
					k <- j	}
split.screen(c(1, 2))
screen(1)
plot(x, fy1(x), col="red",las=1, xlab="X", ylab="F(x)", lwd=2, type="l")
lines(x, fy2(x), col="blue", lwd=2, lty="solid")
symbols(j-0.7, max(fy1(x))-300 ,rectangles = cbind(1.5,400), add = TRUE, inches = FALSE, lty="dashed", lwd=2)
arrows(j+0.2, max(fy1(x))-300, j+5, max(fy1(x))-300, length = 0.25, angle = 20, code = 2, col="black", lty="solid", lwd=3, xpd=NA)
text(15, 2000, family="sans", expression(8*x^2), srt=41)
text(11, 2000, family="sans", expression(64*x*log(x)), srt=41)
mtext("1 - Function plot:", at=10, line = 1.25)
mtext(expression(8*x^2), at=14.58, line = 1.235)
mtext("and", at=15.8, line = 1.235)
mtext(expression(64*x*log(x)), at=18.5, line = 1)
s <- j-1 			#change the range of x values i.e. from the last one (27-1=26) search in the interval x[26...27]
d4 <- length(x) 		#assign length of vector X to variable
while(d4 == k) {		#====2nd while loop checks where the functions intersect exactly======
		fy1(x)
		fy2(x)
		spr1()
		kp1(blk)
		d4 <<- d4+1	}
screen(2)
plot(x, fy1(x), col="red",las=1, xlab="X", ylab="F(x)", lwd=2, type="l", xlim=c(v10-0.0058,v10+0.0058), ylim=c(h10-2,h10+2))
lines(x, fy2(x), col="blue", lwd=2, type="l")
abline(h=h10,lwd=2, lty=2, col="green")
abline(v=v10,lwd=2, lty=2, col="green")
points(v10,h10, cex=1.6)
text(v10+0.0011, h10-0.15, family="sans", as.character(round(v10,5)))
text(v10+0.0011, h10-0.3, family="sans", as.character(h10))
text(v10+0.002, h10+1, family="sans", expression(8*x^2), srt=41)
text(v10+0.00325, h10+1, family="sans", expression(64*x*log(x)), srt=38.5)
mtext("2 - The intersection point of the graphs of functions:", adj=0.2, line=2)
mtext(expression(8*x^2), adj=0.2, line=0.5)
mtext("and", adj=0.275, line=0.5)
mtext(expression(64*x*log(x)), adj=0.4, line=0.35)
mtext("is the point:", adj=0.6, line=0.5)
close.screen(all = TRUE)    # exit split-screen mode
tab10 <<- cbind("[x]" = c(x), "[8x^2]" = c(fy1(x)), "[64xlog(x)]" = c(fy2(x)), deparse.level=0)
print(tab10)
cat(" The graphs of the functions intersect at the point with coordinates:\n","Position in table [",p10,",]\n")
print(tab1[p10,])
write.table(tab10, "c:/Download/R/sortowanie/tab10.txt", quote=FALSE)
})

