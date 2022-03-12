# devops-netology
#maks1001280388
#maks uchitsa rabotati s GIT
#y maksa polychaetsa
#vrode rabotaet



# Local .terraform directories
**/.terraform/*
Как я понял будут игнорироваться файлы в дерииктории terraform

# .tfstate files
*.tfstate     что угодго и .tfstate
*.tfstate.*    что угодго и .tfstate. что угодго

# Crash log files
crash.log     crash.log  
crash.*.log   crash.что угодно.log

# Exclude all .tfvars files, which are likely to contain sensitive data, such as
# password, private keys, and other secrets. These should not be part of version
# control as they are data points which are potentially sensitive and subject
# to change depending on the environment.
*.tfvars         что угодно.tfvars
*.tfvars.json    что угодно.tfvars.json

# Ignore override files as they are usually used to override resources locally and so
# are not checked in
override.tf           override.tf
override.tf.json      override.tf.json
*_override.tf         что угодно*_override.tf
*_override.tf.json    что угодно_override.tf.json

# Include override files you do wish to add to version control using negated pattern
# !example_override.tf

# Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
# example: *tfplan*

# Ignore CLI configuration files
.terraformrc      игнорирование файлов с расширением .terraformrc
terraform.rc      игнорирование файла terraform.rc

