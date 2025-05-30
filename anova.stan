data {
  int n_obs;
  int n_group;
  array[n_obs] real density;
  array[n_obs] int<lower=1, upper=n_group> group_no;
}

parameters {
  array[n_group] real mu;
  real<lower=0> sigma;
}

model {
  int g;
  // priors
  mu ~ normal(600, 50);
  sigma ~ chi_square(50);
  // likelihood
  for (i in 1:n_obs) {
    g=group_no[i];
    density[i] ~ normal(mu[g], sigma);
  }
}
