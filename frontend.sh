echo -e "\e[34mInstalling Nginx Server\e[0m"
yum install nginx -y &>>/tmp/roboshop.log

echo -e "\e[34mRemoving Old app content\e[0m"
rm -rf /usr/share/nginx/html/* >/tmp/roboshop.log &>>/tmp/roboshop.log


echo -e "\e[34mDownloading frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip >/tmp/roboshop.log &>>/tmp/roboshop.log

echo -e "\e[34mExtract frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[34mUpdate Frontend Configuration\e[0m"
cp roboshop.conf /etc/nginx/default.d/roboshop.conf


echo -e "\e[34mStarting Nginx Server\e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log



