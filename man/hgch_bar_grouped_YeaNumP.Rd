% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bars.R
\name{hgch_bar_grouped_YeaNumP}
\alias{hgch_bar_grouped_YeaNumP}
\title{Bar (years, n numbers)}
\usage{
hgch_bar_grouped_YeaNumP(data, title = NULL, subtitle = NULL,
  caption = NULL, horLabel = NULL, verLabel = NULL, yLine = NULL,
  yLineLabel = NULL, agg = "sum", dropNa = FALSE, order = NULL,
  orientation = "ver", percentage = FALSE, sort = "no", sliceN = NULL,
  theme = NULL, export = FALSE, ...)
}
\arguments{
\item{data}{A data.frame}
}
\value{
Highcharts visualization
}
\description{
Compare n quantities over years
}
\section{ctypes}{

Yea-NumP
}

\examples{
hgch_bar_grouped_YeaNumP(sampleData("Yea-NumP", nrow = 10))
}
