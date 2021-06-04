multibranchPipelineJob('test-pipeline') {
  branchSources {
    branchSource{
      source {
        git {
          remote('https://github.com/zhan9san/test-pipeline')
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
}
