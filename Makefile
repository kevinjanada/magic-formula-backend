#!/bin/bash

#!make
include .env
export $(shell sed 's/=.*//' .env)

test:
	@echo 'postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}?sslmode=disable' -path db/migrations up
migrate:
	@${GOPATH}/migrate -database 'postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}?sslmode=disable' -path db/migrations up
migrate-force:
	@${GOPATH}/migrate -database 'postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}?sslmode=disable' -path db/migrations force ${VERSION}
migrate-rollback:
	@${GOPATH}/migrate -database 'postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}?sslmode=disable' -path db/migrations down