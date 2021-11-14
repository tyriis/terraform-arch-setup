### DOCKER LOGIN
change credential Store to "pass"
#### ~/.docker/config.json
```sh
{
	"credsStore": "pass"
}
```
#### create gpg key if not exists
```sh
gpg --default-new-key-algo rsa4096 --full-generate-key
```

retrueve key id

#### pass init
```sh
pass init <my_pgp_key_id>
```

#### docker login
```sh
docker login
```
