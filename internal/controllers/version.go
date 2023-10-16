package controllers

import (
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func Version(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"version": os.Getenv("SHORT_SHA")})
}
