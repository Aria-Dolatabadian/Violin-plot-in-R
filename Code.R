
library(ggplot2)

# Read data from CSV file
imported_data <- read.csv("generated_data.csv")

# Print the first few rows of the imported data
print(head(imported_data))

# Plot violin plot with x and y-axis lines, data points, and additional statistics
ggplot(imported_data, aes(x = Group, y = Value, fill = Group)) +
  geom_violin(trim = FALSE) +
  geom_point(position = position_jitter(width = 0.2), size = 2, alpha = 0.5) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray") +
  geom_vline(xintercept = seq(0.5, 2.5, by = 1), linetype = "dashed", color = "gray") +
  stat_summary(fun = "mean", geom = "point", shape = 4, size = 3, color = "red") +  # Add average points
  stat_summary(fun.data = "mean_sdl", fun.args = list(mult = 1), geom = "crossbar", width = 0.1, color = "blue") +  # Add mean +/- 1 standard deviation
  stat_summary(fun = "median", geom = "point", shape = 18, size = 3, color = "green") +  # Add median points
  stat_summary(fun.y = "mean", geom = "line", aes(group = 1), linetype = "dashed", size = 1, color = "red") +  # Add dashed average line
  stat_summary(fun.data = "median_hilow", geom = "linerange", aes(group = 1), size = 1, color = "green") +  # Add median line with IQR range
  labs(title = "Violin Plot with Data Points and Statistics",
       x = "Group", y = "Value") +
  theme_minimal() +
  theme(axis.line = element_line(color = "black", size = 1),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank())
