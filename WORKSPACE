workspace(name = "scala-ls-tests")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

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

# ---

local_repository(
    name = "rules_scala3",
    path = "../rules_scala3",
)

load("@rules_scala3//rules/scala:workspace.bzl", "scala_register_toolchains", "scala_repositories")

scala_repositories()

load("@annex//:defs.bzl", annex_pinned_maven_install = "pinned_maven_install")

annex_pinned_maven_install()

scala_register_toolchains()

# protobuf
load("@rules_scala3//rules/scala:init.bzl", "rules_scala3_init")

rules_scala3_init()

# ---

load("@rules_scala3//mezel_compatibility:repositories.bzl", "mezel_compatibility_repository")

mezel_compatibility_repository(
    name = "mezel",
    mezel_version = "216327ab2fc6d5866f13ace1bf75c9d1abdcd8a6",
    sha256 = "dbdb144fc943670dc1b715629f939d8f5010ae1b2ab889b3620866ce19cda1df",
)

load("@mezel//rules:load_mezel.bzl", "load_mezel")

load_mezel()

# ---

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
