instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
instance_name=`aws ec2 describe-tags --filters Name=resource-id,Values=$instance_id Name=key,Values=Name --query Tags[].Value --output text`
root=`df | grep "\W\/$"`
total=`echo $root | awk -F " " '{print $2}'`
used=`echo $root | awk -F " " '{print $3}'`
free=`echo $root | awk -F " " '{print $4}'`
percent=`echo $root | awk -F " " '{print $5}' | grep -o "[0-9]\+"`
unit="Kilobytes"
namespace="DS4"
dimensions="Dimensions=[{Name=InstanceName,Value="\""$instance_name"\""},{Name=InstanceID,Value="$instance_id"}]"

echo "DiskSpace:Total="$total",Used="$used" ,Free="$free",Percent="$percent

aws cloudwatch put-metric-data --metric-data \
"MetricName=DiskSpaceTotal,"$dimensions",Value="$total",Unit=Kilobytes" \
"MetricName=DiskSpaceUsed,"$dimensions",Value="$used",Unit=Kilobytes" \
"MetricName=DiskSpaceFree,"$dimensions",Value="$free",Unit=Kilobytes" \
"MetricName=DiskSpacePercent,"$dimensions",Value="$percent",Unit=Percent" \
--namespace $namespace

