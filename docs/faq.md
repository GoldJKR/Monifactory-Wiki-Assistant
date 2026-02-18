# FAQ

## Do I need to code?
No. Everything is Markdown. The Docker image builds and serves the site.

## How do I update the site?
Edit Markdown in `docs/`, rebuild the image, redeploy.

## Can I preview locally without installing Python?
Yes. Use the Docker one-liner in the Setup page.

## What port does the container use?
Default NGINX port 80. In compose we map it to host port 8080.