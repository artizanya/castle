workspace(
  name = "castle",
  managed_directories = {"@npm": ["node_modules"]},
)

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

local_repository(
  name = "build_bazel_rules_nodejs",
  path = "../rules_nodejs",
)

# # Check the bazel version and download npm dependencies
load("@build_bazel_rules_nodejs//:defs.bzl", "yarn_install")

# Setup the Node.js toolchain & install our npm dependencies into @npm
yarn_install(
  name = "npm",
  package_json = "//:package.json",
  yarn_lock = "//:yarn.lock",
)

# Install all bazel dependencies of our npm packages
load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")

install_bazel_dependencies()

# Setup the rules_typescript tooolchain
load("@npm_bazel_typescript//:defs.bzl", "ts_setup_workspace")

ts_setup_workspace()

