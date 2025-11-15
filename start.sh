#!/usr/bin/env bash
# Start script for Render.com

cd backend
java -Dserver.port=$PORT -jar target/expenseTracker-0.0.1-SNAPSHOT.jar
