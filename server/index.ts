import 'reflect-metadata';

// const Koa = require('koa');
// const { ApolloServer, gql } = require('apollo-server-koa');
import Koa from 'koa';

import {
  ApolloServer,
  // gql,
} from 'apollo-server-koa';

import {
  Database,
  // aql,
} from 'arangojs';

import { Resolver, Query, buildSchemaSync } from 'type-graphql';

// const landDb = new Database();

const landDb = new Database({
  url: 'http://localhost:8529',
});

// landDb.useDatabase('_system');
landDb.useBasicAuth('root', 'artizan0');

const elements = landDb.collection('land_elements');

(async function (): Promise<void> {
  const element = await elements.firstExample({
    _key: '0005',
  });

  console.log(element);
})();

@Resolver()
class HelloWorldResolver {
  @Query(returns => String)
  async hello(): Promise<string> {
    const element = await elements.firstExample({
      _key: '0005',
    });

    return `${this.helloMessage}, ${element.description}`;
  }

  private helloMessage = 'Hello world!';
}

const schemaExequtable = buildSchemaSync({
  resolvers: [HelloWorldResolver],
});

// // Construct a schema, using GraphQL schema language
// const typeDefs = gql`
//   type Query {
//     hello: String
//   }
// `;

// // Provide resolver functions for your schema fields
// const resolvers = {
//   Query: {
//     hello: (): string => 'Hello world!',
//   },
// };

// const server = new ApolloServer({ typeDefs, resolvers });

const server = new ApolloServer({
  schema: schemaExequtable,
  playground: true,
});

const app = new Koa();
server.applyMiddleware({ app });

app.listen({ port: 4000 }, () => console.log(
  `🚀 Server ready at http://localhost:4000${server.graphqlPath}`,
));
