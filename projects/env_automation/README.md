# Deploying NetworkStack with Cloudformation

As I had already

## Check Your AWS Account

```sh
aws sts get-caller-identity
```

## Run Deploy Script

```sh
cd projects/env_automation
chmod u+x ./bin/deploy
./bin/deploy
```

## Troubleshooting

I am using a Windows machine with WSL2. When trying to run the script I received the following error.

```terminal
./bin/deploy
-bash: ./bin/deploy: cannot execute: required file not found
```

To resolve this I ran `dos2unix` to convert the files line endings to Unix format.

```terminal
sudo apt install dos2unix
dos2unix bin/deploy
dos2unix: converting file bin/deploy to Unix format...
```
