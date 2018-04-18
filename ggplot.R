library(ggplot2)
data(diamonds)
head(diamonds)
#carat為鑽石重量
hist(diamonds$carat,main = "Carat Histogram", xlab = "Carat")
#散佈圖
plot(price ~ carat, data = diamonds)
plot(diamonds$carat,diamonds$price)
#箱型圖
boxplot(diamonds$carat)
#開始美化囉
#直方圖
ggplot(data = diamonds) + geom_histogram(aes(x=carat))
#機率密度圖
ggplot(data = diamonds) + geom_density(aes(x=carat), fill = "grey50")
#散佈圖
ggplot(diamonds,aes(x = carat, y = price)) + geom_point()
#把初始的 ggplot 物件存入變數
g <- ggplot(diamonds, aes(x = carat, y = price))
g + geom_point(aes(color = color))
#把上一張圖拆開(鑽石外觀顏色)
g + geom_point(aes(color = color)) + facet_wrap(~color)
#以鑽石切割(cut)和鑽石刻度(clarity)來分層的散佈圖
g + geom_point(aes(color = color)) + facet_grid(cut ~ clarity)
#以(color)分層的直方圖
ggplot(diamonds, aes(x = carat)) + geom_histogram() + facet_wrap(~color)
#ggplot2的箱型圖
#用ggplot2繪出鑽石重量的箱型圖(x = 1)
ggplot(diamonds, aes(y = carat, x = 1)) + geom_boxplot()
#用ggplot2繪出以鑽石切割分層的鑽石重量箱型圖
ggplot(diamonds, aes(y = carat, x = cut)) + geom_boxplot()
#畫醜醜的小提琴圖
ggplot(diamonds, aes(y = carat, x = cut)) + geom_violin()
#ggplot2線形圖
head(economics)
ggplot(economics, aes(x = date, y = pop)) + geom_line()
#載入lubridate 套件
library(lubridate)
##建立year和month變數
economics$year <- year(economics$date)
#label 引數設為TRUE表示結果中的月份要以月份的名稱顯示, 而非數字
economics$month <- month(economics$date, label = TRUE)
#採取部分資料
#which函數所回傳的將是該檢測結果為TRUE