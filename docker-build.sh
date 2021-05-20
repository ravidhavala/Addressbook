rm -rf docker-jenkins-build
mkdir docker-jenkins-build
cd docker-jenkins-build
cp /var/lib/jenkins/workspace/ApplicationPackage/target/addressbook.war .
cat << 'EOF' > dockerfile
FROM tomcat
Maintainer "Ravi"
ADD addressbook.war /usr/local/tomcat/webapps
CMD "catalina.sh" "run"
EOF

sudo docker bulid . -t ravidhavala/addressbook:$BUILD_NUMBER
sudo docker push ravidhavala/addressbook:$BUILD_NUMBER
