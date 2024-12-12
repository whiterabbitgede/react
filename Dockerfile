# Use the official Node.js image as the base image
#node small size 132 Mb
FROM node:20-alpine 

# Set the working directory inside the container
WORKDIR /app

ENV NODE_ENV production

# Copy the package.json and package-lock.json first (for caching)
COPY package*.json ./

# Copy the rest of the application code
COPY . .

# Install dependencies
RUN npm install

# Build the React app for production
RUN npm run build

# Install a lightweight web server to serve the React app
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Command to run the web server
CMD ["serve", "-s", "build", "-l", "3000"]



# docker build -t react-node-20:0.0.1 .


