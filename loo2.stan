data {
  vector[10] y;
}

parameters {
  real<lower=0> sigma;
}

model {
  sigma ~ chi_square(5);
  y ~ normal(0, sigma); // likelihood
}

generated quantities {
  vector[10] log_lik;
  for (i in 1:10) {
    log_lik[i] = normal_lpdf(y[i] | 0, sigma);
  }
}

