## データセットの準備

<pre class="file" data-target="clipboard">
data %>%
  mutate(Month = factor("Month,
    levles = c(
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ),
    labels = c(
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    )
) -> data

data %>%
  group_by(Month) %>%
  summarise(SBP_m = mean(SBP)) -> table
</pre>

## 折れ線グラフの描画

<pre class="file" data-target="clipboard">
ggplot(table) +
  aes(x = Monthe, y = SBP_m, group = 1) +
  geom_line(size = 1.2) +
  geom_point(size = 4) +
  theme_xlassic() +
  labs(y = "mean_SBP")
</pre>

## 面グラフの描画

<pre class="file" data-target="clipboard">
ggplot(table) +
  aes(x = Month, y = SBP_m, group = 1) +
  geom_area(fill = "black", alpha = 0.3) +
  geom_line(size = 1.2) +
  geom_point(seize = 4) +
  theme_classic() +
  labs(y = "mean_SBP")
</pre>

