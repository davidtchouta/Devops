# Jenkins Setup and Configuration Guide

## Install Jenkins

### Windows
1. Download Jenkins from [the official Jenkins website](https://www.jenkins.io/download/).
2. Run the installer and follow the setup wizard.
3. Once installed, Jenkins will start automatically. Access Jenkins at `http://localhost:8080`.

### macOS
1. Install Homebrew if you don't have it: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Install Jenkins with Homebrew: `brew install jenkins-lts`
3. Start Jenkins: `brew services start jenkins-lts`
4. Access Jenkins at `http://localhost:8080`.

### Linux (Ubuntu/Debian)
1. Update your package index: `sudo apt update`
2. Install Java (Jenkins requires Java 11 or newer): `sudo apt install openjdk-11-jdk`
3. Add the Jenkins Debian repository:
    ```bash
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    ```
4. Install Jenkins: `sudo apt update && sudo apt install jenkins`
5. Start Jenkins: `sudo systemctl start jenkins`
6. Access Jenkins at `http://localhost:8080`.

### Linux (Red Hat/CentOS)
1. Install Java (Jenkins requires Java 11 or newer): `sudo yum install java-11-openjdk`
2. Add the Jenkins repository:
    ```bash
    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    ```
3. Install Jenkins: `sudo yum install jenkins`
4. Start Jenkins: `sudo systemctl start jenkins`
5. Access Jenkins at `http://localhost:8080`.

## Create and Configure Your First Job

### Build a Freestyle Project
1. Open Jenkins in your web browser (`http://localhost:8080`).
2. Click on "New Item" from the left-hand menu.
3. Enter a name for your project and select "Freestyle project".
4. Click "OK".
5. Configure your project settings (e.g., Source Code Management, Build Triggers, Build Environment, and Build Steps).
6. Click "Save" to create your freestyle project.
7. To run the job, click "Build Now" from the project page.

### Build a Pipeline Running on Build Agents
1. Open Jenkins in your web browser (`http://localhost:8080`).
2. Click on "New Item" from the left-hand menu.
3. Enter a name for your project and select "Pipeline".
4. Click "OK".
5. Scroll down to the "Pipeline" section.
6. Define your pipeline script (either Declarative Pipeline or Scripted Pipeline).
7. Use `agent` directive to specify where the build should run.
    ```groovy
    pipeline {
        agent { label 'your-agent-label' }
        stages {
            stage('Build') {
                steps {
                    echo 'Building..'
                    // Your build steps here
                }
            }
        }
    }
    ```
8. Click "Save" to create your pipeline project.
9. To run the job, click "Build Now" from the project page.

## Configure Using Git, Docker, SSH, etc.

### Configure Git
1. Install the Git plugin if it's not already installed: Manage Jenkins > Manage Plugins > Available > Git Plugin > Install.
2. In your job configuration, go to the "Source Code Management" section.
3. Select "Git" and enter your repository URL and credentials.

### Configure Docker
1. Install the Docker plugin if it's not already installed: Manage Jenkins > Manage Plugins > Available > Docker Plugin > Install.
2. In your job configuration, add a build step to run a Docker container.
    ```groovy
    steps {
        script {
            docker.image('your-docker-image').inside {
                // Commands to run inside Docker container
            }
        }
    }
    ```

### Configure SSH
1. Install the SSH plugin if it's not already installed: Manage Jenkins > Manage Plugins > Available > SSH Plugin > Install.
2. In Manage Jenkins > Configure System, scroll down to the "SSH remote hosts" section and add your SSH server details.
3. In your job configuration, add a build step to execute a shell command on the remote host.

By following these steps, you can install Jenkins on your operating system, create and configure your first Jenkins job, and set up integrations with Git, Docker, and SSH.
