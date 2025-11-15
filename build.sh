#!/usr/bin/env bash
# Build script for Render.com

echo "Building React frontend..."
cd frontend
npm install
npm run build

echo "Building Spring Boot backend..."
cd ../backend
mvn clean package -DskipTests

echo "Build complete!"
