\docType{data}
\name{trueSNVs}
\alias{HIVmix}
\alias{trueSNVs}
\title{Example .bam data and true SNVs.}
\description{
  Two .bam alignments as example data sets are downloaded
  remotely via http. Sequenced were a 1,512 nt fragment of
  the HIV genome and a mixture (90\% + 10\%) with another
  variants. The two sequences were confirmed by Sanger
  sequencing and stored in the table trueSNVs.
}
\examples{
data(HIVmix)
data(trueSNVs)
table(p.adjust(p.val(HIVmix), method="BH") < 0.05, trueSNVs)
}
\keyword{datasets}

