package order

import (
	"github.com/gin-gonic/gin"
	"github.com/nodev918/go-grpc-api-gateway/pkg/auth"
	"github.com/nodev918/go-grpc-api-gateway/pkg/config"
	"github.com/nodev918/go-grpc-api-gateway/pkg/order/routes"
)

func RegisterRoutes(r *gin.Engine, c *config.Config, authSvc *auth.ServiceClient){
	a := auth.InitAuthMiddleware(authSvc)

	svc := &ServiceClient{
		Client: InitServiceClient(c),
	}

	routes := r.Group("/order")
	routes.Use(a.AuthRequired)
	routes.POST("/",svc.CreateOrder)	//CreateOrder裡面參數怪怪的
}

func (svc *ServiceClient) CreateOrder(ctx *gin.Context){
	routes.CreateOrder(ctx, svc.Client)
}