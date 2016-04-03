# Goal is to find the first val[i] (e.g. val1, val2, etc) which is 1.
#
# If data is tall, convert to wide first.

d <- data.frame(matrix(c(1, 0, 0, 0, 1, 1, 0, 1,
                         2, 0, 0, 1, 1, 1, 1, 1,
                         3, 1, 1, 1, 1, 1, 1, 1,
                         4, 0, 0, 0, 0, 0, 1, 0,
                         5, 0, 0, 0, 0, 0, 0, 0),
                       byrow=TRUE, nrow=5))
colnames(d) <- c("id", paste0("val", 1:7))

d$first <- NA
for (i in 1:nrow(d)) {
  # there's a warning if 1 never occurs, suppress it
  d$first[i] <- suppressWarnings(min(which(d[i,2:8] == 1)))
  # If 1 never occurred , we'll get Inf, we'd prefer NA.
  if (!is.finite(d$first[i])) d$first[i] <- NA
}

# Using apply, which is likely faster
d$first_apply<- apply(d[,2:8], 1, function(x) {
  m <- suppressWarnings(min(which(x == 1)))
  m[!is.finite(m)] <- NA
  m
})
