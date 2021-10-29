# flyway-docker

```
docker ps -aq
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
```

```sh
docker build -t azure-sql-edge .
docker run -d -p 1433:1433 --name azure-sql-edge-container azure-sql-edge
docker inspect azure-sql-edge-container  | grep '"IPAddress"' | head -n 1
docker run --rm flyway/flyway:arm64 -url="jdbc:sqlserver://172.17.0.2:1433;databaseName=Payroll" -user=sa -password=Passw0rd baseline
docker run --rm -v ~/Developer/flyway-docker/db:/flyway/sql flyway/flyway:arm64 -url='jdbc:sqlserver://172.17.0.2;databasename=Payroll' -user=sa -password=Passw0rd migrate
```