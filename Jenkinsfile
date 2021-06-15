pipeline{
	agent any
	tools {
		terraform 'terraform-14'
	}
	stages{
		stage('Terraform Init'){
			steps{
				sh label: '', script: 'terraform init'
			}
		}
		stage('Terraform plan'){
			steps{
				sh label: '', script: 'terraform plan'
			}
		}
		stage('Terraform apply'){
			steps{
				sh label: '', script: 'terraform apply --auto-approve'
			}
		}
	}
}