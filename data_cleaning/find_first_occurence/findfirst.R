d <- data.frame(matrix(c(1, 0, 0, 0, 1, 1, 0, 1,
                         2, 0, 0, 1, 1, 1, 1, 1,
                         3, 1, 1, 1, 1, 1, 1, 1,
                         4, 0, 0, 0, 0, 0, 1, 0,
                         5, 0, 0, 0, 0, 0, 0, 0),
                       byrow=TRUE, nrow=5))
colnames(d) <- c("id", paste0("val", 1:7))

d$first <- apply(d[,2:8], 1, function(x) {
  # there's a warning if 1 never occurs, suppress it
  m <- suppressWarnings(min(which(x == 1)))
  m[!is.finite(m)] <- NA
  m
  })
