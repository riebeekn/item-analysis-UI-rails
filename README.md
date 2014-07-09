# Item Analysis UI - Rails

A very simple throw-away UI for interacting with the [Item analysis worker](https://github.com/riebeekn/item-analysis-worker) app.

## Installation (local)
* Run the setup-local-dbs script, changing the database user / names prior to running the script if desired:
```
$ ./setup-local-dbs
```
* Update /config/database.yml.
* Run bundle install.
* Copy /config/heroku_env.rb.template to /config/heroku_env.rb and adjust the values accordingly.

## Installation (Heroku)
To install the application on Heroku, run the install script, filling in the appropriate values:

```
$ ./install |app-name| |aws bucket| |aws key| |aws secret|
```

* Descriptions of the parameters that get passed into the script are:
    * app-name - the name of the Heroku application to create.
    * aws bucket - the AWS bucket to upload input files to.
    * aws key - the AWS key for the AWS account in which the bucket lives.
    * aws secret - the AWS secret for the AWS account in which the bucket lives.
* An example of possible valid values for the script would be:

```
$ ./install.sh item-analysis-ui my-aws-bucket my-aws-key my-aws-secret
```
