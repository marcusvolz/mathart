# Math art

Create mathematical art with R

## How to use

### Install the packages

```R
install.packages(c("devtools", "mapproj", "tidyverse"))
devtools::install_github("marcusvolz/mathart")
devtools::install_github("marcusvolz/ggart")
```

### Load the libraries

```R
library(mathart)
library(ggart)
library(tidyverse)
```

### Create birds plot

```R
df <- rbind(parrot() %>% mutate(id = 1),
            stork() %>% mutate(id = 2),
            magpie() %>% mutate(id = 3))

p <- ggplot() +
  geom_point(aes(x, y, alpha = r), df, size = 0.03) +
  facet_wrap(~id, nrow = 2, scales = "free") +
  scale_alpha_continuous(range = c(0.03, 0.06)) +
  theme_blankcanvas(margin_cm = 1)

ggsave("birds01.png", p, width = 20, height = 20, units = "cm", dpi = 300)
```

![birds](https://github.com/marcusvolz/mathart/blob/master/plots/birds01.png "Parametric birds")
