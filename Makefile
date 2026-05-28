IMAGE_NAME=angular-base
CONTAINER_NAME=angular-base-container
PORT=8800

install:
	docker build -t $(IMAGE_NAME) .

start:
	docker run -d \
		--name $(CONTAINER_NAME) \
		-p $(PORT):8800 \
		$(IMAGE_NAME)

stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

restart: stop start

logs:
	docker logs -f $(CONTAINER_NAME)

clean:
	docker rm -f $(CONTAINER_NAME) || true
	docker rmi $(IMAGE_NAME) || true