% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/area.R
\name{hgch_area_stacked_100_CatOca}
\alias{hgch_area_stacked_100_CatOca}
\title{Vertical %100 stacked area (categories, ordered categories)}
\usage{
hgch_area_stacked_100_CatOca(data, title = NULL, subtitle = NULL,
  caption = NULL, horLabel = NULL, verLabel = NULL, yLine = NULL,
  yLineLabel = NULL, dropNa = FALSE, order = NULL, percentage = FALSE,
  theme = NULL, export = FALSE, ...)
}
\arguments{
\item{data}{A data.frame}
}
\value{
Highcharts visualization
}
\description{
Compare %100 stacked categories
}
\section{ctypes}{

Cat-Oca
}

\examples{
hgch_area_stacked_100_CatOca(sampleData("Cat-Cat", nrow = 10))
}
