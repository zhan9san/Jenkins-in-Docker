multibranchPipelineJob('test-pipeline') {
  branchSources {
    branchSources{
      source {
        git {
          id('123456789') // IMPORTANT: use a constant and unique identifier
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
