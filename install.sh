cp put-disk-space.cron /etc/cron.d/cloudwatch-put-disk-space
chmod 644 /etc/cron.d/cloudwatch-put-disk-space
chown root /etc/cron.d/cloudwatch-put-disk-space
service crond restart
