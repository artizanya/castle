package(default_visibility = ["//visibility:public"])

load("@npm_bazel_typescript//:index.bzl", "ts_library")

ts_library(
  name = "castle",
  srcs = ["index.ts"],
  # compiler = "npx tsc",
  # tsconfig = ":tsconfig.json",
  runtime = "nodejs",
  rh_target_override = "es2018",
  rh_module_override = "commonjs",
  deps = [
    "@npm//koa",
    "@npm//@types/koa",
    "@npm//apollo-server-koa",
    "@npm//type-graphql",
    "@npm//arangojs",
  ],
)
