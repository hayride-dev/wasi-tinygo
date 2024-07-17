//go:build !wasip1

package main

import (
	"fmt"
	"io"
	"net/http"

	"github.com/hayride-dev/wasi/http/transport"
)

func main() {
	client := &http.Client{
		Transport: transport.NewWasiRoundTripper(),
	}

	req, err := http.NewRequest("GET", "https://postman-echo.com/get", nil)
	if err != nil {
		fmt.Println(err)
		return
	}
	req.Header.Set("User-Agent", "wasi-http-client")
	resp, err := client.Do(req)
	if err != nil {
		fmt.Println(err)
		return
	}

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println("response:", string(body))
	fmt.Println("status:", resp.Status)
}
