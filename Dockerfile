# Virtual machine with default linux directories
FROM --platform=$BUILDPLATFORM oven/bun:1.2.17-alpine

# cd /app
WORKDIR /app

# Copy app files to ./app - We are using WORKDIR so we can use ./ instead of /app
COPY package.json .

RUN bun install

COPY . .

RUN bun run test

RUN rm -rf tests

# Remove all node_modules, we do not need jest or any other dev dependencies in production. We just need the essential files to build the image.
RUN rm -rf node_modules

# Install only production dependencies (essential dependencies to run the image)
RUN bun install --prod

# Command to run the app
CMD ["bun", "index.ts"]