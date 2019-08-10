# castle-bazel

```castle-bazel``` project is an experimental project to validate the following technologies and find if they can be used together:

* bazel [node](https://github.com/ramblehead/bazel-rules-nodejs) and [typescript](https://github.com/bazelbuild/rules_typescript) rules
* typescript [experimentalDecorators](https://www.typescriptlang.org/docs/handbook/decorators.html)
* [type-graphql](https://github.com/19majkel94/type-graphql)
* [typescript-eslint](https://github.com/typescript-eslint/typescript-eslint)
* [koa](https://github.com/koajs/koa)
* [apollo-server-koa](https://github.com/apollographql/apollo-server/tree/master/packages/apollo-server-koa)
* [arangojs](https://github.com/arangodb/arangojs)

In particular if bazel can be used to build server-side node projects.

Installation instructions:

```bash
# The following git command should pull this castle repository
# and its git modules (in castle/.module directory):
#   https://github.com/ramblehead/bazel-rules-nodejs/tree/rh_overrides
#   https://github.com/ramblehead/bazel-rules-typescript/tree/rh_overrides
git clone --recursive https://github.com/artizanya/castle.git
cd castle/.project
./make-bazel-rules-nodejs
./make
```

Tested with the following dependencies:
* ubuntu 18.04.3 LTS
* bazel 0.28.1
* node 10.9.0
* yarn 1.17.3
