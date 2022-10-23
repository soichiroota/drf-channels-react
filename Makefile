docker-build:
	docker-compose build

docker-poetry-update:
	docker-compose run --rm backend poetry update

docker-poetry-install:
	docker-compose run --rm backend poetry install

docker-up:
	docker-compose up

docker-up-build:
	docker-compose up --build

docker-down:
	docker-compose down

docker-db-makemigrations:
	docker-compose exec backend poetry run python manage.py makemigrations

docker-db-migrate:
	docker-compose exec backend poetry run python manage.py migrate

docker-createsuperuser:
	docker-compose exec backend poetry run python manage.py createsuperuser --noinput

docker-test:
	make docker-poetry-install
	docker-compose run --rm backend poetry run python manage.py migrate --settings=config.settings.test
	docker-compose run --rm backend poetry run coverage run --source='.' manage.py test --settings=config.settings.test
	docker-compose run --rm backend poetry run coverage report

docker-lint:
	make docker-poetry-install
	docker-compose run --rm backend poetry run flake8 apiv1 config manage.py
	docker-compose run --rm backend poetry run isort --profile black --check --diff apiv1 config manage.py
	docker-compose run --rm backend poetry run black --check apiv1 config manage.py
	docker-compose run --rm backend poetry run mypy apiv1 config manage.py

docker-format:
	make docker-poetry-install
	docker-compose run --rm backend poetry run isort --profile black apiv1 config manage.py
	docker-compose run --rm backend poetry run black apiv1 config manage.py

docker-check-deploy:
	docker-compose run --rm backend poetry run python manage.py check --deploy --settings=config.settings.production

docker-generateschema:
	make docker-poetry-install
	docker-compose run --rm backend poetry run python manage.py generateschema > docs/openapi-schema.yml

docker-graph-models:
	make docker-poetry-install
	docker-compose run --rm backend poetry run python manage.py graph_models -a -o docs/erd.png

docker-show-urls:
	make docker-poetry-install
	docker-compose run --rm backend poetry run python manage.py show_urls

docker-django-shell:
	docker-compose exec backend poetry run python manage.py shell