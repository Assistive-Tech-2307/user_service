# README

## Table of Contents
- [About this App](#about-this-app)
- [Production Sites](#production-sites)
- [Associated Repos](#associated-repos)
- [Ruby version](#ruby-version)
- [Preloaded seeds](#preloaded-seeds)
- [Install Ruby with Brew](#install-ruby-with-brew)
- [Install](#install)
- [Reset Database](#reset-database)
- [Database](#database)
- [GraphiQL Endpoints](#graphiql-endpoints)
- [GraphQL Endpoints](#graphql-endpoints)
   - [Create Session](#create-session)
   - [Create Comment](#create-comment)
   - [Delete Comment](#delete-comment)
   - [Get All of a Specific Category's Comments](#get-all-of-a-specific-categorys-comments)
- [Contributors](#contributors)


## About this App
This application has 1 endpoint that currently allows for 4 different implementations. You can log in and create a session, create a comment, delete a comment, and get all of a specific category's comments. This API feeds into a website called AI AT Ally that helps match assistive technologies to disabilities.

## Production Sites
- [User Service Production](https://nameless-stream-88171-cdff591c89ed.herokuapp.com/)
- [AI Service Production](https://dashboard.heroku.com/apps/assistivie-tech-2307)
- [AT Finder Production](https://at-finder.vercel.app/)

## Associated Repos
- [AI Service Repo](https://github.com/Assistive-Tech-2307/ai_service)
- [AT Finder Repo](https://github.com/Assistive-Tech-2307/at-finder)
- [Organization Profile](https://github.com/Assistive-Tech-2307)

## Ruby version
ruby 3.2.2

## Preloaded seeds
```
User.create(name: "Rosa Marcellino", email: "rosa@aol.com", password: "rosaslaw10!")
User.create(name: "Amy Rowley", email: "amy@aol.com", password: "Rowley10!")
User.create(name: "Oliver Brown", email: "brown@aol.com", password: "Brown10!")
```

## Install Ruby with Brew
- In terminal, in any directory
```
$ brew update
$ brew install ruby-build
$ brew install rbenv

$ rbenv install 3.2.2
$ rbenv global 3.2.2
```

## Install
- pull respository down
- move into directory
- in terminal `bundle`
- in terminal `rails db:{create,migrate,seed}`
- in terminal `rails server` defaults to 3001

#### reset database
- in terminal `rails db:{drop,create,migrate,seed}`

## Database
![Schema Setup](<schema.png>)

## GraphiQL Endpoints
- in browser `http://localhost:3001/graphiql`

## GraphQL Endpoints

### Create session
request <br>
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

### Create Comment 
request <br>
`POST /graphql`

query <br>
```
mutation {
    commentCreate(
        input: {
            title: "this is my title",
            link: "link.com",
            description: "this is my description",
            userComment: "this is my comment",
            rating: true,
            category: "Blindness",
            userId: 1
        }
    ) {
        id
        title
        link
        description
        userComment
        rating
        categoryId
        userId
    }
}
```

response <br>
```
{
    "data": {
        "commentCreate": {
            "id": "2",
            "title": "this is my title",
            "link": "link.com",
            "description": "this is my description",
            "userComment": "this is my comment",
            "rating": true,
            "categoryId": 1,
            "userId": 1
        }
    }
}
```

### Delete Comment
request <br>
`POST "/graphql`

query <br>
```
mutation {
    commentDelete(
        input: {
            id: 2
        }
    ) {
        id
        title
        link
        description
        userComment
        rating
        categoryId
        userId
    }
}
```

regular response <br>
```
{
    "data": {
        "commentDelete": {
            "id": "2",
            "title": "this is my title",
            "link": "link.com",
            "description": "this is my description",
            "userComment": "this is my comment",
            "rating": true,
            "categoryId": 1,
            "userId": 1
        }
    }
}
```

error response (if comment couldn't be deleted, usually because comment id doesn't exist) <br>
```
{
    "data": {
        "commentDelete": null
    },
    "errors": [
        {
            "message": "Comment not deleted.",
            "locations": [
                {
                    "line": 2,
                    "column": 5
                }
            ],
            "path": [
                "commentDelete"
            ]
        }
    ]
}
```

### Get All of a Specific Category's Comments
request <br>
`POST /graphql`

query <br>
```
{
    allCategoryComments(
        categoryId: 1
    ) {
        id
        title
        link
        description
        userComment
        rating
        categoryId
        userId
    }
}
```

response <br>
```
{
    "data": {
        "allCategoryComments": [
            {
                "id": "1",
                "title": "this is my title",
                "link": "link.com",
                "description": "this is my description",
                "userComment": "this is my comment",
                "rating": true,
                "categoryId": 1,
                "userId": 1
            },
            {...},
            {...}
        ]
    }
}
```

## Contributors
- Nick Spencer <a href="https://github.com/deadbert">@github.com/deadbert</a>
- Joop Stark <a href="https://github.com/JoopStark">@github.com/JoopStart</a>
- Eliza Keating <a href="https://github.com/elizakeating">@github.com/elizakeating</a>
