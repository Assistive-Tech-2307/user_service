# README

## Install
- pull respository down
- move into directory
- in terminal `bundle`
- in terminal `rails db:{create,migrate,seed}`
- in terminal `rails server` defaults to 3001


## Graphql Endpoints

Create session </br>
`POST http://localhost:3001/graphql`
 
 In query </br>
 
 ```
 mutation Session{
    sessionCreate(email:"<user's email>", password:"<user's password"){
        id
        email
    }
}
```
example </br>
 ```
 mutation Session{
    sessionCreate(email:"rosa@aol.com", password:"rosaslaw10!"){
        id
        email
    }
}
```

sample response
```
{
    "data": {
        "sessionCreate": {
            "id": "1",
            "email": "rosa@aol.com"
        }
    }
}
```
