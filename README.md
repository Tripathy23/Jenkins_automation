# Jenkins_automation
automating to install jenkins server in a new ec2 instance everytime we trigger a pipeline using terraform, ansible, github, python



Project Layout

Jenkins-ec2-automation

Terraform /
        Main.tf file


Aensible/
       Jenkins.yaml
       Hosts.ini ( this should auto generate by python )

Scripts/
       Deploy.py


Github/
	workflows/
		deploy.yml


.env. (ignored in .gitignore)
 	.gitignore
