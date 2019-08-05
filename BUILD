package(default_visibility = ["//visibility:public"])

load("@npm_bazel_typescript//:index.bzl", "ts_library")

# load("@build_bazel_rules_nodejs//:defs.bzl", "nodejs_binary")

# see https://github.com/bazelbuild/rules_nodejs/blob/master/packages/typescript/docs/install.md
# nodejs_binary(
#   name = "@bazel/typescript/tsc_wrapped",
#   entry_point = "@bazel/typescript/internal/tsc_wrapped/tsc_wrapped.js",
#   # Point bazel to your node_modules to find the entry point
#   node_modules = "//:node_modules",
# )

ts_library(
  name = "castle",
  srcs = glob(["src/**/*.ts"]),
  # tsconfig = ":tsconfig.json",
  # compiler = "//:@bazel/typescript/tsc_wrapped",
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
