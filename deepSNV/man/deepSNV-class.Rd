\name{deepSNV-class}
\alias{deepSNV-class}
\title{deepSNV class.}
\description{
  This class stores the contents of the deepSNV test. It is
  typically initialized with \code{\link{deepSNV}}. This
  class has the following slots: \describe{
  \item{p.val}{The P-values of the test.} \item{test}{A
  matrix with the nucleotide counts in the test experiment.
  The column names of the nucleotide counts are A, T, C, G,
  - for the positivie strand and a, t, c, g, _ for the
  reverse.} \item{control}{A matrix with the nucleotide
  counts in the control experiment. The column names must
  be the same as for the test.} \item{coordinates}{A
  \code{\link{data.frame}} with the genomic coordinates chr
  and pos, and other columns, if desired.}
  \item{dirichlet.prior}{A matrix with the
  nucleotide-specific Dirichlet prior}
  \item{pseudo.count}{The pseudo count if used)}
  \item{alternative}{A string with the alternative used in
  the test.} \item{nucleotides}{A character vector with the
  nucleotides tested.} \item{regions}{A
  \code{\link{data.frame}} with columns chr, start, and
  stop.} \item{files}{A list with two entries test and
  control storing the filenames (if the object was
  initialized from two bam-files).}
  \item{combine.method}{The method for combining p-values
  as a character string.} \item{model}{The statistical
  model, either bin for binomial, or betabin for
  beta-binomial} \item{over.dispersion}{If the model is
  beta-binomial, the first parameter for the beta-binomial
  model, which is shared across sites.} \item{call}{The
  last function call to deepSNV.} \item{log.lik}{The log
  likelihood of the data under the null hypothesis.
  (Excluding zeros on the opposite site under a one-sided
  test.)} }
}
\examples{
## Short example with 2 SNVs at frequency ~10\%
regions <- data.frame(chr="B.FR.83.HXB2_LAI_IIIB_BRU_K034", start = 3120, stop=3140)
ex <- deepSNV(test = system.file("extdata", "test.bam", package="deepSNV"), control = system.file("extdata", "control.bam", package="deepSNV"), regions=regions, q=10)
show(ex)   # show method
plot(ex)   # scatter plot
summary(ex)   # summary with significant SNVs
ex[1:3,]   # subsetting the first three genomic positions
tail(test(ex, total=TRUE))   # retrieve the test counts on both strands
tail(control(ex, total=TRUE))

## Not run: Full example with ~ 100 SNVs. Requires an internet connection, but try yourself.
# regions <- data.frame(chr="B.FR.83.HXB2_LAI_IIIB_BRU_K034", start = 2074, stop=3585)
# HIVmix <- deepSNV(test = "http://www.bsse.ethz.ch/cbg/software/deepSNV/data/test.bam", control = "http://www.bsse.ethz.ch/cbg/software/deepSNV/data/control.bam", regions=regions, q=10)
data(HIVmix) # attach data instead..
show(HIVmix)
plot(HIVmix)
head(summary(HIVmix))

}
\author{
  Moritz Gerstung
}
\seealso{
  \code{\link{deepSNV}}
}

