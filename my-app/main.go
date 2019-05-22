package main

import (
	"fmt"
	"net/http"
	log "github.com/sirupsen/logrus"
	"github.com/gorilla/mux"
)

func main() {
	r := newRouter()
	r.HandleFunc("/", r.handler)
	log.Info("starting")
	log.Fatal(http.ListenAndServe(":8080", r))
}

type Router struct {
	*mux.Router
}

func newRouter() *Router {
	r := mux.NewRouter()
	return &Router{r}
}

func (r *Router) handler(w http.ResponseWriter, req *http.Request) {
	log.Info("Starting app")
	fmt.Fprintf(w, "hello")
}
