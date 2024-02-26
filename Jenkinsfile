pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   agent  any
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/omkar04/Terraform_automation.git"
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                bat 'dir'
                bat 'cd terraform/'
                bat 'terraform init'
                bat 'cd terraform/'
                bat 'terraform plan -out tfplan'
                bat 'cd terraform/'
                bat 'terraform show -no-color tfplan >> tfplan.txt && type tfplan.txt ' // | more >> output.txt'
            }
        }
        stage('push') {
            steps {
                bat 'dir'
                bat 'cd terraform/'
                bat 'git add .'
                bat 'git commit -m "Plan file pushed"'
                bat 'git push origin HEAD:aws_automation'
            }
        }
       // stage('Approval') {

            //bat 'echo "approved"'
           //when {
             //  not {
               //    equals expected: true, actual: params.autoApprove
           //    }
           //}

          // steps {
            //   script {
                    //def plan =   bat 'more terraform\\tfplan.txt'
                    //input message: "Do you want to apply the plan?",
                    //parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
              // }
           //}
       //}

       // stage('Apply') {
         //   steps {
           //     bat 'echo "apply"'
               // sh "pwd;cd terraform/ ; terraform apply -input=false tfplan"
                // bat 'dir'
                //bat 'cd terraform/'
                // bat 'terraform apply -input=false tfplan'
           // }
        //}
    }

  }
