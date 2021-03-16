load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "95d39fd84ff4474babaf190450ee034d958202043e366b9fc38f438c9e6c3334",
    strip_prefix = "rules_docker-0.16.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.16.0/rules_docker-v0.16.0.tar.gz"],
)

load("@io_bazel_rules_docker//toolchains/docker:toolchain.bzl", docker_toolchain_configure="toolchain_configure")

docker_toolchain_configure(
  name = "docker_config",
  client_config="~/.docker",
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

container_pull(
    name = "steamcmd_installer_base",
    registry = "index.docker.io",
    repository = "library/ubuntu",
    tag = "bionic",
)

container_pull(
    name = "steamcmd_runtime_base",
    registry = "index.docker.io",
    repository = "library/ubuntu",
    tag = "focal",
)