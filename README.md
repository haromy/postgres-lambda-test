# information :
this is example for serverless framework, using postgres and deploy to multiple lambda for each function


## example db
example db for postgres on root directory with name `example.sql`
you can restore to your database.


## running local

1. create `env.json`
example :
```
{
  "AWS_LAMBDA_REGION": "ap-southeast-1",
  "AWS_LAMBDA_EXECUTION_ROLE": "arn:aws:iam::123456789:role/DevTeamLambdaExecutionRole",
  "POSTGRES_DB_NAME": "xendit",
  "POSTGRES_DB_USER": "fariz",
  "POSTGRES_DB_PASS": "123456",
  "POSTGRES_DB_HOST": "localhost",
  "POSTGRES_DB_PORT": "5432"
}
```
2. execute `npm run start`


## deployment to staging / uat / prod
for security reason, dont save env.json in repositories

1. save `env.json` in S3 bucket, you can naming by stage env, example : `env.dev.json`, `env.stage.json`, `env.live.json`
2. on CI/CD, execute script on below
```
# please change profile with your profile name in AWS
- aws s3 cp s3://path-url-s3/env.dev.json ./env.json --profile yourprofile
- npm install
- npm run deploy-dev
```
3. change script in `package.json` for `profile example` with your AWS profile.
```
"deploy-dev": "sls deploy --aws-profile example -v --stage dev",
"deploy-staging": "sls deploy --aws-profile example -v --stage staging",
"deploy-live": "sls deploy --aws-profile example -v --stage live"
```
4. then run your CI/CD.