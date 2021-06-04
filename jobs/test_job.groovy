multibranchPipelineJob('test-pipeline') {
  branchSources {
    branchSource{
      source {
        git {
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
