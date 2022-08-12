package routes

import (
	"context"
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/nodev918/go-grpc-api-gateway/pkg/product/pb"
)

type CreateProductRequestBody struct {
	Name string `json:"name"`
	Stock int64 `json:"stock"`
	Price int64 `json:"price"`
}

func CreateProduct(ctx *gin.Context, c pb.ProductServiceClient){
	body := CreateProductRequestBody{}
	
	if err := ctx.BindJSON(&body); err != nil {
		ctx.AbortWithError(http.StatusBadRequest, err)
		return 
	}

	fmt.Printf("\nname: %s",body.Name)
	fmt.Printf("\nstock: %d",body.Stock)	
	fmt.Printf("\nprice: %d\n",body.Price)

	res, err := c.CreateProduct(context.Background(), &pb.CreateProductRequest{
		Name: body.Name,
		Stock: body.Stock,
		Price: body.Price,
	})

	if err != nil {
		ctx.AbortWithError(http.StatusBadGateway, err)
		return 
	}


	ctx.JSON(http.StatusCreated, &res)
}