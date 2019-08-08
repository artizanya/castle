# Hey Emacs, this is -*- coding: utf-8; mode: bazel -*-

package(default_visibility = ["//visibility:public"])

# load("@build_bazel_rules_nodejs//:defs.bzl", "nodejs_binary")

# see .meta/bazel-rules-nodejs/packages/typescript/src/index.from_src.bzl
# for ts_library rule whic does not require npm packaging

# see https://github.com/bazelbuild/rules_nodejs/blob/master/packages/typescript/docs/install.md
# nodejs_binary(
#   name = "@bazel/typescript/tsc_wrapped",
#   entry_point = ":.meta/npm_bazel_typescript/internal/tsc_wrapped/tsc_wrapped.js",
#   data = [
#     "@npm//protobufjs",
#     "@npm//source-map-support",
#     "@npm//tsutils",
#     "@npm//typescript",
#     "//:.meta/npm_bazel_typescript/internal/tsc_wrapped",
#     "//:.meta/npm_bazel_typescript/internal/tsetse",
#     "//:.meta/npm_bazel_typescript/third_party/github.com" +
#       "/bazelbuild/bazel/src/main/protobuf/worker_protocol.proto"
#   ],
# )

load("//:dependencies.bzl", "ts_build_dependencies")

ts_build_dependencies()

load("@npm_bazel_typescript//:index.bzl", "ts_library")

ts_library(
  name = "castle",
  srcs = glob(["server/**/*.ts"]),
  compiler = "//:@bazel/typescript/tsc_wrapped",
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
