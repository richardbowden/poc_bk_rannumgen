package main

import (
	"crypto/rand"
	"encoding/base64"
	"fmt"
	"github.com/ant0ine/go-json-rest/rest"
	"log"
	"net/http"
	"os"
)

const servePortEnv string = "RANNUM_PORT"
const defaultServePort string = "9090"

func genRndNumber(w rest.ResponseWriter, r *rest.Request) {
	c := 10
	b := make([]byte, c)
	rand.Read(b)
	rndNum := base64.URLEncoding.EncodeToString(b)

	d := struct {
		RndNum string
	}{
		rndNum,
	}

	w.WriteJson(d)
	return
}

func main() {

	servePort := os.Getenv(servePortEnv)

	if servePort == "" {
		servePort = defaultServePort
	}

	api := rest.NewApi()
	api.Use(rest.DefaultDevStack...)

	router, err := rest.MakeRouter(
		rest.Get("/rnd", genRndNumber),
	)

	if err != nil {
		log.Fatal(err)
	}

	api.SetApp(router)
	bindPort := fmt.Sprintf(":%s", servePort)

	log.Printf("server listening on %s", bindPort)

	log.Fatal(http.ListenAndServe(bindPort, api.MakeHandler()))
}
