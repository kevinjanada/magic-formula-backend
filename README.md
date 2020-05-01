# Magic Formula

## Install Migration Tool
```
$ go get -u -d github.com/golang-migrate/migrate/v4/cmd/migrate  
$ cd $GOPATH/src/github.com/golang-migrate/migrate/cmd/migrate  
$ git checkout $TAG  # e.g. v4.1.0
$ go build -tags 'postgres' -ldflags="-X main.Version=$(git describe --tags)" -o $GOPATH/bin/migrate $GOPATH/src/github.com/golang-migrate/migrate/cmd/migrate
```