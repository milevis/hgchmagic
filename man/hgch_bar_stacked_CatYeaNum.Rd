% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bars.R
\name{hgch_bar_stacked_CatYeaNum}
\alias{hgch_bar_stacked_CatYeaNum}
\title{Stacked bar (categories, years, numbers)}
\usage{
hgch_bar_stacked_CatYeaNum(data, title = NULL, subtitle = NULL,
  caption = NULL, horLabel = NULL, verLabel = NULL, horLine = NULL,
  horLineLabel = NULL, verLine = NULL, verLineLabel = NULL, agg = "sum",
  dropNa = FALSE, format = "{value}", legendLayout = "horizontal",
  order = NULL, orientation = "ver", percentage = FALSE, sort = "no",
  sliceN = NULL, theme = NULL, tooltip = list(headerFormat = NULL,
  pointFormat = NULL, shared = NULL), export = FALSE, ...)
}
\arguments{
\item{data}{A data.frame}
}
\value{
Highcharts visualization
}
\description{
Compare quantities among stacked categories over years
}
\section{ctypes}{

Cat-Yea-Num
}

\examples{
hgch_bar_stacked_CatYeaNum(sampleData("Cat-Yea-Num", nrow = 10))
}
