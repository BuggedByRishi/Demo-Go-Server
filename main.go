package main

import (
	"log"
	"net/http"
)

func Drake(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("If you are reading it's too late!"))
}

func home(w http.ResponseWriter, r *http.Request) {

	if r.URL.Path != "/" {
		http.NotFound(w, r)
		return
	}

	w.Write([]byte("Hello from Snippetbox"))
}

// Add a showSnippet handler function.
func showSnippet(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Display a specific snippet..."))
}

// Add a createSnippet handler function.
func createSnippet(w http.ResponseWriter, r *http.Request) {

	if r.Method != http.MethodPost {
		w.WriteHeader(405)
		w.Write([]byte("Method not allowed"))
		return
	}

	w.Write([]byte("Create a new snippet..."))
}
func main() {
	// Register the two new handler functions and corresponding URL patterns with
	// the servemux, in exactly the same way that we did before.
	mux := http.NewServeMux()
	mux.HandleFunc("/", home)
	mux.HandleFunc("Drake.example.org/", Drake)
	mux.HandleFunc("/snippet", showSnippet)
	mux.HandleFunc("/snippet/create", createSnippet)

	log.Println("Starting server on :4000")
	err := http.ListenAndServe(":4000", mux)
	log.Fatal(err)
}
