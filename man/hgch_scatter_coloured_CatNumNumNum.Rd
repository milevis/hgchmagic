% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scatter.R
\name{hgch_scatter_coloured_CatNumNumNum}
\alias{hgch_scatter_coloured_CatNumNumNum}
\title{Coloured scatter (categories, numbers, numbers, numbers)}
\usage{
hgch_scatter_coloured_CatNumNumNum(data, title = NULL, subtitle = NULL,
  caption = NULL, horLabel = NULL, verLabel = NULL, horLine = NULL,
  horLineLabel = NULL, verLine = NULL, verLineLabel = NULL,
  theme = NULL, export = FALSE, ...)
}
\arguments{
\item{data}{A data.frame}
}
\value{
Highcharts visualization
}
\description{
Two numeric variables set in a cartesian plane coloured by a category and size
}
\section{ctypes}{

Cat-Num-Num
}

\examples{
hgch_scatter_coloured_CatNumNumNum(sampleData("Cat-Num-Num-Num", nrow = 10))
}
