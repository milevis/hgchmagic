% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proportions.R
\name{hgch_donut_CatNum}
\alias{hgch_donut_CatNum}
\title{Donut (categories, numbers)}
\usage{
hgch_donut_CatNum(data, title = NULL, subtitle = NULL, caption = NULL,
  yLine = NULL, dropNa = FALSE, agg = "sum", order = NULL,
  sort = "no", sliceN = NULL, theme = NULL, export = FALSE, ...)
}
\arguments{
\item{data}{A data.frame}
}
\value{
Highcharts visualization
}
\description{
Comparing quantities among categories
}
\section{ctypes}{

Cat-Num
}

\examples{
hgch_donut_CatNum(sampleData("Cat-Num", nrow = 10))
}
