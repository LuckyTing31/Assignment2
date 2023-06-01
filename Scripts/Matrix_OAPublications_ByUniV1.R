# set working directory as located where this set of codes is currently saved
library(rstudioapi)

setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# import data from csv file and prepare data for analysis
aus.raw = read.csv('Data/au_data_all.csv',sep=",", row.names=1)
uk.raw = read.csv('Data/uk_data_all.csv',sep=",", row.names=1)
aus.goups = read.csv('Data/au_groupings.csv',sep=",", row.names=1)
uk.groups = read.csv('Data/uk_groupings.csv',sep=",", row.names=1)
data_aus = read.csv('Data/Fig5_AUS_TotAc_women_2020.csv',sep=",", row.names=1)
data_uk = read.csv('Data/Fig6_UK_TotAc_women_2020.csv',sep=",", row.names=1)

# create a matrix of ranks according to each indicator
aus.rank <- as.data.frame(sapply(aus.raw[,c(2:8)], rank, na.last="keep",ties.method="average")) #missing values kept #midrank for ties
rownames(aus.rank) <- rownames(aus.raw[,c(2:8)])
uk.rank <- as.data.frame(sapply(uk.raw[,c(2:8)], rank, na.last="keep",ties.method="average")) #missing values kept #midrank for ties
rownames(uk.rank) <- rownames(uk.raw[,c(2:8)])

library(ggplot2)
library(grid)
p1<-ggplot(aus.rank, aes(x=oa, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total OA publications (%)") +
  ylab("Women employed as academics (%)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=oa, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total OA publications (%)") +
  ylab("Women employed as academics (%)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

p1<-ggplot(aus.rank, aes(x=oa_gold, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Gold OA publications (%)") +
  ylab("Women employed as academics (%)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=oa_gold, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Gold OA publications (%)") +
  ylab("Women employed as academics (%)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

p1<-ggplot(aus.rank, aes(x=oa_green, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Green OA publications (%)") +
  ylab("Women employed as academics (%)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=oa_green, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Green OA publications (%)") +
  ylab("Women employed as academics (%)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

p1<-ggplot(aus.rank, aes(x=event_total, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Publications with Crossref events (%)") +
  ylab("Women employed as academics (%)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=event_total, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Publications with Crossref events (%)") +
  ylab("Women employed as academics (%)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

p1<-ggplot(aus.rank, aes(x=total_rev, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total revenue") +
  ylab("Women employed as academics (%)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=total_income, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total income") +
  ylab("Women employed as academics (%)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

p1<-ggplot(aus.rank, aes(x=total_rev, y=oa_gold)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total revenue") +
  ylab("Gold OA publications (%)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=total_income, y=oa_gold)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total income") +
  ylab("Gold OA publications (%)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

p1<-ggplot(aus.rank, aes(x=total_rev, y=oa_green)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total revenue") +
  ylab("Green OA publications (%)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=total_income, y=oa_green)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total income") +
  ylab("Green OA publications (%)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

p1<-ggplot(aus.rank, aes(x=total_rev, y=event_total)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total revenue") +
  ylab("Publications with Crossref events (%)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=total_income, y=event_total)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("Total income") +
  ylab("Publications with Crossref events (%)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

p1<-ggplot(aus.rank, aes(x=oa, y=oa_gold)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total OA % (rank)") +
  ylab("gold OA % (rank)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=oa, y=oa_gold)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total OA % (rank)") +
  ylab("gold OA % (rank)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

p1<-ggplot(aus.rank, aes(x=oa, y=oa_green)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total OA % (rank)") +
  ylab("green OA % (rank)") + 
  ggtitle("Australian universities")
p2<-ggplot(uk.rank, aes(x=oa, y=oa_green)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total OA % (rank)") +
  ylab("green OA % (rank)") + 
  ggtitle("UK universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

library(Hmisc)
rcorr(as.matrix(aus.raw[,2:8]),type="spearman")$r
rcorr(as.matrix(uk.raw[,2:8]),type="spearman")$r
#library(ppcor)
#pcor(as.matrix(aus.raw[,2:8]), method="spearman")$estimate
#pcor(as.matrix(uk.raw[,2:8]), method="spearman")$estimate
library(psych)
partial.r(as.matrix(aus.raw[,2:8]),use="pairwise",method="spearman")

#plot using uni group as colours
aus.groups = read.csv('au_groupings.csv',sep=",")
aus.rank$id = rownames(aus.rank)
aus.rank = merge(aus.rank,aus.groups,by="id")

p1<-ggplot(aus.rank[aus.rank$grouping!="IHEA",],aes(x=total_rev,y=women_acad,group=grouping))+
  geom_point(aes(color=grouping, shape=grouping),size=3)+
  scale_color_manual(values=c('orange','purple','aquamarine3','blue','black'))+
  scale_shape_manual(values=c(16, 7, 15, 8, 17))+
  xlab("Total revenue")+
  ylab("Women employed as academics (%)")+
  theme(legend.position = "top", legend.title=element_blank())+
  guides(colour=guide_legend(ncol=5,nrow=1,byrow=TRUE))

uk.groups = read.csv('uk_groupings.csv',sep=",")
uk.rank$id = rownames(uk.rank)
uk.rank = merge(uk.rank,uk.groups,by="id")

p2<-ggplot(uk.rank,aes(x=total_income,y=women_acad,group=grouping))+
  geom_point(aes(color=grouping, shape=grouping),size=3)+
  scale_color_manual(values=c('blue','red','aquamarine3','orange','purple','black'))+
  scale_shape_manual(values=c(18, 15, 8, 19, 7, 17))+
  xlab("Total income")+
  ylab("Women employed as academics (%)")+
  theme(legend.position = "top", legend.title=element_blank())+
  guides(colour=guide_legend(ncol=3,nrow=2,byrow=TRUE))

grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), size = "last"))

#split uk analysis by uni groups

uk.russell = uk.raw[rownames(uk.raw)%in%uk.groups[uk.groups$grouping=="Russell",]$id,]
uk.russell.rank = as.data.frame(sapply(uk.russell[,c(2:8)], rank, na.last="keep",ties.method="average")) #missing values kept #midrank for ties
rownames(uk.russell.rank) <- rownames(uk.russell)

uk.alliance = uk.raw[rownames(uk.raw)%in%uk.groups[uk.groups$grouping=="Alliance",]$id,]
uk.alliance.rank = as.data.frame(sapply(uk.alliance[,c(2:8)], rank, na.last="keep",ties.method="average")) #missing values kept #midrank for ties
rownames(uk.alliance.rank) <- rownames(uk.alliance)

uk.cathedrals = uk.raw[rownames(uk.raw)%in%uk.groups[uk.groups$grouping=="Cathedrals",]$id,]
uk.cathedrals.rank = as.data.frame(sapply(uk.cathedrals[,c(2:8)], rank, na.last="keep",ties.method="average")) #missing values kept #midrank for ties
rownames(uk.cathedrals.rank) <- rownames(uk.cathedrals)

uk.millionplus = uk.raw[rownames(uk.raw)%in%uk.groups[uk.groups$grouping=="Million+",]$id,]
uk.millionplus.rank = as.data.frame(sapply(uk.millionplus[,c(2:8)], rank, na.last="keep",ties.method="average")) #missing values kept #midrank for ties
rownames(uk.millionplus.rank) <- rownames(uk.millionplus)

uk.guildhe = uk.raw[rownames(uk.raw)%in%uk.groups[uk.groups$grouping=="GuildHE",]$id,]
uk.guildhe.rank = as.data.frame(sapply(uk.guildhe[,c(2:8)], rank, na.last="keep",ties.method="average")) #missing values kept #midrank for ties
rownames(uk.guildhe.rank) <- rownames(uk.guildhe)

uk.unaligned = uk.raw[rownames(uk.raw)%in%uk.groups[uk.groups$grouping=="Unaligned",]$id,]
uk.unaligned.rank = as.data.frame(sapply(uk.unaligned[,c(2:8)], rank, na.last="keep",ties.method="average")) #missing values kept #midrank for ties
rownames(uk.unaligned.rank) <- rownames(uk.unaligned)

p1<-ggplot(uk.russell.rank, aes(x=oa_gold, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("gold OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Russell universities")
p2<-ggplot(uk.alliance.rank, aes(x=oa_gold, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("gold OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Alliance universities")
p3<-ggplot(uk.cathedrals.rank, aes(x=oa_gold, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("gold OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Cathedrals universities")
p4<-ggplot(uk.guildhe.rank, aes(x=oa_gold, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("gold OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("GuildHE universities")
p5<-ggplot(uk.millionplus.rank, aes(x=oa_gold, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("gold OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Million+ universities")
p6<-ggplot(uk.unaligned.rank, aes(x=oa_gold, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("gold OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Unaligned universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), ggplotGrob(p3),
                ggplotGrob(p4), ggplotGrob(p5), ggplotGrob(p6),size = "last"))

p1<-ggplot(uk.russell.rank, aes(x=oa_green, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("green OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Russell universities")
p2<-ggplot(uk.alliance.rank, aes(x=oa_green, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("green OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Alliance universities")
p3<-ggplot(uk.cathedrals.rank, aes(x=oa_green, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("green OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Cathedrals universities")
p4<-ggplot(uk.guildhe.rank, aes(x=oa_green, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("green OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("GuildHE universities")
p5<-ggplot(uk.millionplus.rank, aes(x=oa_green, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("green OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Million+ universities")
p6<-ggplot(uk.unaligned.rank, aes(x=oa_green, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("green OA % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Unaligned universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), ggplotGrob(p3),
                ggplotGrob(p4), ggplotGrob(p5), ggplotGrob(p6),size = "last"))

p1<-ggplot(uk.russell.rank, aes(x=event_total, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("event total % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Russell universities")
p2<-ggplot(uk.alliance.rank, aes(x=event_total, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("event total % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Alliance universities")
p3<-ggplot(uk.cathedrals.rank, aes(x=event_total, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("event total % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Cathedrals universities")
p4<-ggplot(uk.guildhe.rank, aes(x=event_total, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("event total % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("GuildHE universities")
p5<-ggplot(uk.millionplus.rank, aes(x=event_total, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("event total % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Million+ universities")
p6<-ggplot(uk.unaligned.rank, aes(x=event_total, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("event total % (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Unaligned universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), ggplotGrob(p3),
                ggplotGrob(p4), ggplotGrob(p5), ggplotGrob(p6),size = "last"))


p1<-ggplot(uk.russell.rank, aes(x=total_income, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total income (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Russell universities")
p2<-ggplot(uk.alliance.rank, aes(x=total_income, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total income (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Alliance universities")
p3<-ggplot(uk.cathedrals.rank, aes(x=total_income, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total income (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Cathedrals universities")
p4<-ggplot(uk.guildhe.rank, aes(x=total_income, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total income (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("GuildHE universities")
p5<-ggplot(uk.millionplus.rank, aes(x=total_income, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total income (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Million+ universities")
p6<-ggplot(uk.unaligned.rank, aes(x=total_income, y=women_acad)) + 
  geom_point(na.rm=TRUE) +
  geom_smooth(method=lm, na.rm=TRUE) +
  xlab("total income (rank)") +
  ylab("women academic % (rank)") + 
  ggtitle("Unaligned universities")
grid.newpage()
grid.draw(cbind(ggplotGrob(p1), ggplotGrob(p2), ggplotGrob(p3),
                ggplotGrob(p4), ggplotGrob(p5), ggplotGrob(p6),size = "last"))