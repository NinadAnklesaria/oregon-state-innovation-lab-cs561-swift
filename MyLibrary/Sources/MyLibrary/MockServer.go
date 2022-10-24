package main

import (
  "net/http"
  "github.com/gin-gonic/gin"
)

func main() {
  r := gin.Default()
  r.GET("/data/2.5/weather", func(c *gin.Context) {
    jsonData := []byte(`{"coord":{"lon":-123.262,"lat":44.5646},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"base":"stations","main":{"temp":302,"feels_like":301.29,"temp_min":300.5,"temp_max":303.74,"pressure":1011,"humidity":36},"visibility":10000,"wind":{"speed":5.14,"deg":30},"clouds":{"all":0},"dt":1664665941,"sys":{"type":2,"id":2005452,"country":"US","sunrise":1664633455,"sunset":1664675654},"timezone":-25200,"id":5720727,"name":"Corvallis","cod":200}`)
    //c.JSON(http.StatusOK, gin.H{"coord":{"lon":-123.262,"lat":44.5646},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}],"base":"stations","main":{"temp":302,"feels_like":301.29,"temp_min":300.5,"temp_max":303.74,"pressure":1011,"humidity":36},"visibility":10000,"wind":{"speed":5.14,"deg":30},"clouds":{"all":0},"dt":1664665941,"sys":{"type":2,"id":2005452,"country":"US","sunrise":1664633455,"sunset":1664675654},"timezone":-25200,"id":5720727,"name":"Corvallis","cod":200})
    c.Data(http.StatusOK, "application/json", jsonData)
  })
  r.Run()
}
