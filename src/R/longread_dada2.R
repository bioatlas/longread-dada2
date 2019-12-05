#!/usr/bin/env Rscript

# longread_dada2.R
#
# R script that calls DADA2 andd denoises long read sequences such as PacBio.
#
# Author: jeanette.tangrot@nbis.se daniel.lundin@lnu.se

suppressPackageStartupMessages(library(optparse))
suppressPackageStartupMessages(library(readr))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyr))

SCRIPT_VERSION = "N.N"

# Get arguments
option_list = list(
  make_option(
    c("-v", "--verbose"), action="store_true", default=FALSE, 
    help="Print progress messages"
  ),
  make_option(
    c("-V", "--version"), action="store_true", default=FALSE, 
    help="Print program version and exit"
  )
)
opt = parse_args(
  OptionParser(
    usage = "%prog [options]",
    option_list = option_list
  ), 
  positional_arguments = TRUE
)

if ( opt$options$version ) {
  write(SCRIPT_VERSION, stdout())
  quit('no')
}

logmsg = function(msg, llevel='INFO') {
  if ( opt$options$verbose ) {
    write(
      sprintf("%s: %s: %s", llevel, format(Sys.time(), "%Y-%m-%d %H:%M:%S"), msg),
      stderr()
    )
  }
}
logmsg(sprintf("Reading %s", opt$inputfile))

logmsg("Done")
