FROM node as builder
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json", "tsconfig.json", ".env", "./"]
RUN [ "npm", "install" ]
COPY [ "src/", "./src/" ]
RUN [ "npm", "run", "build" ]
RUN ["/bin/bash", "-c", "find . ! -name dist ! -name node_modules ! -name .env -maxdepth 1 -mindepth 1 -exec rm -rf {} \\;"]

FROM node:alpine
LABEL name=min-ci
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app ./
ENTRYPOINT [ "node", "./dist/src/index.js" ]

ARG PORT 3000
EXPOSE $PORT