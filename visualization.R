#b
library(ggplot2)

dfB = 'https://github.com/josoga2/proj_mike/blob/master/Project_Mike/probes.csv?raw=true'
probes = read.csv(df, sep = ';')
colnames(probes) <- c('Num', 'hyb','pos','gene','chr','pval','m1','m2','delta','site','fdr')
p1 <- ggplot(data = probes, aes(x=delta, y= -log10(pval) ))+geom_point(colour='blue', alpha=0.5)+theme(axis.text = element_text(face='bold'), , panel.border = element_blank(),
                                                                                                       panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
                                                                                                       # Change axis line
                                                                                                       axis.line = element_line(colour = "black"),panel.background = element_blank() )+ labs(x='DNA Methylation Change', y='-Log10(p-Value)')
p1          

#c
dfC = 'https://github.com/josoga2/proj_mike/blob/master/mydataPlot.csv?raw=true'
violin <- read.csv(dfC,sep = ',')
colnames(violin) <- c('X','Num', 'hyb','pos','gene','chr','pval','m1','m2','delta','site','fdr', 
                      'status', 'x_merge','binding')
p2 <- ggplot(data= violin, aes(x=binding, y=delta,color = binding, fill= binding))+geom_violin()+scale_color_manual(values=c("blue", "orange"))+
  scale_fill_manual(values=c("blue", "orange"))+ theme(axis.text = element_text(face='bold'), , panel.border = element_blank(),
                                                       panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
                                                       # Change axis line
                                                       axis.line = element_line(colour = "black"),panel.background = element_blank() )+ labs(x='TDF Prediction', y='DNA Methylation Change')

p2
#d
setwd("C:/Users/Wale Joseph/Downloads")
df <- read.table("plotData1.txt", sep="\t", header = T)
head(df)
#library(reshape)

#-------------TDF----------------
plot1 = ggplot(df, aes(x=DBD, y=RANDOM, group=DBD)) +
  geom_crossbar(aes(ymin=RANDOM-UNK2, ymax=RANDOM+UNK2, width=1, color='Non-Target Regions'))+
  geom_errorbar(aes(ymin=RANDOM-UNK2-UNK2, ymax=RANDOM+UNK2+UNK2, width=0.5))+
  geom_point(data = df, aes(x=DBD,  y=TTS, group=DBD, color='Target Regions'))+
  theme_light(base_family = 'sans')+
  theme(axis.text.x = element_text(face='bold',angle = 45,hjust = 1), axis.text.y = element_text(face='bold') , panel.border = element_blank(),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
        # Change axis line
        axis.line = element_line(colour = "black"),panel.background = element_blank() )+
  labs(x = "ecCEBPA DNA Binding Domains", y= "Number of TTS on Target Regions")+
  scale_color_manual(breaks = c("Non-Target Regions", "Target Regions"),
                     values=c("grey", "blue"))+theme(legend.position = c(0.2,0.8),legend.title = element_blank())+
                                                     guides(size=F)

plot1

p3 <- ggplot(mtcars, aes(x=mpg, y=hp))+ geom_blank()



library("gridExtra")

grid.arrange(p1, p2, p3, plot1, nrow=2, ncol=2)


yesData <- 'https://raw.githubusercontent.com/josoga2/proj_mike/master/gene_table.csv'
dots = read.csv(yesData, sep='\t')
level_order = c('chr1','chr3','chr7','chr8',
                 'chr10', 'chr11','chr12','chr14',
                 'chr16','chr17','chr19','chr21','chr22','chrX')
p5 <- ggplot(dots, aes(x= factor(chr,level=level_order), y=X.pVal, color=iMARGI))+ geom_point(size=2)+
  theme(axis.text.x = element_text(face='bold', angle = 45,hjust = 1), panel.border = element_blank(),
                                   panel.grid.major = element_blank(),panel.grid.minor = element_blank(),
                                   # Change axis line
                                   axis.line = element_line(colour = "black"),panel.background = element_blank() )+
  labs(y='-Log(Relative Triplex Potential)',x= 'Chromosome')+
  scale_color_manual(values = c('grey','blue'))
p5

theme_classic()


library(imager)
setwd('C:/Users/Wale Joseph/Desktop/RUSSIA/MIPT')
file <- system.file('/Asset.png', package = 'imager')
im <- load.image(file)

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")


BiocManager::install("EBImage")



myImage <- readImage('Asset.png.png')
p3 <- display(myImage)#, method = 'raster')

gp3 <- ggplot(violin, aes(x=chr,y=m1)) + geom_point()

grid.arrange(p1, p2, p2, plot1, nrow=2, ncol=2)



ggplot(df, aes(x=DBD, y=RANDOM, group=DBD)) +
  geom_crossbar(aes(ymin=RANDOM-UNK2, ymax=RANDOM+UNK2, width=1, color='Non-Target Regions'))+
  geom_errorbar(aes(ymin=RANDOM-UNK2-UNK2, ymax=RANDOM+UNK2+UNK2, width=0.5))+
  geom_point(data = df, aes(x=DBD,  y=TTS, group=DBD, color='Target Regions'))+
  theme_light(base_family = 'sans', base_size = 9 )+
  theme(axis.text.x = element_text(angle = 45,hjust = 1))+
  labs(x = "ecCEBPA DNA Binding Domains", y= "Number of TTS on Target Regions")+
  scale_color_manual(breaks = c("Non-Target Regions", "Target Regions"),
                     values=c("grey", "blue"))+theme(legend.position = c(0.2,0.8),legend.title = element_blank(),
                                                     legend.background = element_rect(fill="lightblue", 
                                                                                      size=0.5, linetype="solid"))+guides(size=F)

p4 <- plot1+theme_classic()
