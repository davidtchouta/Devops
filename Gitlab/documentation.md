# Steps to Run a Pipeline in GitLab

## To create and run your first pipeline:

1. **Ensure you have runners available to run your jobs.**

   - If you’re using GitLab.com, you can skip this step. GitLab.com provides instance runners for you.

2. **Create a `.gitlab-ci.yml` file at the root of your repository.**

   - This file is where you define the CI/CD jobs.
   - When you commit the file to your repository, the runner runs your jobs. The job results are displayed in a pipeline.

## Ensure you have runners available

In GitLab, runners are agents that run your CI/CD jobs.

### To view available runners:

1. Go to **Settings > CI/CD** and expand **Runners**.
2. As long as you have at least one runner that’s active, with a green circle next to it, you have a runner available to process your jobs.

### If you don’t have a runner:

1. Install GitLab Runner on your local machine.
2. Register the runner for your project. Choose the shell executor.
3. When your CI/CD jobs run, they will run on your local machine.

## Create a `.gitlab-ci.yml` file

Now create a `.gitlab-ci.yml` file. It is a YAML file where you specify instructions for GitLab CI/CD.

### In this file, you define:

- The structure and order of jobs that the runner should execute.
- The decisions the runner should make when specific conditions are encountered.

### To create a `.gitlab-ci.yml` file in your project:

1. On the left sidebar, select **Search or go to** and find your project.
2. Select **Code > Repository**.
3. Above the file list, select the branch you want to commit to. If you’re not sure, leave `master` or `main`. Then select the plus icon () and **New file**:

   **New file**

4. For the Filename, type `.gitlab-ci.yml` and in the larger window, paste this sample code:

   ```yaml
# Job de build
build-job:
  stage: build
  script:
    - echo "Hello, $GITLAB_USER_LOGIN!"

# Job de test
test-job1:
  stage: test
  script:
    - echo "Install Python and run file"
    - apt-get update && apt-get install -y python3 python3-pip python3-venv
    - python3 -m venv venv  # Create a virtual environment 
    - source venv/bin/activate  # Activate virtual environment
    - python --version
    - pip install -r requirements.txt
    - python hello.py
    - python main.py
    - python test_main.py

# Job de déploiement
deploy-prod:
  stage: deploy
  script:
    - echo "This job deploys something from the $CI_COMMIT_BRANCH branch."
  environment: production
```
5. This example shows four jobs: `build-job`, `test-job1`, `test-job2`, and `deploy-prod`. The comments listed in the echo commands are displayed in the UI when you view the jobs. The values for the predefined variables `$GITLAB_USER_LOGIN` and `$CI_COMMIT_BRANCH` are populated when the jobs run.

Select Commit changes.
The pipeline starts and runs the jobs you defined in the .`gitlab-ci.yml` file.