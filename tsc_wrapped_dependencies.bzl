# Hey Emacs, this is -*- coding: utf-8; mode: bazel -*-

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def tsc_wrapped_dependencies(metaPath):
  native.local_repository(
    name = "npm_bazel_jasmine",
    path = metaPath + "/bazel-rules-nodejs/packages/jasmine/src",
  )

  native.local_repository(
    name = "npm_bazel_typescript",
    path = metaPath + "/bazel-rules-nodejs/packages/typescript/src",
  )

  native.local_repository(
    name = "build_bazel_rules_typescript",
    path = metaPath + "/bazel-rules-typescript",
  )

  git_repository(
    name = "io_bazel_rules_go",
    remote = "https://github.com/bazelbuild/rules_go.git",
    # tag = "0.19.1",
    commit = "6dae44dc5cabef47049490f53844343c3236c8cb",
    shallow_since = "1563563036 -0400",
  )
