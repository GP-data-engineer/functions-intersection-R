system.time({
tab1 <<- matrix(nrow=1, ncol=3)
s <- 1
j <- 2
k <- 2
blk <- 0		#blokada zmiennej "k" do wy³¹czenia 2-go while
x1 <- function(x)
{		#x <<- round(seq(s,j, length.out=k), 3) #wartoœci X nie zaokr¹laæ bo d³ugo szuka y-ów
		x <<- seq(s,j, length.out=k)} 
fy1 <- function(x)
{		x1(x)
		y1 <<- round(8*(x^2), 3)} 	#round(,3) daje zaokr¹glenie do 3 miejsc po ','
fy2 <- function(x)
{		x1(x)
		y2 <<- round(64*x*(log(x)), 3)}
spr1 <- function(x)			#szukamy tylko 2-ch równych wartoœci z przedzia³u x[26,27]
{d1 <<- length(x)				#d³ugoœæ wektora x przypisana do zmiennej
for(i in 1:d1)	{			#d³ugoœæ iteracji przypisana do d³ugoœci wektora x
	if(fy1(x[i]) == fy2(x[i]))	{
	v10 <<- x[i]
	h10 <<- fy1(x[i])
	p10 <<- i
	cat(" wykresy funkcji przecinaj¹ siê w punkcie o wspó³rzêdnych: \n")
	cat(" Pozycja =",p10,"\n","X =",v10,"\n","Y =",h10,"\n")
	blk <<- 1				#blokada dla funkcji kp1 przed zwiêkszeniem k+1
	break	}
}}
kp1 <- function(b){			#=========k podniesione o 1=============
			if (b != 1){	#blokada gdyby znala³y siê dwie równe wartoœci w funkcjach
			k <<- k+1
			}}
while(fy1(x[j]) < fy2(x[j])) 	{	#====1 pêtla while okreœla czy funkcje siê przecinaj¹========
					fy1(x)
					fy2(x)
					j <- j+1
					k <- j
					}
split.screen(c(1, 2))
screen(1)
plot(x, fy1(x), col="red",las=1, xlab="X", ylab="F(x)", lwd=2, type="l")
lines(x, fy2(x), col="blue", lwd=2, lty="solid")
symbols(j-0.7, max(fy1(x))-300 ,rectangles = cbind(1.5,400), add = TRUE, inches = FALSE, lty="dashed", lwd=2)
arrows(j+0.2, max(fy1(x))-300, j+5, max(fy1(x))-300, length = 0.25, angle = 20, code = 2, col="black", lty="solid", lwd=3, xpd=NA)
text(15, 2000, family="sans", expression(8*x^2), srt=41)
text(11, 2000, family="sans", expression(64*x*log(x)), srt=41)
mtext("1 - Wykres funkcji:", at=10, line = 1.25)
mtext(expression(8*x^2), at=14.58, line = 1.235)
mtext("i", at=15.8, line = 1.235)
mtext(expression(64*x*log(x)), at=18.5, line = 1)
s <- j-1 			#zmiana zakresu wartoœci x czyli od ostatniej (27-1=26) szukamy w przedziale x[26...27]
d4 <- length(x) 		#przypisanie do zmiennej d³ugoœci wektora X
while(d4 == k) {		#====2 pêtla while sprawdza gdzie funkcje dok³adnie siê przecinaj¹======
		fy1(x)
		fy2(x)
		spr1(x)
		kp1(blk)
		d4 <<- d4+1
		}
screen(2)
plot(x, fy1(x), col="red",las=1, xlab="X", ylab="F(x)", lwd=2, type="l", xlim=c(v10-0.0058,v10+0.0058), ylim=c(h10-2,h10+2))
lines(x, fy2(x), col="blue", lwd=2, type="l")
abline(h=h10,lwd=2, lty=2, col="green")
abline(v=v10,lwd=2, lty=2, col="green")
points(v10,h10, cex=1.6)
text(v10+0.002, h10-0.15, family="sans", "(26.09349, 5446.961)")
text(v10+0.002, h10+1, family="sans", expression(8*x^2), srt=41)
text(v10+0.00325, h10+1, family="sans", expression(64*x*log(x)), srt=38.5)
mtext("2 - Wykres z punktem przeciêcia siê funkcji:", adj=0.2, line = 1.235)
mtext(expression(8*x^2), adj=0.55, line = 1.235)
mtext("i", adj=0.6, line = 1.235)
mtext(expression(64*x*log(x)), adj=0.7, line = 1)
close.screen(all = TRUE)    # exit split-screen mode
tab1 <<- cbind("[x]" = c(x), "[y=8*(x^2)]" = c(fy1(x)), "[y=64*x*log(x)]" = c(fy2(x)), deparse.level=0)
print(tab1)
cat(" Wykresy funkcji przecinaj¹ siê w punkcie o wspó³rzêdnych:\n","Pozycja w tabeli[",p10,",]\n")
print(tab1[p10,])
write.table(tab1, "c:/Download/R/sortowanie/tab1.txt", quote=FALSE)
})
