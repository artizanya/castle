package(default_visibility = ["//visibility:public"])

load("@npm_bazel_typescript//:defs.bzl", "ts_library")

ts_library(
  name = "castle",
  srcs = ["index.ts"],
  deps = [
    "@npm//koa",
    "@npm//@types/koa",
    "@npm//apollo-server-koa",
    "@npm//type-graphql",
  ],
)
