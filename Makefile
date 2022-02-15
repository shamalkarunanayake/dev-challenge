version ?= 0.0.1-pre.0

ci: clean build sql run lint package

clean:
	rm -rf logs/ stage/ */bin */*/bin */*/obj obj

sql:
	docker run \
	   -e 'ACCEPT_EULA=Y' \
	   -e 'MSSQL_SA_PASSWORD=changeme' \
	   -p 1433:1433 \
	   --name sql \
	   -d mcr.microsoft.com/mssql/server:2019-latest
run:
	dotnet run --project src/DevOpsChallenge.SalesApi & echo $?

build:
	dotnet build

release:
	rtk release

publish:
	gh release create $(version) --title $(version) --notes "" || echo "Release $(version) has been created on GitHub"
	gh release upload $(version) stage/aem-aws-stack-builder-$(version).tar.gz
lint:
	dotnet format -v diagnostic ./ 


.PHONY: ci clean sql run build package release publish lint scan
