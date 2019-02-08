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

#### Creating Links
Open the rails console with `rails c`
```bash
irb(main):001:0> Link.create url: 'http://graphql.org/', description: 'The Best Query Language'
irb(main):002:0> Link.create url: 'http://dev.apollodata.com/', description: 'Awesome GraphQL Client'
irb(main):003:0> exit

```

### Testing

#### GraphiQL
You can run a GraphQL IDE to test run GraphQL queries by going [here](http://localhost:3000/graphiql) if the server is running.

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
