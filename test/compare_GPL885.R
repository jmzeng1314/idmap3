rm(list = ls())
options(stringsAsFactors = F)
library(idmap2)
library(idmap3)
# Agilent-011521 Human 1A Microarray G4110A  (Feature Number version)   GPL885
ids2=get_soft_IDs('GPL885')
ids3=get_pipe_IDs('GPL885')
tmp=merge(ids2,ids3,by.x='ID',by.y='probe_id')
table(tmp$symbol.x==tmp$symbol.y)

length(unique(tmp[,1]))
length(unique(tmp[tmp$symbol.x==tmp$symbol.y,1]))
length(unique(tmp[tmp$symbol.x!=tmp$symbol.y,1]))

data("gpl_list")
gpl_list[,1:2]
