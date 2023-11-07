package main

import "time"

type Server struct {
	host    string
	port    int
	timeout time.Duration
}

type ServerOption func(*Server)

func WithHost(host string) ServerOption {
	return func(s *Server) {
		s.host = host
	}
}
func WithPort(port int) ServerOption {
	return func(s *Server) {
		s.port = port
	}
}
func WithTimeout(timeout time.Duration) ServerOption {
	return func(s *Server) {
		s.timeout = timeout
	}
}

func NewServer(opts ...ServerOption) *Server {
	server := &Server{}
	for _, opt := range opts {
		opt(server)
	}
	return server
}

func main() {
	s := NewServer(
		WithHost("google.com"),
		WithPort(8080),
		WithTimeout(time.Second*5),
	)

	println(s.host)
}
