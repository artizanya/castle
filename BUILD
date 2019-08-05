package(default_visibility = ["//visibility:public"])

# load("@build_bazel_rules_nodejs//:defs.bzl", "nodejs_binary")

# # see https://github.com/bazelbuild/rules_nodejs/blob/master/packages/typescript/docs/install.md
# nodejs_binary(
#   name = "@bazel/typescript/tsc_wrapped",
#   entry_point = "//:node_modules/@bazel/typescript/internal/tsc_wrapped/tsc_wrapped.js",
#   data = [
#     "@npm//typescript",
#   ],
# )

load("@npm_bazel_typescript//:index.bzl", "ts_library")

ts_library(
  name = "castle",
  srcs = glob(["server/**/*.ts"]),
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
