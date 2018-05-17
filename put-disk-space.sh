instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
instance_type=`curl -s http://169.254.169.254/latest/meta-data/instance-type`
root=`df | grep "\W\/$"`
total=`echo $root | awk -F " " '{print $2}'`
used=`echo $root | awk -F " " '{print $3}'`
free=`echo $root | awk -F " " '{print $4}'`
percent=`echo $root | awk -F " " '{print $5}' | grep -o "[0-9]\+"`
unit="Bytes"

aws cloudwatch put-metric-data --namespace EC2 --metric-name DiskSpaceTotal   --unit $unit    --value $total   --dimensions InstanceID=$instance_id,InstanceType=$instance_type
aws cloudwatch put-metric-data --namespace EC2 --metric-name DiskSpaceUsed    --unit $unit    --value $used    --dimensions InstanceID=$instance_id,InstanceType=$instance_type
aws cloudwatch put-metric-data --namespace EC2 --metric-name DiskSpaceFree    --unit $unit    --value $free    --dimensions InstanceID=$instance_id,InstanceType=$instance_type
aws cloudwatch put-metric-data --namespace EC2 --metric-name DiskSpacePercent --unit Percent  --value $percent --dimensions InstanceID=$instance_id,InstanceType=$instance_type

echo "The disk has "$total" things, has used "$used" things, and has "$free" things free.  That's "$percent"%"

