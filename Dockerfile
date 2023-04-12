FROM node:18-alpine3.16 as builder

# Copy dependency definitions
COPY package.json package-lock.json ./

# disabling ssl for npm for Dev or if you are behind proxy
RUN npm set strict-ssl false

## installing and Storing node modules on a separate layer will prevent unnecessary npm installs at each build
RUN npm ci && mkdir /app && mv ./node_modules ./app

# Change directory so that our commands run inside this new directory
WORKDIR /app

# Get all the code needed to run the app
COPY . /app/

# Build the application
RUN npm run build

RUN node -v

FROM nginx:1.17-alpine
## From 'builder' copy published folder
COPY --from=builder /app/dist /usr/share/nginx/html

COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose the port the app runs in
EXPOSE 4000

CMD ["nginx", "-g", "daemon off;"]
