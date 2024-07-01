pipeline {
    agent none
    
    triggers {
        pollSCM('* * * * *')
    }
    
    stages {
        stage('Build') {
            agent none
            }
            steps {
                script {
                    echo "Building.."
                    sh '''
                    cd myapp
                    pip install -r requirements.txt
                    '''
                }
            }
        }
        
        stage('Test') {
            agent none
            steps {
                script {
                    echo "Testing.."
                    sh '''
                    cd myapp
                    python3 hello.py
                    python3 hello.py --name=Brad
                    '''
                }
            }
        }
        
        stage('Deliver') {
            agent none
            steps {
                script {
                    echo 'Deliver....'
                    sh '''
                    echo "doing delivery stuff.."
                    '''
                }
            }
        }
    }
}
