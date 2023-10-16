package main

import (
	"fmt"

	"golang-gin-server/internal/controllers"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	var app = gin.Default()
	var port = os.Getenv("PORT")

	if len(port) == 0 {
		port = "8080"
	}

	var address = fmt.Sprintf(":%s", port)

	app.GET("/api/v1/ping", controllers.Ping)
	app.GET("/api/v1/version", controllers.Version)

	app.Run(address)
}
