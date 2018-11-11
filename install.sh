cp put-disk-space.cron /etc/cron.d/cloudwatch-put-disk-space
chmod 644 /etc/cron.d/cloudwatch-put-disk-space
chown root /etc/cron.d/cloudwatch-put-disk-space
cp put-meminfo.cron /etc/cron.d/cloudwatch-put-meminfo
chmod 644 /etc/cron.d/cloudwatch-put-meminfo
chown root /etc/cron.d/cloudwatch-put-meminfo
service crond restart
