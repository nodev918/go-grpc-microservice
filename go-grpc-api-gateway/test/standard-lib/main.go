// package main

// import (
// 	"fmt"

// 	"github.com/gin-gonic/gin"
// )

// func main() {
// 	fmt.Print("hello")
// 	router := gin.Default()
// 	router.GET("/ping", func(c *gin.Context) {
// 		c.JSON(200, gin.H{
// 			"message": "pong",
// 		})
// 	})

// 	router.GET("/user/:name/*nick", func(c *gin.Context){
// 		name := c.Param("name")
// 		nick := c.Param("nick")
// 		fmt.Print("name is: ",name,"\n")
// 		fmt.Print("nick is: ",nick,"\n")
// 	})
// 	router.Run()
// }

// package main

// import (
// 	"fmt"
// 	"net/http"
// )

// func log(target string){
// 	fmt.Println(target)
// }

// func hello(w http.ResponseWriter,req *http.Request){
// 	fmt.Fprintf(w,"hello\n")
// 	fmt.Printf("tyoeof req is: %T\n",req)
// 	log("test log")
// }

// func headers(w http.ResponseWriter, req *http.Request){
// 	for name, headers := range req.Header{
// 		for _, h := range headers {
// 			fmt.Fprintf(w,"%v: %v\n",name,h)
// 		}
// 	}
// }

// func main(){
// 	http.HandleFunc("/hello", hello)
// 	http.HandleFunc("/headers",headers)

// 	http.ListenAndServe(":8090",nil)
// }

// package main

// import (
// 	"fmt"
// 	"net/http"
// 	"time"
// )

// func hello(w http.ResponseWriter, req *http.Request) {

//     ctx := req.Context()
//     fmt.Println("server: hello handler started")
//     defer fmt.Println("server: hello handler ended")

//     select {
//     case <-time.After(3 * time.Second):
//         fmt.Fprintf(w, "hello\n")
//     case <-ctx.Done():
// 		fmt.Println("test")
//         err := ctx.Err()
//         fmt.Println("server:", err)
//         internalError := http.StatusInternalServerError
//         http.Error(w, err.Error(), internalError)
//     }
// }

// func main() {

//     http.HandleFunc("/hello", hello)
//     http.ListenAndServe(":8090", nil)
// }

package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type UserInfo struct {
	Name string `json:"name"`
	Age int `json:"age"`
}

func main(){
	router := mux.NewRouter()

	router.HandleFunc("/api/{name}",func(w http.ResponseWriter,r *http.Request){
		
		vars := mux.Vars(r)

		u := &UserInfo{
			Name: vars["name"],
			Age: 18,
		}
		b, err := json.Marshal(u)
		if err != nil {
			log.Println(err)
			return
		}
		w.Header().Set("Content-Type","application/json;charset=UTF-8")
		w.WriteHeader(http.StatusOK)
		w.Write(b)
	})
	
	log.Fatal(http.ListenAndServe(":8088", router))
}