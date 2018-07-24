# Math art

Create mathematical art with R

This package provides functions and data for creating mathematical art.

Note: Previously this package contained functions for generating data from parametric equations discovered by the mathematical artist [Hamid Naderi Yeganeh](https://mathematics.culturalspot.org/home). The equations, which are publically available, generate data that, when plotted without further processing, closely resemble Hamid's artworks. To ensure that I do not inadvertently receive credit for Hamid's work and out of respect for the artist I have removed any functions and plots derived from his equations, and apologise to Hamid for any confusion this may have caused.

## How to use

### Install the packages

```R
install.packages(c("devtools", "mapproj", "tidyverse", "ggforce"))
devtools::install_github("marcusvolz/mathart")
devtools::install_github("marcusvolz/ggart")
```

### Load the libraries

```R
library(mathart)
library(ggart)
library(ggforce)
library(tidyverse)
```

### Create mollusc shells

The shell model is described in the paper "Models for mollusc shell shape" by M.B. Cortie (1989).

```R
df <- mollusc()
df1 <- df %>% mutate(id = 1)
df2 <- df %>% mutate(id = 2)
df3 <- df %>% mutate(id = 3)

p <- ggplot() +
  geom_point(aes(x, y), df1, size = 0.03, alpha = 0.03) +
  geom_path( aes(x, y), df1, size = 0.03, alpha = 0.03) +
  geom_point(aes(x, z), df2, size = 0.03, alpha = 0.03) +
  geom_path( aes(x, z), df2, size = 0.03, alpha = 0.03) +
  geom_point(aes(y, z), df3, size = 0.03, alpha = 0.03) +
  geom_path( aes(y, z), df3, size = 0.03, alpha = 0.03) +
  facet_wrap(~id, nrow = 2, scales = "free") +
  theme_blankcanvas(margin_cm = 0.5)

ggsave("mollusc01.png", width = 80, height = 80, units = "cm")
```

![plants](https://github.com/marcusvolz/mathart/blob/master/plots/mollusc01.png "Mollusc shells")

### Create harmonographs

Refer to the [Wikipedia article](https://en.wikipedia.org/wiki/Harmonograph) for details about harmonographs.

```R
df1 <- harmonograph(A1 = 1, A2 = 1, A3 = 1, A4 = 1,
                    d1 = 0.004, d2 = 0.0065, d3 = 0.008, d4 = 0.019,
                    f1 = 3.001, f2 = 2, f3 = 3, f4 = 2,
                    p1 = 0, p2 = 0, p3 = pi/2, p4 = 3*pi/2) %>% mutate(id = 1)

df2 <- harmonograph(A1 = 1, A2 = 1, A3 = 1, A4 = 1,
                    d1 = 0.0085, d2 = 0, d3 = 0.065, d4 = 0,
                    f1 = 2.01, f2 = 3, f3 = 3, f4 = 2,
                    p1 = 0, p2 = 7*pi/16, p3 = 0, p4 = 0) %>% mutate(id = 2)

df3 <- harmonograph(A1 = 1, A2 = 1, A3 = 1, A4 = 1,
                    d1 = 0.039, d2 = 0.006, d3 = 0, d4 = 0.0045,
                    f1 = 10, f2 = 3, f3 = 1, f4 = 2,
                    p1 = 0, p2 = 0, p3 = pi/2, p4 = 0) %>% mutate(id = 3)

df4 <- harmonograph(A1 = 1, A2 = 1, A3 = 1, A4 = 1,
                    d1 = 0.02, d2 = 0.0315, d3 = 0.02, d4 = 0.02,
                    f1 = 2, f2 = 6, f3 = 1.002, f4 = 3,
                    p1 = pi/16, p2 = 3*pi/2, p3 = 13*pi/16, p4 = pi) %>% mutate(id = 4)

df <- rbind(df1, df2, df3, df4)

p <- ggplot() +
  geom_path(aes(x, y), df, alpha = 0.25, size = 0.5) +
  coord_equal() +
  facet_wrap(~id, nrow = 2) +
  theme_blankcanvas(margin_cm = 0)

ggsave("harmonograph01.png", p, width = 20, height = 20, units = "cm")
```

![plants](https://github.com/marcusvolz/mathart/blob/master/plots/harmonograph01.png "Harmonograph")
### Create Lissajous curves

Refer to the [Wikipedia article](https://en.wikipedia.org/wiki/Lissajous_curve) for details about Lissajous curves.

```R
set.seed(1)

df <- 1:100 %>% map_df(~lissajous(a = runif(1, 0, 10), A = runif(1, 0, 1)), .id = "id")

p <- ggplot() +
  geom_path(aes(x, y), df, size = 0.25, lineend = "round") +
  facet_wrap(~id, nrow = 10) +
  coord_equal() +
  theme_blankcanvas(margin_cm = 1)

ggsave("lissajous001.png", p, width = 20, height = 20, units = "cm", dpi = 300)
```

![plants](https://github.com/marcusvolz/mathart/blob/master/plots/lissajous01.png "Lissajous")

### Lissajous curves as k-nearest neighbour graphs

Refer to the [Wikipedia article](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm) for details about k-nearest neighbors graphs.

```R
set.seed(2)
df <- lissajous(a = runif(1, 0, 2), b = runif(1, 0, 2), A = runif(1, 0, 2), B = runif(1, 0, 2), d = 200) %>%
  sample_n(1001) %>%
  k_nearest_neighbour_graph(40)

p <- ggplot() +
  geom_segment(aes(x, y, xend = xend, yend = yend), df, size = 0.03) +
  coord_equal() +
  theme_blankcanvas(margin_cm = 0)

ggsave("knn_lissajous_002.png", p, width = 25, height = 25, units = "cm")
```

![lissajous_knn](https://github.com/marcusvolz/mathart/blob/master/plots/knn_lissajous_002.png "Lissajous-knn")

### Rose curves

Refer to the [Wikipedia article](https://en.wikipedia.org/wiki/Rose_(mathematics)) for details about rose curves.

```R
df <- data.frame(x = numeric(0), y = numeric(0), n = integer(0), d = integer(0))

for(n in 1:10) {
  for(d in 1:10) {
    result <- rose_curve(n, d) %>% mutate(n = n, d = d)
    df <- rbind(df, result)
  }
}

p <- ggplot() +
  geom_path(aes(x, y), df, size = 0.35, lineend = "round") +
  facet_grid(d ~ n) +
  coord_equal() +
  theme_blankcanvas(margin_cm = 1)

ggsave("rose_curves.png", p, width = 20, height = 20, units = "cm")
```

![rose_curves](https://github.com/marcusvolz/mathart/blob/master/plots/rose_curves.png "Rose-curves")

### Lorenz attractor

The Rcpp implementations for the attractor functions in this package are from the blog post [Drawing 10 Million Points With ggplot](https://fronkonstin.com/2017/11/07/drawing-10-million-points-with-ggplot-clifford-attractors/) by Antonio Sanchez Chinchon.

```R
df <- lorenz_attractor(a=20, b=8/3, c=28, n=1000000)

p <- ggplot() +
  geom_path(aes(x, z), df, alpha = 0.15, size = 0.03) +
  coord_equal() +
  xlim(-25, 25) + ylim(2.5, 52.5) +
  theme_blankcanvas(margin_cm = 0)

ggsave("lorenz_attractor.png", p, width = 20, height = 20, units = "cm")
```

![lorenz](https://github.com/marcusvolz/mathart/blob/master/plots/lorenz_attractor.png "Lorenz")

### Rapidly exploring random tree

Refer to the [Wikipedia article](https://en.wikipedia.org/wiki/Rapidly-exploring_random_tree) for details about rapidly exploring random trees.

```R
# Generate rrt edges
set.seed(1)
df <- rapidly_exploring_random_tree() %>% mutate(id = 1:nrow(.))

# Create plot
p <- ggplot() +
  geom_segment(aes(x, y, xend = xend, yend = yend, size = -id, alpha = -id), df, lineend = "round") +
  coord_equal() +
  scale_size_continuous(range = c(0.1, 0.75)) +
  scale_alpha_continuous(range = c(0.1, 1)) +
  theme_blankcanvas(margin_cm = 0)

# Save plot
ggsave("rapidly_exploring_random_tree.png", p, width = 20, height = 20, units = "cm")
```

![rrt](https://github.com/marcusvolz/mathart/blob/master/plots/rapidly_exploring_random_tree.png "rrt")

### Fractal ferns

Refer to the [Wikipedia article](https://en.wikipedia.org/wiki/Barnsley_fern) for details about fractal ferns.

```R
n <- 250000

params1 <- data.frame(
  a <- c(0, 0.85, 0.2, -0.15),
  b <- c(0, 0.04, -0.26, 0.28),
  c <- c(0, -0.04, 0.23, 0.26),
  d <- c(0.16, 0.85, 0.22, 0.24),
  e <- c(0, 0, 0, 0),
  f <- c(0, 1.6, 1.6, 0.44),
  p <- c(0.01, 0.85, 0.07, 0.07)
)

params2 <- data.frame(
  a <- c(0, 0.85, 0.09, -0.09),
  b <- c(0, 0.02, -0.28, 0.28),
  c <- c(0, -0.02, 0.3, 0.3),
  d <- c(0.25, 0.83, 0.11, 0.09),
  e <- c(0, 0, 0, 0),
  f <- c(-0.14, 1, 0.6, 0.7),
  p <- c(0.02, 0.84, 0.07, 0.07)
)

df1 <- fractal_fern(n = n, a = params1$a, b = params1$b, c_ = params1$c, d = params1$d, e = params1$e,
                   f = params1$f, p = params1$p) %>% mutate(id = 1)

df2 <- fractal_fern(n = n, a = params2$a, b = params2$b, c_ = params2$c, d = params2$d, e = params2$e,
                    f = params2$f, p = params2$p) %>% mutate(id = 2)

df <- rbind(df1, df2 %>% mutate(x = x*1.75, y = y*1.75))

p <- ggplot() +
  geom_point(aes(x, y), df, size = 0.03, alpha = 0.06) +
  coord_equal() +
  facet_wrap(~id, nrow = 1) +
  theme_blankcanvas(margin_cm = 1)

ggsave("fern01.png", width = 20, height = 20, units = "cm")
```

![ferns](https://github.com/marcusvolz/mathart/blob/master/plots/fern01.png "Ferns")
### k-d tree

Refer to the [Wikipedia article](https://en.wikipedia.org/wiki/K-d_tree) for details about k-d trees.

```R
points <- mathart::points

result <- kdtree(points)

p <- ggplot() +
  geom_segment(aes(x, y, xend = xend, yend = yend), result) +
  coord_equal() +
  xlim(0, 10000) + ylim(0, 10000) +
  theme_blankcanvas(margin_cm = 0)

ggsave("kdtree.png", p, width = 20, height = 20, units = "in")
```

![kdtree](https://github.com/marcusvolz/mathart/blob/master/plots/kdtree.png "kdtree")

### Weiszfeld convergence

This plot shows iterations of Weiszfeld's algorithm for finding the geometric median of a given set of points. The algorithm is initialised from 10,000 locations. Refer to the [Wikipedia article](https://en.wikipedia.org/wiki/Geometric_median) for details about the geometric median and Weiszfeld's algorithm.

```R
set.seed(1)

terminals <- data.frame(x = runif(10, 0, 10000), y = runif(10, 0, 10000))

df <- 1:10000 %>%
  map_df(~weiszfeld(terminals, c(points$x[.], points$y[.])), .id = "id")

p <- ggplot() +
  geom_point(aes(x, y), points, size = 1, alpha = 0.25) +
  geom_point(aes(x, y), terminals, size = 5, alpha = 1) +
  geom_line(aes(x, y, group = id), df, colour = "black", size = 0.5, alpha = 0.03) +
  coord_equal() +
  xlim(0, 10000) +
  ylim(0, 10000) +
  theme_blankcanvas(margin_cm = 0)

ggsave("weiszfeld.png", p, width = 20, height = 20, units = "in")
```

![weiszfeld](https://github.com/marcusvolz/mathart/blob/master/plots/weiszfeld.png "weiszfeld")