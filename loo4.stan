data {
  vector[10] y;
}

parameters {
  real<lower=0> sigma;
}

model { // target contains the complete log-posterior, constants and all
  target+=chi_square_lpdf(sigma | 5); // prior for sigma
  target+=normal_lpdf(y | 0, sigma); // likelihood
}

