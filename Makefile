APP=golang-gin-server
PROJECT=correctify-dev
REGION=europe-west3
REPOSITORY=${REGION}-docker.pkg.dev
IMAGE_NAME=${REPOSITORY}/${PROJECT}/playground/${APP}

build:
	@docker build -t ${IMAGE_NAME} -f ./Dockerfile .
login:
	@gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://${REPOSITORY}
push:
	@make login
	@docker push ${IMAGE_NAME}

deploy:
	@gcloud run services update --image ${IMAGE_NAME} --region ${REGION} golang-gin-server