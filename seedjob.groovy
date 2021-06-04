job('Job_DSL_Seed') {
  scm {
    git {
      remote {
        url 'https://github.com/zhan9san/Jenkins-in-Docker.git'
      }
    }
  }
  steps {
    jobDsl {
      targets 'jobs/**/*.groovy'
    }
  }
}
