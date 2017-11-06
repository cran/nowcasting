## ----echo=FALSE----------------------------------------------------------
library(nowcasting)

## ------------------------------------------------------------------------
pib<-BRGDP[,8]
y<-month2qtr(diff(diff(pib,3),12))
x<-Bpanel(BRGDP[,-8],rep(4,dim(BRGDP)[2]),aggregate = T)
q<-1
r<-2
p<-1
now_2sq<-nowcast(y,x,q,r,p,method = '2sq')

## ------------------------------------------------------------------------
window(now_2sq$main,start=c(2017,1),frequency=4)

## ----fig.width=7,fig.height=4--------------------------------------------
nowcast.plot(now_2sq)

## ------------------------------------------------------------------------
summary(now_2sq$reg)

## ----fig.width=7,fig.height=4--------------------------------------------
dfactors<-now_2sq$factors$dynamic_factors
window(dfactors,start=c(2017,1),end=c(2017,12),frequency=12)
nowcast.plot(now_2sq,type='factors')

## ----fig.width=7,fig.height=4--------------------------------------------
x<-Bpanel(BRGDP[,-8],rep(4,dim(BRGDP)[2]),aggregate = F)
q<-1
r<-2
p<-1
now_2sm<-nowcast(y,x,q,r,p,method = '2sm')
nowcast.plot(now_2sm,type = 'month_y')

## ------------------------------------------------------------------------
x<-Bpanel(BRGDP[,-8],rep(4,dim(BRGDP)[2]),aggregate = F)
q<-1
r<-2
p<-1
now_em<-nowcast(y,x,q,r,p,'EM')

## ---- echo=FALSE, results='asis'-----------------------------------------
datas<-zoo::as.Date(x)
df<-data.frame(x)
row.names(df)<-datas
ind<-which(rownames(df)==as.Date('2017-10-01'))
df1<-df[(ind-6):ind,]
knitr::kable(df1,row.names = T)

## ---- echo=FALSE, results='asis'-----------------------------------------
df<-now_em$fore_x
row.names(df)<-as.character(datas)
ind<-which(rownames(df)==as.Date('2017-10-01'))
df1<-df[(ind-6):ind,]
knitr::kable(df1,row.names = T)

## ---- echo=FALSE, results='asis'-----------------------------------------
datas<-zoo::as.Date(BRGDP)
df<-data.frame(BRGDP)
row.names(df)<-datas
knitr::kable(tail(data.frame(df[,5:8]),7),row.names = T)

## ---- echo=FALSE, results='asis'-----------------------------------------
USGDP<-nowcasting::USGDP
datas<-zoo::as.Date(USGDP$Base)
df<-data.frame(USGDP$Base)
row.names(df)<-datas
knitr::kable(tail(data.frame(df[,1:5]),5),row.names = T)

## ---- echo=FALSE, results='asis'-----------------------------------------
df<-USGDP$Legenda
knitr::kable(tail(data.frame(df[,1:5]),5),row.names = T)

## ------------------------------------------------------------------------
br_gdp<-base_extraction(series_code = 22099)
window(br_gdp,start = c(2016,1),frequency = 12)

## ------------------------------------------------------------------------
head(RTDB())

## ------------------------------------------------------------------------
serie1<-RTDB(series_code = 1,vintage ='2017-10-30')
window(serie1,start = c(2017,1),frequency = 12)

## ------------------------------------------------------------------------
tail(RTDB(series_code = 1))

## ------------------------------------------------------------------------
head(RTDB(vintage ='2017-04-04'))

## ------------------------------------------------------------------------
prtdb<-PRTDB(mts = BRGDP,delay = rep(0,dim(BRGDP)[2]),vintage = '2017-03-23')
window(prtdb,start=c(2017,1),frequency=12)

## ------------------------------------------------------------------------
prtdb<-PRTDB(mts = BRGDP,delay = c(1,3,-50,6,60,15,120,0),vintage = '2016-12-04')
window(prtdb,start=c(2016,1),frequency=12)

## ------------------------------------------------------------------------
bpanel<-Bpanel(BRGDP,rep(4,dim(BRGDP)[2]))
window(bpanel,start=c(2017,1),end=c(2018,1),frequency=12)

## ------------------------------------------------------------------------
gdp_month<-BRGDP[,'serie22099']
window(gdp_month,c(2016,1),frequency=12)

## ------------------------------------------------------------------------
gdp_qtr<-month2qtr(gdp_month)
window(gdp_qtr,c(2016,1),frequency=4)

## ------------------------------------------------------------------------
gdp_month2<-qtr2month(gdp_qtr)
window(gdp_month2,c(2016,1),frequency=12)

