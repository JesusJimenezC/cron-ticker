FROM oven/bun:canary-alpine AS deps
WORKDIR /app
COPY package.json .
RUN bun install

FROM oven/bun:canary-alpine AS testbuilder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN bun run test
RUN rm -rf tests && rm -rf node_modules
# If we are creating a docker image for a project like React, Nest, Next, Astro, etc. We need to define a builder command like `RUN bun run build`

FROM oven/bun:canary-alpine AS prod-deps
WORKDIR /app
COPY --from=testbuilder /app/package.json .
RUN bun install --prod

FROM oven/bun:canary-alpine AS runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY index.ts .
COPY tasks/ ./tasks
CMD ["bun", "index.ts"]