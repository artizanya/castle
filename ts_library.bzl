# Hey Emacs, this is -*- coding: utf-8; mode: bazel -*-

load("@npm_bazel_typescript//:index.bzl", _ts_library = "ts_library")

def ts_library(**kwargs):
  _ts_library(
    runtime = "nodejs",
    rh_target_override = ":rh_target_override",
    rh_module_override = ":rh_module_override",
    **kwargs)
