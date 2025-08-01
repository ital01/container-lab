FROM oven/bun:latest
WORKDIR /app
COPY package.json ./
RUN bun install
COPY app.ts ./
EXPOSE 3000
CMD ["bun", "app.ts"]
