ROOT = $(shell git rev-parse --show-toplevel)
DOCKERFILES = $(ROOT)/dockerfiles

include $(ROOT)/makefiles/docker.Makefile

dashboard_nginx-build:
	$(call build_image,archivematica_dashboard_nginx,dockerfiles/dashboard_nginx/Dockerfile)

storage_service_nginx-build:
	$(call build_image,archivematica_storage_service_nginx,dockerfiles/storage_service_nginx/Dockerfile)

clamavd-build:
	$(call build_image,clamavd,dockerfiles/clamavd/Dockerfile)


dashboard_nginx-publish: dashboard_nginx-build
	$(call publish_service,archivematica_dashboard_nginx)

storage_service_nginx-publish: storage_service_nginx-build
	$(call publish_service,archivematica_storage_service_nginx)

clamavd-publish: clamavd-build
	$(call publish_service,clamavd)
