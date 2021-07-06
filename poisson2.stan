// Estimating Poisson mean

data {
  int<lower=1> n;
  real<lower=0> a;
  real<lower=0> b;
  int x[n];
}

parameters {
  real<lower=0> lambda;
}

model {
// prior
lambda ~ weibull(a, b);
// likelihood
x ~ poisson(lambda);
}

