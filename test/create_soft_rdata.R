options(stringsAsFactors = F)
list.files('../last/')
p2s_list_pipe <- lapply(list.files('../last/'), function(x){
  a=read.table(file.path('../last/',x))
  colnames(a)=c('probe_id','symbol')
  a$gpl=paste0(strsplit(x,'_')[[1]][1],'_pipe')
  return(a)
})
lapply(p2s_list_pipe, head)
ns=lapply(p2s_list_pipe, function(x){
  # x=tmp[[1]]
  ids=x[,-3]
  assign(x[1,3],ids, envir = .GlobalEnv)
 return(as.name(x[1,3]))
})
ns
library(usethis)
do.call("use_data",ns )
# https://stackoverflow.com/questions/1236620/global-variables-in-r
# https://stackoverflow.com/questions/49673667/how-to-use-devtoolsuse-data-on-a-list-of-data-frames


rm(list=ls())
options(stringsAsFactors = F)
gpl_list=read.csv('gpl_list.csv')
usethis::use_data(gpl_list)

