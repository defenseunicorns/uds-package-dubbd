ARG K3S_TAG="v1.25.7-k3s1"

FROM rancher/k3s:$K3S_TAG as k3s

FROM nvidia/cuda:11.7.1-base-ubuntu22.04

ARG NVIDIA_CONTAINER_RUNTIME_VERSION
ENV NVIDIA_CONTAINER_RUNTIME_VERSION=$NVIDIA_CONTAINER_RUNTIME_VERSION

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update && \
    apt-get -y install gnupg2 curl

# Install NVIDIA Container Runtime
RUN curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | apt-key add -

RUN curl -s -L https://nvidia.github.io/nvidia-container-runtime/ubuntu22.04/nvidia-container-runtime.list | tee /etc/apt/sources.list.d/nvidia-container-runtime.list

RUN apt-get update && \
    apt-get -y install nvidia-container-toolkit-base nvidia-container-toolkit nvidia-container-runtime util-linux

COPY --from=k3s /bin/* /bin/
# was using a different mount call than the one in the regular k3s image
RUN rm /usr/bin/mount
COPY --from=k3s /bin/sh /usr/bin/sh
COPY --from=k3s /bin/sh /bin/sh
COPY --from=k3s /etc /etc
    # Copy necessary k3s files
COPY --from=k3s /bin/k3s /bin/k3s
COPY --from=k3s /bin/aux /bin/aux
COPY --from=k3s /lib/modules /lib/modules
COPY --from=k3s /run /run
COPY --from=k3s /lib/firmware /lib/firmware



ENV CRI_CONFIG_FILE=/var/lib/rancher/k3s/agent/etc/crictl.yaml

RUN mkdir -p /etc && \
    echo 'hosts: files dns' > /etc/nsswitch.conf



RUN chmod 1777 /tmp

# Provide custom containerd configuration to configure the nvidia-container-runtime
RUN mkdir -p /var/lib/rancher/k3s/agent/etc/containerd/

# config file matches from same tag: https://github.com/k3s-io/k3s/blob/v1.25.7%2Bk3s1/pkg/agent/templates/templates_linux.go
# added the single line `  default_runtime_name = "nvidia"` under `[plugins."io.containerd.grpc.v1.cri".containerd]`
COPY config.toml.tmpl /var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl

# Deploy the nvidia driver plugin on startup
RUN mkdir -p /var/lib/rancher/k3s/server/manifests

COPY device-plugin-daemonset.yaml /var/lib/rancher/k3s/server/manifests/nvidia-device-plugin-daemonset.yaml

VOLUME /var/lib/kubelet
VOLUME /var/lib/rancher/k3s
VOLUME /var/lib/cni
VOLUME /var/log

# fsnotify issues
RUN sysctl -w fs.inotify.max_user_watches=100000
RUN sysctl -w fs.inotify.max_user_instances=100000

ENV PATH="$PATH:/bin/aux"

ENTRYPOINT ["/bin/k3s"]
CMD ["agent"]