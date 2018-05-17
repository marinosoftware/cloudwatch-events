
h1. Simple HD Usage Cloudwatch Events

h2. Installation
```git
mkdir -p aws/cloudwatch-events
cd aws/cloudwatch-events
git clone ssh://username@domainname.com/cloudwatch-events.git .
```

```cron
sudo ln -s /home/ec2-user/aws/cloudwatch-events/put-disk-space.cron /etc/cron.d/cloudwatch-put-disk-space
```

h2. Other options

https://www.howtoforge.com/tutorial/how-to-monitor-disk-space-with-cloudwatch/

