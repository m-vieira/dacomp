% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dacomp_generate_example_data.R
\name{dacomp.generate_example_dataset_multivariate_example}
\alias{dacomp.generate_example_dataset_multivariate_example}
\title{Generate an example dataset with a multivariate phenotype}
\usage{
dacomp.generate_example_dataset_multivariate_example(n, m1 = 30,
  signal_strength_as_change_in_microbial_load = 0.1)
}
\arguments{
\item{n}{Number of samples.}

\item{m1}{Number of differentially abundant taxa}

\item{signal_strength_as_change_in_microbial_load}{}
}
\value{
a list
\itemize{
\item{counts}{A counts matrix with \code{n} rows, and 1384 columns, rows represent samples,columns represent taxa.}
\item{covariate}{The measured phenotype, a matrix of size \code{n X 2}, rows in this matrix correspond to the rows of \code{counts}}
\item{select_diff_abundant}{A vector containing the indices of taxa that are differentially abundant.}
\item{taxonomy}{A table for the taxonomic affiliation of OTUs in the simulated dataset.}
}
}
\description{
Generate a simulated dataset, similar to \code{\link{dacomp.generate_example_dataset_continuous}} with the following difference: the generated dataset contains two phenotypes, instead of one.
The change observed in a sample, is monotone increasing with the values of each measured covariate.
}
\examples{
data = dacomp.generate_example_dataset_multivariate_example(30)

}
\references{
Brill, Barak, Amnon Amir, and Ruth Heller. 2019. Testing for Differential Abundance in Compositional Counts Data, with Application to Microbiome Studies. arXiv Preprint arXiv:1904.08937.

Kostic, Aleksandar D, Dirk Gevers, Chandra Sekhar Pedamallu, Monia Michaud, Fujiko Duke, Ashlee M Earl, Akinyemi I Ojesina, et al. 2012. Genomic Analysis Identifies Association of Fusobacterium with Colorectal Carcinoma. Genome Research 22 (2). Cold Spring Harbor Lab: 292–98.

McMurdie, Paul J, and Susan Holmes. 2013. Phyloseq: An R Package for Reproducible Interactive Analysis and Graphics of Microbiome Census Data. PloS One 8 (4). Public Library of Science: e61217.
}
