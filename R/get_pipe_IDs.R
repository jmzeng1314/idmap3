##' get the gene symbols of probes for each GPL
##'
##' get_pipe_IDs need the name of GPL, such as GPL21827, and it will return a data.frame
##'
##' @param gpl the name of GPL, such as GPL21827
##' @return a data.frame which contains the gene symbols of probes
##' @examples
##' get_pipe_IDs('GPL21827')
##' @export

get_pipe_IDs <- function(gpl){
  # gpl='GPL21827'
  gpl=toupper(gpl)
  if(!gpl %in% unique(gpl_list$gpl)){
    stop('your gpl is not in our annotation list.')
  }
  gpl=paste0(gpl,'_pipe')
  ids=try( get(gpl) )
  if(isTRUE(class(ids)=="try-error")) {
    stop('there is no soft annotation for this gpl')
    }

  return(ids)
}
