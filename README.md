
# Simple Cloudwatch Events

## Pre-requisites

- AWS User or AWS Role (with a cloudwatch-metrics policy)
- AWS CLI

## CloudWatch Metrics Policy
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

## Setting the AWS CLI credentials on the Instance
`aws configure`

### Example where the instance has a User:
```
AWS Access Key ID [****************ABCD]:
AWS Secret Access Key [****************1234]:
Default region name [eu-west-1]:
Default output format [json]:
```

### Example where the instance has an IAM Role:
```
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [eu-west-1]:
Default output format [json]:
```
For IAM Roles, only the region is required.  Leave the Access Key and Secret Access Key blank

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
`./put-meminfo.sh`

