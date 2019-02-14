# Hack_Day_GraphQL

### Intro
This is a Ruby on Rails project to explore ruby's [GraphQL gem](https://graphql-ruby.org/) by building a GraphQL server.

### Project Scope
+ Show a list of links
+ Authentication system
+ Users can create new links
+ Users can vote for links

### Setup

1.) Clone the GitHub repo, and navigate to the directory

2.) Run `bundle install` to install dependencies

3.) Start the rails server with `rails s`

#### Creating Links with Rails Console
Open the rails console with `rails c` (You can also create links with mutations, see below in GraphiQL section.)
```bash
irb(main):001:0> Link.create url: 'http://graphql.org/', description: 'The Best Query Language'
irb(main):002:0> Link.create url: 'http://dev.apollodata.com/', description: 'Awesome GraphQL Client'
irb(main):003:0> exit
```

#### GraphiQL
You can run a GraphQL IDE to test run GraphQL queries by going [here](http://localhost:3000/graphiql) if the server is running.

#### Creating Links with Mutations
Put the code below into the left panel of GraphiQL, and press the `play` button.
```
mutation {
  createLink(
    url: "http://npmjs.com/package/graphql-tools",
    description: "Best tools!"
  ) {
    id
    url
    description
  }
}
```

You can expect to see output that looks like this:
```
{
  "data": {
    "createLink": {
      "id": "3",
      "url": "http://npmjs.com/package/graphql-tools",
      "description": "Best tools!"
    }
  }
}
```

#### Creating Users with Mutations
Put the code below into the left panel of GraphiQL, and press the `play` button.
```
mutation {
  createUser(
    name: "Radoslav Stankov",
    authProvider: {
      email: {
        email: "rado@example.com",
        password: "123456"
      }
    }
  ) {
    id
    email
    name
  }
}
```

You can expect to see output that looks like this:
```
{
  "data": {
    "createUser": {
      "id": "1",
      "email": "rado@example.com",
      "name": "Radoslav Stankov"
    }
  }
}
```

#### Trying Out Queries with GraphiQL
Try out a simple query like:
```
{
  allLinks{
    id
    url
    description
  }
}
```

You can expect to see output that looks like this:
```
{
  "data": {
    "allLinks": [
      {
        "id": "1",
        "url": "http://graphql.org/",
        "description": "The Best Query Language"
      },
      {
        "id": "2",
        "url": "http://dev.apollodata.com/",
        "description": "Awesome GraphQL Client"
      },
      {
        "id": "3",
        "url": "http://npmjs.com/package/graphql-tools",
        "description": "Best tools!"
      }
    ]
  }
}
```

### Testing
Tests can be run with `bundle exec rails test`
