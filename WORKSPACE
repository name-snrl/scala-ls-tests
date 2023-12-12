workspace(name = "scala-ls-tests")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    sha256 = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
    ],
)

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "71324bef9bc5a885097e2960d5b8effed63399b55572219919d25f43f468c716",
    strip_prefix = "rules_scala-6.2.1",
    url = "https://github.com/bazelbuild/rules_scala/releases/download/v6.2.1/rules_scala-v6.2.1.tar.gz",
)

load("@io_bazel_rules_scala//:scala_config.bzl", "scala_config")

scala_config(scala_version = "3.3.0")

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()

register_toolchains("//:toolchain")

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

# ---

mezel_version = "216327ab2fc6d5866f13ace1bf75c9d1abdcd8a6"

http_archive(
    name = "mezel",
    sha256 = "dbdb144fc943670dc1b715629f939d8f5010ae1b2ab889b3620866ce19cda1df",
    strip_prefix = "mezel-%s" % mezel_version,
    type = "zip",
    url = "https://github.com/valdemargr/mezel/archive/%s.zip" % mezel_version,
)

load("@mezel//rules:load_mezel.bzl", "load_mezel")

load_mezel()

# ---

RULES_JVM_EXTERNAL_TAG = "5.3"
RULES_JVM_EXTERNAL_SHA ="d31e369b854322ca5098ea12c69d7175ded971435e55c18dd9dd5f29cc5249ac"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/%s/rules_jvm_external-%s.tar.gz" % (RULES_JVM_EXTERNAL_TAG, RULES_JVM_EXTERNAL_TAG)
)

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

load("@rules_jvm_external//:setup.bzl", "rules_jvm_external_setup")

rules_jvm_external_setup()

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "com.github.scopt:scopt_3:4.1.0",
        "org.scala-sbt:librarymanagement-core_3:2.0.0-alpha12",
        "org.scala-sbt:librarymanagement-coursier_3:2.0.0-alpha6",
    ],
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
    fetch_sources = True
)
