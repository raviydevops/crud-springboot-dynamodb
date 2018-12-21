# crud-springboot-dynamodb

Sample Spring Boot app to perform CRUD operations using DynamoDB

## Creating a the dynamodb image

``` bash
docker build -f Dockerfile.dynamodb -t dynamodb:1.0.0 .
```

## Running the dynamodb image

``` bash
$ docker run -d -p 8000:8000 dynamodb:1.0.0

Initializing DynamoDB Local with the following configuration:
Port: 8000
InMemory: false
DbPath:	null
SharedDb: true
shouldDelayTransientStatuses: false
CorsParams: *
```

Use http://localhost:8000/shell to access athe dynamodb console if querying is needed.
</br>Refer to CrudSpringbootDynamodbApplication.java to see how ProductCatalog data store is created in DynamoDB. 

## Creating the crud-springboot image

``` bash
docker build -t crud-springboot:1.0.0 .
```

### Running the crud-springboot image

``` bash
docker run -d -p 8080:8080 --env-file envFilePath crud-springboot:1.0.0
```

Env file should have values for the variables,

``` no-highlight
DYNAMOBD_ENDPOINT_URL=http://localhost:8000/
AWS_ACCESS_KEY_ID=key
AWS_SECRET_ACCESS_KEY=secret
```

### Try the below end-point to successfully retrieve sample data from DynamoDB
```
http://localhost:8080/catalogService/products
```
Content-Type: application/json

### Sample PUT request with a JSON payload. Make sure that you set 'Content-Type' to 'application/json' in the request headers

http://localhost:8080/catalogService/products/update/1ed4cd6a-41db-4192-a7b2-8e88c251b6e9
``` json
    {
        "id": "1ed4cd6a-41db-4192-a7b2-8e88c251b6e9",
        "productName": "Shoes",
        "quantity": 100,
        "inventoryLow": false,
        "price": 95.99,
        "currencyCode": "USD"
    }
```
### Sample POST request with a JSON payload. Make sure that you set 'Content-Type' to 'application/json' in the request headers

http://localhost:8080/catalogService/products/add
Content-Type: application/json
``` json
{
  "productName": "Ink Pen",
  "quantity": 30,
  "inventoryLow": false,
  "price": 15.99,
  "currencyCode": "USD"
}
```
 