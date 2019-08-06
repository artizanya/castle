# Hey Emacs, this is -*- coding: utf-8; mode: bazel -*-

workspace(
  name = "castle",
  managed_directories = {"@npm": ["node_modules"]},
)

metaPath = __workspace_dir__ + "/.meta"

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
  name = "bazel_skylib",
  remote = "https://github.com/bazelbuild/bazel-skylib.git",
  # tag = "0.9.0",
  commit = "2b38b2f8bd4b8603d610cfc651fcbb299498147f",
  shallow_since = "1562957722 -0400"
)

# git_repository(
#   name = "build_bazel_rules_nodejs",
#   remote = "https://github.com/bazelbuild/rules_nodejs.git",
#   # tag = "0.34.0",
#   commit = "2a0be492c5d506665798f04673ab1a646c883626",
#   shallow_since = "1563926047 -0700",
# )

# local_repository(
#   name = "build_bazel_rules_nodejs",
#   path = metaPath + "/bazel-nodejs-rules",
# )

local_repository(
  name = "build_bazel_rules_nodejs",
  path = metaPath + "/bazel-rules-nodejs/release/build_bazel_rules_nodejs/release",
)

load("@build_bazel_rules_nodejs//:defs.bzl", "yarn_install")

yarn_install(
  name = "npm",
  package_json = "//:package.json",
  yarn_lock = "//:yarn.lock",
  always_hide_bazel_files = True,
  # use_global_yarn_cache = False,
)

# load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")

# install_bazel_dependencies()

local_repository(
  name = "npm_bazel_jasmine",
  path = metaPath + "/bazel-rules-nodejs/packages/jasmine/src",
)

local_repository(
  name = "npm_bazel_typescript",
  path = metaPath + "/bazel-rules-nodejs/packages/typescript/src",
)

local_repository(
  name = "build_bazel_rules_typescript",
  path = metaPath + "/bazel-rules-typescript",
)

git_repository(
  name = "io_bazel_rules_go",
  remote = "https://github.com/bazelbuild/rules_go.git",
  tag = "0.18.5",
  # tag = "0.19.1",
)

load(
  "@io_bazel_rules_go//go/private:compat/compat_repo.bzl",
  "go_rules_compat",
)

go_rules_compat(name = "io_bazel_rules_go_compat")

# new_local_repository(
#   name = "npm_bazel_typescript",
#   path = metaPath + "/bazel-rules-nodejs/release/npm_bazel_typescript",
#   build_file = metaPath + \
#     "/bazel-rules-nodejs/release/npm_bazel_typescript/BUILD.bazel",
# )

# filegroup(
#   name = "generate_build_file",
#   srcs = [
#     "generate_build_file.js",
#   ],
#   visibility = ["//internal:__subpackages__"],
# )

# load("@npm_bazel_typescript//:index.bzl", "ts_setup_workspace")

# ts_setup_workspace()
