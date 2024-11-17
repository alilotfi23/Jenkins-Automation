# Jenkins-Automation
![Diagram](https://github.com/alilotfi23/Jenkins-Automation/assets/91953142/64090543-b28f-4e3c-b3e6-a11380e4f1f7)
## This project will Create vm on Vsphere and install and config Jenkins with ansible and jcasc

## Asnible
Define the server on which you want to install Jenkins it in the playbook.yml
```shell
hosts: your_ubuntu_server
```
## Terrform

Install provider

```shell
terraform init
```

The Terraform plan command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure

```shell
terraform plan
```

Deploy vm on Vsphere

```shell
terraform apply
``` 
## jenkins.yaml file which contains jcasc configuration has a job section that clones all this project
```shell
jobs:
  - script: >
      freeStyleJob('MyGitHubJob') {
        description('A job that clones a GitHub repository')
        scm {
          git {
            remote {
              url('https://github.com/alilotfi23/Jenkins-Automation.git')
              credentials('your-github-credentials-id')
            }
            branches('*/main')
          }
        }
      }
```
