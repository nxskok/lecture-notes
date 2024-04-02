// Estimating Poisson mean

data {
  array[8] int x;
}

parameters {
  real<lower=0> lambda;
}

model {
  // prior
  lambda ~ weibull(1.1, 6);
  // likelihood
  x ~ poisson(lambda);
}

