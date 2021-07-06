data {
  vector[10] y;
}

parameters {
  real mu;
  real<lower=0> sigma;
}

model { // target contains the complete log-posterior, constants and all
  target+=normal_lpdf(mu | 0, 5); // prior for mu
  target+=chi_square_lpdf(sigma | 5); // prior for sigma
  target+=normal_lpdf(y | mu, sigma); // likelihood
}

