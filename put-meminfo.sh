meminfo=`cat /proc/meminfo`
total=`echo $meminfo | grep -o "MemTotal: \+[0-9]\+ kB" | awk -F " " '{print $2}'`
available=`echo $meminfo | grep -o "MemAvailable: \+[0-9]\+ kB" | awk -F " " '{print $2}'`
echo "Memory:Total="$total",Available="$available

instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
instance_name=`aws ec2 describe-tags --filters Name=resource-id,Values=$instance_id Name=key,Values=Name --query Tags[].Value --output text`
echo "Meta:InstanceID=$instance_id,InstanceName="\""$instance_name"\"""

unit="Kilobytes"
namespace="Ec2-MemUsage"
dimensions="Dimensions=[{Name=InstanceName,Value="\""$instance_name"\""},{Name=InstanceID,Value="$instance_id"}]"

aws cloudwatch put-metric-data --metric-data \
"MetricName=Total,$dimensions,Value=$total,Unit=$unit" \
"MetricName=Available,$dimensions,Value=$available,Unit=$unit"
--namespace $namespace
