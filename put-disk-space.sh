instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
instance_name=`aws ec2 describe-tags --filters Name=resource-id,Values=$instance_id Name=key,Values=Name --query Tags[].Value --output text`
root=`df | grep "\W\/$"`
total=`echo $root | awk -F " " '{print $2}'`
used=`echo $root | awk -F " " '{print $3}'`
free=`echo $root | awk -F " " '{print $4}'`
percent=`echo $root | awk -F " " '{print $5}' | grep -o "[0-9]\+"`
unit="Kilobytes"
namespace="DS4"
dimensions="Dimensions=[{Name=InstanceID,Value="$instance_id"},{Name=InstanceName,Value="\""$instance_name"\""}]"

echo "DiskSpace:Total="$total",Used="$used",Free="$free",Percent="$percent

aws cloudwatch put-metric-data --metric-data \
"MetricName=DiskSpaceTotal,$dimensions,Value=$total,Unit=$unit" \
"MetricName=DiskSpaceUsed,$dimensions,Value=$used,Unit=$unit" \
"MetricName=DiskSpaceFree,$dimensions,Value=$free,Unit=$unit" \
"MetricName=DiskSpacePercent,$dimensions,Value=$percent,Unit=Percent" \
--namespace $namespace

