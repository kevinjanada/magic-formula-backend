package main

import (
	"fmt"
	"log"
	"os"

	"github.com/kevinjanada/magic-formula-backend/handlers"

	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	"github.com/joho/godotenv"
)

func initEnv() {
	if err := godotenv.Load(); err != nil {
		log.Print(err)
	}
}

func app() {
	r := gin.Default()
	r.GET("/magic-formula", handlers.MagicFormulaHandler)
	r.Run(":8000")
}

func connectDB() {
	postgresHost, _ := os.LookupEnv("POSTGRES_HOST")
	postgresPort, _ := os.LookupEnv("POSTGRES_PORT")
	postgresDB, _ := os.LookupEnv("POSTGRES_DB")
	postgresUser, _ := os.LookupEnv("POSTGRES_USER")
	postgresPassword, _ := os.LookupEnv("POSTGRES_PASSWORD")
	db, err := gorm.Open(
		"postgres",
		fmt.Sprintf(
			"host=%s port=%s user=%s dbname=%s password=%s sslmode=disable",
			postgresHost,
			postgresPort,
			postgresDB,
			postgresUser,
			postgresPassword,
		),
	)
	if err != nil {
		fmt.Println(err)
	}
	defer db.Close()
}

func main() {
	initEnv()
	connectDB()
	app()
}
