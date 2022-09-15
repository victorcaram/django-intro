help:
	@echo 'Available commands:'
	@echo ''
	@echo 'clean ................................ Removes cached files'
	@echo 'help ................................. This screen'
	@echo 'migrate .............................. Runs all migrations'
	@echo 'makemigrations ....................... Runs python3 manage.py makemigrations'
	@echo 'run .................................. Runs the webserver'
	@echo 'test ................................. Runs all tests except integration'
	@echo 'test_all ............................. Runs all tests'
	@echo ''

setup: lock build

collectstatic:
	python3 manage.py collectstatic

clean:
	@find . -name *.pyc -delete
	@find . -name __pycache__ -delete

migrate:
	python3 manage.py migrate --no-input

makemigrations:
	python3 manage.py makemigrations

run:
	python3 manage.py runserver

test:
	pytest -m "not integration"

test_all:
	pytest -vv
