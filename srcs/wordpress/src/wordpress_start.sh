cd /usr/share/webapps/wordpress/
wp core config --dbname=wp --dbuser=root --dbpass=root --dbhost=mysql-svc --dbprefix=wp_ --allow-root --path='/usr/share/webapps/wordpress/'
wp core install --url="https://192.168.99.100:5050"  --title="Учебный проект" --admin_user="root" --admin_password="root" --admin_email="rootl@email.ru" --allow-root --path='/usr/share/webapps/wordpress/'
wp user create user1 user1@example.com --user_pass=user1 --allow-root --path='/usr/share/webapps/wordpress/'
wp user create user2 user2@example.com --user_pass=user2 --allow-root --path='/usr/share/webapps/wordpress/'
supervisord -c /etc/supervisor.conf