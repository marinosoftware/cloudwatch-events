instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
instance_type=`curl -s http://169.254.169.254/latest/meta-data/instance-type`
root=`df | grep "\W\/$"`
total=`echo $root | awk -F " " '{print $2}'`
used=`echo $root | awk -F " " '{print $3}'`
free=`echo $root | awk -F " " '{print $4}'`
percent=`echo $root | awk -F " " '{print $5}' | grep -o "[0-9]\+"`

data="MetricName=DiskSpace,Dimensions=[{Name=Total,Value="$total"},{Name=Used,Value="$used"},{Name=Free,Value="$free"}],Unit=Kilobytes MetricName=DiskSpace,Dimensions=[{Name=Percent,Value="$percent"}],Unit=Percent"
aws cloudwatch put-metric-data --namespace EC2 --metric-data "\""$data"\""
echo "The disk has "$total" things, has used "$used" things, and has "$free" things free.  That's "$percent"%"

