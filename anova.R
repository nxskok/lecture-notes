## ----bAnova-1-----------------------------------------------------------------
library(tidyverse)
library(broom)
library(car) # for Levene's text


## ----bAnova-2, message=F------------------------------------------------------
my_url <- "http://ritsokiguess.site/datafiles/hairpain.txt"
hairpain <- read_delim(my_url, " ")
hairpain %>%
  group_by(hair) %>%
  summarize(
    n = n(),
    xbar = mean(pain),
    s = sd(pain)
  )


## ----tartuffo,fig.height=3.5--------------------------------------------------
ggplot(hairpain, aes(x = hair, y = pain)) + geom_boxplot()


## ----bAnova-3-----------------------------------------------------------------
leveneTest(pain ~ hair, data = hairpain)


## ----bAnova-4-----------------------------------------------------------------
hairpain.1 <- aov(pain ~ hair, data = hairpain)
summary(hairpain.1)


## ----bAnova-5-----------------------------------------------------------------
TukeyHSD(hairpain.1)


## ----bAnova-6-----------------------------------------------------------------
with(hairpain, pairwise.t.test(pain, hair, p.adj = "none"))
with(hairpain, pairwise.t.test(pain, hair, p.adj = "holm"))


## ----bAnova-7-----------------------------------------------------------------
with(hairpain, pairwise.t.test(pain, hair, p.adj = "fdr"))
with(hairpain, pairwise.t.test(pain, hair, p.adj = "bon"))


## ----bAnova-8-----------------------------------------------------------------
my_url <- "http://ritsokiguess.site/datafiles/vitaminb.txt"
vitaminb <- read_delim(my_url, " ")


## ----bAnova-9-----------------------------------------------------------------
vitaminb


## ----bAnova-10, fig.height=3.0------------------------------------------------
ggplot(vitaminb, aes(
  x = ratsize, y = kidneyweight,
  fill = diet
)) + geom_boxplot()


## ----bAnova-11----------------------------------------------------------------
summary <- vitaminb %>%
  group_by(ratsize, diet) %>%
  summarize(n = n(), mean = mean(kidneyweight))
summary


## ----bAnova-12----------------------------------------------------------------
vitaminb.1 <- aov(kidneyweight ~ ratsize * diet,
  data = vitaminb
)
summary(vitaminb.1)


## ----bAnova-13----------------------------------------------------------------
g <- ggplot(summary, aes(
  x = ratsize, y = mean,
  colour = diet, group = diet
)) +
  geom_point() + geom_line()


## ----bAnova-14, fig.height=3.7------------------------------------------------
g


## ----bAnova-15----------------------------------------------------------------
vitaminb.2 <- update(vitaminb.1, . ~ . - ratsize:diet)
summary(vitaminb.2)


## -----------------------------------------------------------------------------
TukeyHSD(vitaminb.2)


## ----bAnova-16----------------------------------------------------------------
vitaminb.3 <- lm(kidneyweight ~ ratsize + diet, data = vitaminb)
summary(vitaminb.3)


## ----bAnova-17----------------------------------------------------------------
  drop1(vitaminb.3, test = "F") 


## ----bAnova-18----------------------------------------------------------------
ggplot(vitaminb.3, aes(sample=.resid)) + 
  stat_qq() + stat_qq_line()


## ----bAnova-19----------------------------------------------------------------
ggplot(vitaminb.3, aes(x=.fitted, y=.resid)) + geom_point()


## ----bAnova-20----------------------------------------------------------------
vitaminb.3 %>% augment(vitaminb) -> vitaminb.3a


## ----bAnova-21----------------------------------------------------------------
ggplot(vitaminb.3a, aes(x = ratsize, y = .resid)) + 
  geom_boxplot()


## ----bAnova-22----------------------------------------------------------------
ggplot(vitaminb.3a, aes(x = diet, y = .resid)) + 
  geom_boxplot()


## ----bAnova-23----------------------------------------------------------------
u <- "http://ritsokiguess.site/datafiles/autonoise.txt"
autonoise <- read_table(u)


## ----bAnova-24----------------------------------------------------------------
glimpse(autonoise)


## ----bAnova-25----------------------------------------------------------------
g <- autonoise %>%
  ggplot(aes(x = size, y = noise, fill = type)) +
  geom_boxplot()


## ----bAnova-26----------------------------------------------------------------
g


## ----bAnova-27----------------------------------------------------------------
autonoise.1 <- aov(noise ~ size * type, data = autonoise)
summary(autonoise.1)


## ----bAnova-28----------------------------------------------------------------
autonoise.2 <- TukeyHSD(autonoise.1)
autonoise.2$`size:type`


## ----bAnova-29----------------------------------------------------------------
g <- ggplot(autonoise, aes(
  x = size, y = noise,
  colour = type, group = type
)) +
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun = mean, geom = "line")


## ----bAnova-30----------------------------------------------------------------
g


## ----bAnova-31----------------------------------------------------------------
autonoise %>%
  group_by(size, type) %>%
  summarize(mean_noise = mean(noise)) %>%
  ggplot(aes(
    x = size, y = mean_noise, group = type,
    colour = type
  )) + geom_point() + geom_line()


## ----bAnova-32----------------------------------------------------------------
autonoise %>%
  filter(size == "S") %>%
  aov(noise ~ type, data = .) %>%
  summary()


## ----bAnova-33----------------------------------------------------------------
autonoise %>%
  filter(size == "M") %>%
  aov(noise ~ type, data = .) %>%
  summary()


## ----bAnova-34----------------------------------------------------------------
autonoise %>%
  filter(size == "M") %>%
  group_by(type) %>%
  summarize(m = mean(noise))


## ----bAnova-35----------------------------------------------------------------
autonoise %>%
  filter(size == "L") %>%
  aov(noise ~ type, data = .) %>%
  summary()


## ----bAnova-36----------------------------------------------------------------
autonoise %>%
  group_by(size) %>%
  nest()


## ----bAnova-37----------------------------------------------------------------
aov_pval <- function(x) {
  noise.1 <- aov(noise ~ type, data = x)
  gg <- tidy(noise.1)
  gg$p.value[1]
}


## ----bAnova-38----------------------------------------------------------------
autonoise %>%
  filter(size == "L") %>%
  aov_pval()


## ----bAnova-39----------------------------------------------------------------
autonoise %>%
  nest_by(size) %>% 
  rowwise() %>% 
  mutate(p_val = aov_pval(data)) %>% 
  select(-data)


## ----bAnova-40----------------------------------------------------------------
autonoise %>%
  nest_by(size) %>% 
  rowwise() %>% 
  mutate(p_val = aov_pval(data)) %>% 
  select(-data) -> simple_effects
simple_effects


## ----bAnova-41----------------------------------------------------------------
simple_effects %>% 
  mutate(p_val_adj = p_val * 3)


## ----bAnova-42----------------------------------------------------------------
autonoise %>%
  filter(size == "S") %>%
  t.test(noise ~ type, data = .) %>%
  pluck("conf.int")


## ----bAnova-43----------------------------------------------------------------
autonoise %>%
  filter(size == "M") %>%
  t.test(noise ~ type, data = .) %>%
  pluck("conf.int")


## ----bAnova-44----------------------------------------------------------------
autonoise %>%
  filter(size == "L") %>%
  t.test(noise ~ type, data = .) %>%
  pluck("conf.int")


## ----bAnova-45----------------------------------------------------------------
ci_func <- function(x) {
  tt <- t.test(noise ~ type, data = x)
  tt$conf.int
}

autonoise %>% nest_by(size) %>%
  rowwise() %>% 
  mutate(ci = list(ci_func(data))) %>%
  unnest_wider(ci, names_sep = "_") -> cis


## ----bAnova-46----------------------------------------------------------------
cis %>% select(size, starts_with("ci"))


## ----bAnova-47----------------------------------------------------------------
cis %>% select(-data)


## ----bAnova-48----------------------------------------------------------------
c.home <- c(1, 0, 0, -1)


## ----bAnova-49----------------------------------------------------------------
c.industrial <- c(0, 1, -1, 0)


## ----bAnova-50----------------------------------------------------------------
c.home.ind <- c(0.5, -0.5, -0.5, 0.5)


## ----bAnova-51----------------------------------------------------------------
c.home * c.industrial
c.home * c.home.ind
c.industrial * c.home.ind


## ----bAnova-52----------------------------------------------------------------
c1 <- c(1, -1, 0)
c2 <- c(0, 1, -1)
sum(c1 * c2)


## ----bAnova-53, message=F-----------------------------------------------------
url <- "http://ritsokiguess.site/datafiles/chainsaw.txt"
chain.wide <- read_table(url)
chain.wide


## ----bAnova-54----------------------------------------------------------------
chain.wide %>% 
  pivot_longer(A:D, names_to = "model", 
               names_ptypes = list(model = factor()), 
               values_to = "kickback") -> chain


## ----bAnova-55----------------------------------------------------------------
chain 


## ----bAnova-56----------------------------------------------------------------
m <- cbind(c.home, c.industrial, c.home.ind)
m
contrasts(chain$model) <- m


## ----bAnova-57----------------------------------------------------------------
chain.1 <- lm(kickback ~ model, data = chain)
summary(chain.1)


## ----bAnova-58----------------------------------------------------------------
tidy(chain.1) %>% select(term, p.value)


## ----bAnova-59----------------------------------------------------------------
chain %>%
  group_by(model) %>%
  summarize(mean.kick = mean(kickback)) %>%
  arrange(desc(mean.kick))

