# API Documentation for E-Commerce App

## Introduction
Welcome to the API documentation for E-Commerce application built with Ruby on Rails. This API enables seamless integration with our platform, allowing developers to interact with users, products, orders, categories, companies, and review data.

`Base URL: https://ruby-broker-app.onrender.com`

## Authentication
The API uses token-based authentication.
Users must sign up and obtain an API key to access protected endpoints.


## Endpoints

## User Management


### Sign Up

- Endpoint: /auth/signup
- Method: POST
#### Parameters:
- full name (string, required): User's full name.
- address (string, required): User's Address.
- email (string, required): User's email.
- password (string, required): User's password.
- role (string, required): User's role (buyer or seller).

### Sign In

- Endpoint: /auth/signin
- Method: POST
#### Parameters:
- email (string, required): User's email.
- password (string, required): User's password.


## Product Management

### Get All Products

- Endpoint: /products
- Method: GET
- Authentication: Required


### Get Product by ID

- Endpoint: /products/:id
- Method: GET
- Authentication: Required

***Request*** 
`Base URL/products/:id`

***Response*** 
``` {
  "id": 1,
  "category_id": 5,
  "company_id": 4,
  "name": "Ergonomic Marble Shoes",
  "price": 51.65,
  "description": "Id libero magnam. Voluptas quas iusto. Voluptate rerum quidem.",
  "img": "https://robohash.org/iurecupiditateet.png?size=300x300&set=set1",
  "created_at": "2023-08-14T12:30:52.175Z",
  "updated_at": "2023-08-14T12:30:52.175Z",
  "company": {
    "id": 4,
    "name": "Hermiston and Sons",
    "created_at": "2023-08-14T12:30:51.778Z",
    "updated_at": "2023-08-14T12:30:51.778Z"
  },
  "category": {
    "id": 5,
    "name": "Pets",
    "created_at": "2023-08-14T12:30:51.895Z",
    "updated_at": "2023-08-14T12:30:51.895Z"
  },
  "orders": [
    {
      "id": 26,
      "product_id": 1,
      "user_id": 25,
      "created_at": "2023-08-14T12:30:52.832Z",
      "updated_at": "2023-08-14T12:30:52.832Z",
      "company_id": 1,
      "quantity": 0,
      "price": "33.29",
      "product_name": "Fantastic Copper Bench"
    }
  ]
}
```

### Add a Product

- Endpoint: /products
- Method: POST
#### Parameters:
- name (string, required): Product name.
- description (string, required): Product description.
- price (float, required): Product price.
- category_id (big integer, required): ID of the product's category.
- company_id (big integer, required): ID of the product's category.
- image  (string, required): Product's image.
- Authentication: Required for sellers


## Order Management

#### Place an Order

- Endpoint: /orders
- Method: POST
- Authentication: Required
#### Parameters:
- product_id (integer, required): ID of the product to order.
- quantity (integer, required): Quantity of the product.
- price (float, required): Product price.
- company_id (big integer, required): ID of the product's category


### Get Orders for a User
- Endpoint: /orders/:user_id
- Method: GET
- Authentication: Required


## Category Management

### Get All Categories

- Endpoint: /categories
- Method: GET
- Authentication: Not required

### Get Category by ID

- Endpoint: /api/categories/:id
- Method: GET
- Authentication: Not required


## Company Information

### Get Company Information

- Endpoint: /companies
- Method: GET
- Authentication: Not required


## Review Management

### Add a Review

- Endpoint: /products/:product_id/reviews
- Method: POST

#### Parameters:
- product_id (integer, required): ID of the reviewed product.
- user_id (integer, required): ID of the user adding the review.
- rating (integer, required): Rating (1-5) given by the user.
- comment (string, optional): Additional comments.
- Authentication: Required


### Get Reviews for a Product

- Endpoint: /reviews/product/:product_id
- Method: GET
- Authentication: Not required


## Error Handling

The API follows RESTful principles for error responses.
Standard HTTP status codes are used, along with a JSON response providing details on the error.


## Conclusion

This API documentation serves as a comprehensive guide for developers looking to integrate with our E-Commerce application. For further assistance or inquiries, please contact our team.
