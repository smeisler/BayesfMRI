#' Make HRFs
#' 
#' Create HRF design matrix columns from onsets and durations
#'
#' @param onsets A matrix of onsets (first column) and durations (second column) 
#'  for each task in SECONDS (set duration to zero for event related design), 
#'  organized as a list where each element of the list corresponds to one task. 
#'  Names of list indicate task names.
#' @param TR Temporal resolution of fMRI data, in SECONDS.
#' @param duration Length of fMRI timeseries, in SCANS.
#' @param downsample Downsample factor for convolving stimulus boxcar or stick 
#'  function with canonical HRF
#'
#' @return Design matrix containing one HRF column for each task
#' 
#' @importFrom stats convolve
#' 
#' @export
make_HRFs <- function(onsets, TR, duration, downsample=100){

  if (!requireNamespace("neuRosim", quietly = TRUE)) {
    stop("Package \"neuRosim\" needed to run `make_HRFs`. Please install it.", call. = FALSE)
  }

  K <- length(onsets) #number of tasks
  if(is.null(names(onsets))) task_names <- paste0('task', 1:K) else task_names <- names(onsets)

  nsec <- duration*TR; # Total time of experiment in seconds
  stimulus <- rep(0, nsec*downsample) # For stick function to be used in convolution
  HRF <- neuRosim::canonicalHRF(seq(0, 30, by=1/downsample), verbose=FALSE)[-1] #canonical HRF to be used in convolution
  inds <- seq(TR*downsample, nsec*downsample, by = TR*downsample) # Extract EVs in a function of TR

  design <- matrix(NA, nrow=duration, ncol=K)
  colnames(design) <- task_names
  for(k in 1:K){
    onsets_k <- onsets[[k]][,1] #onset times in scans
    durations_k <- onsets[[k]][,2] #durations in scans

    # Define stimulus function
    stimulus_k <- stimulus
    for(ii in 1:length(onsets_k)){
      start_ii <- round(onsets_k[ii]*downsample)
      end_ii <- round(onsets_k[ii]*downsample + durations_k[ii]*downsample)
      stimulus_k[start_ii:end_ii] <- 1
    }

    # Convolve boxcar with canonical HRF & add to design matrix
    HRF_k <- convolve(stimulus_k, rev(HRF), type='open')
    design[,k] <- HRF_k[inds]
  }

  return(design)
}
