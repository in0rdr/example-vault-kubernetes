FROM hashicorp/envconsul:alpine
RUN apk --no-cache add curl bash jq
COPY "./docker-entrypoint.sh" "/bin/docker-entrypoint.sh"
RUN chmod +x "/bin/docker-entrypoint.sh"
ENTRYPOINT ["/bin/docker-entrypoint.sh"]