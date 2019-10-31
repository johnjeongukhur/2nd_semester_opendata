install.packages("dplyr")
#install.packages("data.table")
install.packages("ggplot2")
install.packages("agricolae")
install.packages("car")

#system("defaults write org.R-project.R force.LANG en_US.UTF-8")

library(dplyr)
#library(data.table)
library(car)

mtcars
# t-test�ϱ����� ��л� ���� �غ���
# �ΰ��� ������ �л��� ������
# 
data.chickwts <- chickwts




######## 1.(1)
boxplot(weight~feed, data=chickwts)

####### 1.(2) 
# "casein"�� "sunflower" �� ������ ��ῡ ���Ͽ� 
# ���� ���԰� ���̰� �ִ��� �����Ϸ��� �Ѵ�. �� ������ 
# ���� ���� �ڷḦ �����Ͽ� data.1 ������ �����Ͻÿ�.


data.casein <- data.chickwts %>% filter(feed == "casein")
data.sunflower <- data.chickwts %>% filter(feed == "sunflower")

data1 <- rbind(data.casein,data.sunflower)   # rbind�� ������ �����͸� ���δ�.



# c�� ���� row�� ���δ�. �׷��� �۵�����.
#data1 <- c(data.casein, data.sunflower)


######## 1.(3)

# �� ������ ��ῡ ���� �� ������ �л��� �����ϴٰ� �� �� �ִ°�? 
# ������ �����ϰ�, �����Ͻÿ�

# ����
# �͹����� : Casein�� sunflower�� ���� �� ������ �л��� ����.
# �븳���� : Casein�� sunflower�� ���� �� ������ �л��� �ٸ���.

#data5 <- subset(chickwts, select=c(data.casein, data.sunflower))

# ����� ���̴�. (3)
leveneTest(data1$weight, as.factor(data1$feed))


# as.numeric(unlist(data1)
# leveneTest(data1)



#as.numeric(unlist(data3))

#as.numeric(unlist(data4))
#as.numeric(data4)

#leveneTest(data3)
#as.numeric(data4)




######## 1.(4) 
# �� ������ ��ῡ ���� �� ������ ����� �����ϴٰ� �� �� �ִ°�? ������ �����ϰ�, �����Ͻÿ�
t.test(data1$weight~data1$feed)
#t.test(data1$weight)
# �͹������� ä���Ѵ�.



########## 2.(1)
### �͹������� �븳������ �����Ͻÿ�.

# �͹�����: �� ���ܰ��� �л��� ���̰� ����.
# �븳����: ��� �ϳ� �̻��� ���ܰ��� ���̰� �ִ�.

########## 2.(2) �л�м��� �̿��Ͽ� �Ʒ��� �л�м�ǥ�� �ۼ��Ͻÿ�.

A <- c(36,41,42,49)
B <- c(40,48,39,45,44)
C <- c(35,37,42,34,32)

data8<-c(A,B,C)

class <- c('A','A','A','A','B','B','B','B','B','C','C','C','C','C')

fit<-aov(data8~class)
summary(fit)

####### 2.(3)
# p-value=0.05���� �۰� �������Ƿ� �͹����� �Ⱒ�ϰ� �븳���� ä���Ѵ�.
# ��� �ϳ� �̻��� ���ܰ��� ���̰� �ִ�.

####### 2.(4)
TukeyHSD(fit)
# �� ���� ���� ���̰� ����.

library(agricolae)
#duncan.test(,console=TRUE) 
duncan.test(fit,"class",alpha = 0.05, console = TRUE)



####### 3.(1)

# �͹����� : 6�� ��ῡ ���� ���� ���Դ� ����.
# �븳���� : ��� 1�� ��ῡ ���� ���� ���Դ� �ٸ���.

####### 3.(2)

aov(weight~feed, data=chickwts) %>% summary()


####### 3.(3)
out <- aov(weight~feed, data=chickwts)
duncan.test(out,"feed",alpha = 0.05, console = TRUE)

#�� Sunflower�� Casein����� ����, meatmeal�� soybean�� ����, soybean�� linseed�� ����. horsebean�� ȥ�ڴ�.


####### 4.(1).
#������ ���� �������� �ؾ���.
# �ι�° ������ �ڽ�Ʈ
# 

nuclear = read.csv('C:/Users/sky49/Documents/īī���� ���� ����/nuclear.csv')
nuclear

pairs(nuclear)


####### 4.(2)
nuclear.use <- nuclear[,c('cost','t1','t2','cap','pr','ne','ct','bw','cum.n','pt')]


####### 4.(3)

lm(cost ~ ., data=nuclear.use) %>% summary()


####### 4.(4)
# AIC=???2logL+2K
out <- lm(cost ~ ., data=nuclear.use)

model.step <- step(out)
model.step %>% summary()

# cost ~ t1 + t2 + cap + pr + ne + pt


####### 4.(5)
#
par(mfrow=c(2,2))
plot(out)

