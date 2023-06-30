echo -e "\e[34mConfiguring NodeJS Repo\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[34mInstall NodeJS \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[34mAdd Application User\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[34mCreate Application Directory\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[34mDownload Appliation Content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app

echo -e "\e[34mExtract Appliation Content\e[0m"
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log
cd /app &>>/tmp/roboshop.log

echo -e "\e[34mInstall NodeJS Dependencies\e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[34mSetup SystemD Service\e[0m"
cp /home/centos/roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "\e[34mStart Catalogue Service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl restart catalogue &>>/tmp/roboshop.log


echo -e "\e[34mCopy MongoDB Repo File\e[0m"
cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[34mInstall MongoDB Client\e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[34mLoad Schema\e[0m"
mongo --host mongodb-dev.sandevops.site </app/schema/catalogue.js &>>/tmp/roboshop.log