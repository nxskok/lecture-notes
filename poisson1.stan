// Estimating Poisson mean

data {
int x[8];
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

