package main

import (
	"log"
	"net/http"
)

func homePage(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "./static/home.html")
}

func contactPage(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "./static/contact.html")
}

func coursePage(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "./static/courses.html")
}

func aboutPage(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "./static/about.html")
}

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("GET /home", homePage)
	mux.HandleFunc("GET /contact", contactPage)
	mux.HandleFunc("GET /courses", coursePage)
	mux.HandleFunc("GET /about", aboutPage)
	log.Fatalln(http.ListenAndServe("0.0.0.0:80", mux))
}
