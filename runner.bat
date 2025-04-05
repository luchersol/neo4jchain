@echo off

:: Cambia al proyecto de frontend
cd ./front

:: Ejecuta npm start
start cmd /k "npm run dev"

cd ../

:: Iniciar SpringBoot
mvn spring-boot:run 
