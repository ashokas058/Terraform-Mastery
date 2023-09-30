# Terraform-Mastery
To run this project <br>
-------------------------<br>
cd  Project-1<br>
#update the vpc_variables.tf files according to your project profile <br>
To create infrastructure run <br>
 
 terraform apply -var-file="env/prod-env/prod-env.tfvars" <br>

 To destroy<br>
 terraform destroy -var-file="env/prod-env/prod-env.tfvars"

