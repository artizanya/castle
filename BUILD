package(default_visibility = ["//visibility:public"])

load("@npm_bazel_typescript//:index.from_src.bzl", "ts_library")

ts_library(
  name = "castle",
  # module_name = "sm",
  # node_modules = "@npm//:node_modules",
  srcs = glob(["server/**/*.ts"]),
  # tsconfig = ":tsconfig.json",
  # compiler = ":@bazel/typescript/tsc_wrapped",
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
