multibranchPipelineJob('test-pipeline') {
  branchSources {
    branchSource{
      source {
        git {
          // https://issues.jenkins.io/browse/JENKINS-48571
          id('test-pipeline') // IMPORTANT: use a constant and unique identifier
          remote('https://github.com/zhan9san/test-pipeline')
          traits {
            gitBranchDiscovery()
          }
        }
      }
      strategy {
        allBranchesSame {
          props {
            suppressAutomaticTriggering()
          }
        }
      }
    }
  }
  factory {
    workflowBranchProjectFactory {
      scriptPath('kubernetes-plugin/Jenkinsfile')
    }
  }
}
