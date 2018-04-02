#install.packages(ggplot2)
#install.packages(data.table)
library(ggplot2)
library(data.table)

df <- fread('Vis-project/Economist_Assignment_Data.csv', drop=1)

pl <- ggplot(df,aes(x=CPI,y=HDI))
pl <- pl+ geom_point(aes(color=Region),shape=21, size=5)
pl <- pl + geom_smooth(aes(group=1),method = 'lm',formula = y ~ log(x), se = FALSE,color = 'red') 
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl <- pl + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)
pl <- pl + theme_set(theme_bw()) 
pl <- pl + scale_x_continuous(name = 'Corruption Perception Index, 2011,10= least corrupted',limits = c(1,10),breaks = 1:10)
pl <- pl + scale_y_continuous(name = 'Human Development Index, 2011,1 is the best',limits = c(0.25,1),breaks = c(0.25,0.5,0.75,1))
pl <- pl + ggtitle('Corruption and Human Development')
print(pl)

