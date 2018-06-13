
h1. Simple HD Usage Cloudwatch Events

h2. Pre-requisites

- AWS User (with a cloudwatch-metrics policy)
- AWS CLI

h2. CloudWatch Metrics Policy
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "cloudwatch:PutMetricData",
                "ec2:DescribeTags"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
```

h2. Setting the AWS CLI credentials
`aws configure`

Example:
```
AWS Access Key ID [****************ABCD]:
AWS Secret Access Key [****************1234]:
Default region name [eu-west-1]:
Default output format [json]:
```

h2. Installation
```git
mkdir -p aws/cloudwatch-events
cd aws/cloudwatch-events
git clone ssh://username@domainname.com/cloudwatch-events.git .
```

```install
chmod +x install.sh
sudo ./install.sh
```

h2. Test Installation

`./put-disk-space.sh`

h2. Other options

https://www.howtoforge.com/tutorial/how-to-monitor-disk-space-with-cloudwatch/

