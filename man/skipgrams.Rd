% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocessing.R
\name{skipgrams}
\alias{skipgrams}
\title{Generates skipgram word pairs.}
\usage{
skipgrams(sequence, vocabulary_size, window_size = 4,
  negative_samples = 1, shuffle = TRUE, categorical = FALSE,
  sampling_table = NULL, seed = NULL)
}
\arguments{
\item{sequence}{A word sequence (sentence), encoded as a list of word indices
(integers). If using a \code{sampling_table}, word indices are expected to match
the rank of the words in a reference dataset (e.g. 10 would encode the
10-th most frequently occuring token). Note that index 0 is expected to be
a non-word and will be skipped.}

\item{vocabulary_size}{Int, maximum possible word index + 1}

\item{window_size}{Int, size of sampling windows (technically half-window).
The window of a word \code{w_i} will be \code{[i-window_size, i+window_size+1]}}

\item{negative_samples}{float >= 0. 0 for no negative (i.e. random) samples. 1
for same number as positive samples.}

\item{shuffle}{whether to shuffle the word couples before returning them.}

\item{categorical}{bool. if \code{FALSE}, labels will be integers (eg. \code{[0, 1, 1 .. ]}),
if \code{TRUE} labels will be categorical eg. \code{[[1,0],[0,1],[0,1] .. ]}}

\item{sampling_table}{1D array of size \code{vocabulary_size} where the entry i
encodes the probabibily to sample a word of rank i.}

\item{seed}{Random seed}
}
\value{
List of \code{couples}, \code{labels} where:
\itemize{
\item \code{couples} is a list of 2-element integer vectors: \code{[word_index, other_word_index]}.
\item \code{labels} is an integer vector of 0 and 1, where 1 indicates that \code{other_word_index}
was found in the same window as \code{word_index}, and 0 indicates that \code{other_word_index}
was random.
\item if \code{categorical} is set to \code{TRUE}, the labels are categorical, ie. 1 becomes \code{[0,1]},
and 0 becomes \code{[1, 0]}.
}
}
\description{
Generates skipgram word pairs.
}
\details{
This function transforms a list of word indexes (lists of integers)
into lists of words of the form:
\itemize{
\item (word, word in the same window), with label 1 (positive samples).
\item (word, random word from the vocabulary), with label 0 (negative samples).
}

Read more about Skipgram in this gnomic paper by Mikolov et al.:
\href{http://arxiv.org/pdf/1301.3781v3.pdf}{Efficient Estimation of Word Representations in Vector Space}
}
\seealso{
Other text preprocessing: \code{\link{make_sampling_table}},
  \code{\link{pad_sequences}},
  \code{\link{text_hashing_trick}},
  \code{\link{text_one_hot}},
  \code{\link{text_to_word_sequence}}
}
\concept{text preprocessing}
