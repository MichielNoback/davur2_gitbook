head(pivot_longer(data = skeleton_proportions,
              cols = matches("_"),
              names_pattern = "(genera|specimen)_(.+)",
              names_to = c("source"),
              values_to = c("prop", "ma")
))


my_tibble <- tibble(a = letters[1:3],
                    source.b_type.q = 1:3,
                    source.c_type.q = 6:8,
                    source.b_type.r = 11:13,
                    source.c_type.r = 16:18)


pivot_longer(data = my_tibble,
             cols = matches("_"),
             names_pattern = "(source.b|source.c)_(type.q|type.r)",
             names_to = c("source", "type"),
             values_to = c("val")) %>%
    pivot_wider(names_from = "type",
                values_from = "val")


pivot_longer(data = my_tibble,
             cols = matches("_"),
             names_pattern = "(source.b|source.c)_",
             names_to = c("source"),
             values_to = c("type.q", "type.r"))


skeleton_prop_avg_long <- pivot_longer(data = skeleton_proportions,
             cols = matches("_"),
             names_pattern = "(genera|specimen)_",
             values_to = c("proportion", "moving_average"),
             names_to = "level")



tmp <- head(skeleton_proportions, n=4)
tmp
tmp <- pivot_longer(data = skeleton_proportions,
              cols = matches("_"),
              names_pattern = "(genera|specimen)_(.+)",
              names_to = c("source", "type"),
              values_to = c("val"))
pivot_wider(data = tmp,
            names_from = "type",
            values_from = "val")


two_two_col <- tibble(subject = letters[1:5],
               T0_Control = rnorm(5, 10, 1),
               T0_Treated = rnorm(5, 9.5, 1.2),
               T1_Control = rnorm(5, 11, 1.5),
               T1_Treated = rnorm(5, 16, 2))


pivot_longer(data = two_two_col,
              cols = -"subject",
              names_pattern = "(T.)_(Control|Treated)",
              names_to = c("Time", "Treatment"),
              values_to = "Response")








(skeleton_prop_totals_long <- pivot_longer(
    data = skeleton_prop_and_totals,
    cols = matches("_"),
    names_pattern = "(genera|specimen)_(.+)",
    values_to = c("source", "totals"),
    names_to = "level"))


(tmp <- skeleton_prop_and_totals[-(2:3)])

#tmp <- tmp %>% select(Midpoint, genera_proportion, specimen_proportion, genera_totals, specimen_totals)
print(pivot_longer(data = tmp,
              cols = matches("_"),
              names_pattern = "(genera|specimen)_(proportion|totals)",
              names_to = c("level",".value")), n = Inf)


head(skeleton_proportions)
skeleton_prop_avg_long <- pivot_longer(data = skeleton_proportions,
              cols = matches("_"),
              names_pattern = "(genera|specimen)_(proportion|moving_average)",
              names_to = c("level", ".value"))
skeleton_prop_avg_long


set.seed(101)
df <- data.frame(
  id = 1:10,
  class_gpa = rnorm(10, 0, 1),
  course_gpa = rnorm(10, 0, 1),
  group_gpa = rnorm(10, 0, 1),
  dept_gpa = rnorm(10, 0, 1),
  class_percent_a = rnorm(10, 0, 1),
  course_percent_a = rnorm(10, 0, 1),
  group_percent_a = rnorm(10, 0, 1),
  dept_percent_a = rnorm(10, 0, 1)
)

df

df %>%
    pivot_longer(-id,
                 names_to = c("type", ".value"),
                 names_pattern = "([^_]+)_(.*)")


