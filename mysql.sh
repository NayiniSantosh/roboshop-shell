echo -e "\e[34mDisable MySQL Default Version \e[0m"
yum module disable mysql -y &>>/tmp/roboshop.log

echo -e "\e[34m Copy MySQL Repo File \e[0m"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo &>>/tmp/roboshop.log

echo -e "\e[34m Install MySQl Community Service\e[0m"
yum install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "\e[34m Start MySQL Service\e[0m"
systemctl enable mysqld &>>/tmp/roboshop.log
systemctl restart mysqld &>>/tmp/roboshop.log

echo -e "\e[34m SetUp MqSQL Password\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1 &>>/tmp/roboshop.log

