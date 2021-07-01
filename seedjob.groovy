job('Job_DSL_Seed') {
  scm {
    git {
      remote {
        url 'https://github.com/zhan9san/Jenkins-Seed-Job.git'
      }
    }
  }
  steps {
    jobDsl {
      removedConfigFilesAction('DELETE')
      removedJobAction('DELETE')
      removedViewAction('DELETE')
      targets 'jobs/**/*.groovy'
    }
  }
}
