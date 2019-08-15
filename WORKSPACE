# Hey Emacs, this is -*- coding: utf-8; mode: bazel -*-

workspace(
  name = "castle",
  managed_directories = {"@npm": ["node_modules"]},
)

metaPath = __workspace_dir__ + "/.meta"

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
  name = "rh_bazel_utils",
  remote = "https://github.com/ramblehead/bazel-utils.git",
  commit = "456cef0e8af31c0fd98645381c14f2338b748226",
  shallow_since = "1565016199 +0100",
)

load("@rh_bazel_utils//:index.bzl", "select_repository")

select_repository(
  key = "local",
  name = "build_bazel_rules_nodejs",
  repositories = {
    # This selection does not work yet - need to learn how to apply patch:
    # https://github.com/bazelbuild/rules_nodejs/issues/998#issuecomment-521317102
    "default": {
      "rule": git_repository,
      "kwargs": {
        "remote": "https://github.com/bazelbuild/rules_nodejs.git",
        # tag = "0.34.0",
        "commit": "2a0be492c5d506665798f04673ab1a646c883626",
        "shallow_since": "1563926047 -0700",
      },
    },
    "rh_github_forked": {
      "rule": git_repository,
      "kwargs": {
        "remote": "https://github.com/ramblehead/bazel-rules-nodejs.git",
        "branch": "rh_overrides",
      },
    },
    "local": {
      "rule": local_repository,
      "kwargs": {
        "path": metaPath +
          "/bazel-rules-nodejs/release/build_bazel_rules_nodejs/release",
      },
    },
  },
)

load("@build_bazel_rules_nodejs//:defs.bzl", "yarn_install")

yarn_install(
  name = "npm",
  package_json = "//:package.json",
  yarn_lock = "//:yarn.lock",
)

load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")

install_bazel_dependencies()

load("@npm_bazel_typescript//:index.bzl", "ts_setup_workspace")

ts_setup_workspace()
