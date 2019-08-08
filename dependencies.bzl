# Hey Emacs, this is -*- coding: utf-8; mode: bazel -*-

load("@build_bazel_rules_nodejs//:defs.bzl", "nodejs_binary")

def ts_workspace_dependencies(metaPath):
  native.local_repository(
    name = "build_bazel_rules_typescript",
    path = metaPath + "/bazel-rules-typescript",
  )

  # Ideally, npm_bazel_typescript should be loaded from
  # .meta/npm_bazel_typescript. But, that dir is a npm package
  # with bazel files hidden.
  # It must still be possible to load this package as bazel repository
  # in a similar way as npm_install does with package.json packages.
  native.local_repository(
    name = "npm_bazel_typescript",
    path = metaPath + "/bazel-rules-nodejs/packages/typescript/src",
  )

def ts_build_dependencies():
  nodejs_binary(
    name = "@bazel/typescript/tsc_wrapped",
    entry_point = ":.meta/npm_bazel_typescript/internal/tsc_wrapped/tsc_wrapped.js",
    data = [
      "@npm//protobufjs",
      "@npm//source-map-support",
      "@npm//tsutils",
      "@npm//typescript",
      "//:.meta/npm_bazel_typescript/internal/tsc_wrapped",
      "//:.meta/npm_bazel_typescript/internal/tsetse",
      "//:.meta/npm_bazel_typescript/third_party/github.com" +
        "/bazelbuild/bazel/src/main/protobuf/worker_protocol.proto"
    ],
  )
