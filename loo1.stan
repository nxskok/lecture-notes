data {
  vector[10] y;
}

parameters {
  real mu;
  real<lower=0> sigma;
}

model {
  mu ~ normal(0, 10); //prior for mu
  sigma ~ chi_square(5);
  y ~ normal(mu, sigma); // likelihood
}

generated quantities {
  vector[10] log_lik;
  for (i in 1:10) {
    log_lik[i] = normal_lpdf(y[i] | mu, sigma);
  }
}

