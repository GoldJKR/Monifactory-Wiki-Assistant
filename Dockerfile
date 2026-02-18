# Stage 1: build the static site with MkDocs Material
FROM python:3.12-slim AS builder
WORKDIR /work

# Copy MkDocs config and docs into the image
COPY mkdocs.yml /work/mkdocs.yml
COPY docs /work/docs

# Install MkDocs Material (pulls mkdocs too)
RUN pip install --no-cache-dir mkdocs-material

# Build the site to /out
RUN mkdocs build --strict --site-dir /out

# Stage 2: serve with NGINX
FROM nginx:alpine AS runtime
# Optional: custom nginx config; comment this line if you keep the default
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built site
COPY --from=builder /out /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]