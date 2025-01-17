% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trans-date.R
\name{timespan_trans}
\alias{timespan_trans}
\alias{hms_trans}
\title{Transformation for times (class hms)}
\usage{
timespan_trans(unit = c("secs", "mins", "hours", "days", "weeks"))

hms_trans()
}
\arguments{
\item{unit}{The unit used to interpret numeric input}
}
\description{
\code{timespan_trans()} provides transformations for data encoding time passed
along with breaks and label formatting showing standard unit of time fitting
the range of the data. \code{hms_trans()} provides the same but using standard hms
idioms and formatting.
}
\examples{
# timespan_trans allows you to specify the time unit numeric data is
# interpreted in
min_trans <- timespan_trans("mins")
demo_timespan(seq(0, 100), trans = min_trans)
# Input already in difftime format is interpreted correctly
demo_timespan(as.difftime(seq(0, 100), units = "secs"), trans = min_trans)

if (require("hms")) {
  # hms_trans always assumes seconds
  hms <- round(runif(10) * 86400)
  t <- hms_trans()
  t$transform(hms)
  t$inverse(t$transform(hms))
  t$breaks(hms)
  # The break labels also follow the hms format
  demo_timespan(hms, trans = t)
}

}
