.PHONY: run stop clean
.DEFAULT_GOAL = run

stop:
	docker-compose stop

clean: stop
	docker-compose rm

run:
	docker-compose up -d
	@echo "Grafana: http://127.0.0.1:3000 - admin/admin"
	curl -G http://localhost:8086/query?pretty=true --data-urlencode "db=glances" --data-urlencode "q=SHOW DATABASES"
	@echo "curl -XPOST 'http://localhost:8086/query' --data-urlencode 'q=CREATE DATABASE mydb'"
