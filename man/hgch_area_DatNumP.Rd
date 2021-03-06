% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/area.R
\name{hgch_area_DatNumP}
\alias{hgch_area_DatNumP}
\title{Area (dates, n numbers)}
\usage{
hgch_area_DatNumP(data, title = NULL, subtitle = NULL, caption = NULL,
  horLabel = NULL, verLabel = NULL, yLine = NULL, yLineLabel = NULL,
  agg = "sum", dropNa = FALSE, order = NULL, percentage = FALSE,
  theme = NULL, export = FALSE, ...)
}
\arguments{
\item{data}{A data.frame}
}
\value{
Highcharts visualization
}
\description{
Compare n quantities over dates
}
\section{ctypes}{

Dat-NumP
}

\examples{
hgch_area_DatNumP(sampleData("Dat-NumP", nrow = 10))
}
