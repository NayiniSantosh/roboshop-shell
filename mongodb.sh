echo -e "\e[34mCopy MongoDB Repo file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo

echo -e "\e[34mInstalling MongoDB Server\e[0m"
yum install mongodb-org -y



#modify the config file(localhost(127.0.0.1))
echo -e "\e[34mStart MongoDB Server\e[0m"
systemctl enable mongod
systemctl restart mongod
