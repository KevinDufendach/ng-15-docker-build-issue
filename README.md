# NgSandbox15

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 15.2.5.

## Docker Build Issue

This application demonstrates an issue with a Docker build stalling. To reproduce, run the command:

```
docker build .
```

The build will hang at the `RUN npm run build` step.

### Workaround
As a workaround, go to the `angular.json` file and change the `"analytics"` line to `false` 

```json
...
"cli": {
  "analytics": false,
  },
...
```

Problem and fix referenced here: https://stackoverflow.com/questions/75981611/how-do-i-fix-docker-getting-stuck-at-run-npm-run-build-with-angular-15/75999756#75999756
