
# 3 Repository Server

## 3-1 Nexus

> **Environment:** Reposiroty Server

Install Nexus

```bash
mkdir ~/nexus-data
sudo chown -R 200 ~/nexus-data
docker load -i ~/bundle/images/nexus3-3.64.0.tar
docker run -d -p 8081:8081 --name nexus -v ~/nexus-data:/nexus-data sonatype/nexus3:3.64.0
```

Check Password

```bash
docker exec nexus cat /nexus-data/admin.password && echo
```

Init Nexus

```
Login Nexus3 WEB and change admin password(hpinvent)
```

Enable Scripting in Nexus

```bash
docker exec nexus bash -c 'echo nexus.scripts.allowCreation=true >> /nexus-data/etc/nexus.properties'
docker restart nexus
```

Install nexus3-cli

```bash
sudo pip install nexus3-cli
nexus3 login -U http://192.168.0.81:8081 -u admin -p hpinvent --no-x509_verify
```

## 3-2 Create Repository

> **Environment:** Reposiroty Server

Create Docker Registry(Hosted)

```bash
nexus3 repository create hosted docker \
--blob-store-name default \
--strict-content \
--write-policy allow \
--no-v1-enabled \
--http-port 8082 \
docker-airgap
```

Enable Docker Bearer Token Realm

```bash
nexus3 security realm activate DockerToken
```

Create Raw Repository(Hosted)

```bash
nexus3 repository create hosted raw \
--blob-store-name default \
--strict-content \
--write-policy allow \
artifacts
```

Create Helm Repository(Hosted)

```
Menu: Repository - Repositories - Create repository - helm (hosted)
Name: nexus-helm
```

## 3-3 Upload Images

> **Environment:** bootstrap

Rancher Images

```bash
cd ~/bundle/rancher
chmod +x rancher-load-images.sh
./rancher-load-images.sh --image-list ./rancher-images.txt --registry <nexus dokcer repo>
```

Helm Chart Images

```bash
cd ~/bundle/images
docker login <nexus url>
# mlflow
docker load python-3.9-slim.tar
docker tag  amd64/python:3.9-slim <nexus url>/amd64/python:3.9-slim
docker push <nexus url>/amd64/python:3.9-slim
docker load postgres-14.0.tar
docker tag  postgres:14.0 <nexus url>/postgres:14.0
docker push <nexus url>/postgres:14.0
docker load minio.tar
docker tag  minio/minio:latest <nexus url>/minio/minio:latest
docker push <nexus url>/minio/minio:latest
docker push <nexus url>/mlflow:latest
# gitlab
docker load gitlab-ee-16.7.4-ee.0.tar
docker tag  gitlab/gitlab-ee:16.7.4-ee.0 <nexus url>/gitlab/gitlab-ee:16.7.4-ee.0
docker push <nexus url>/gitlab/gitlab-ee:16.7.4-ee.0
# cert manager
docker load cert-manager-controller.tar
docker tag  quay.io/jetstack/cert-manager-controller:latest <nexus url>/quay.io/jetstack/cert-manager-controller:latest
docker push <nexus url>/quay.io/jetstack/cert-manager-controller:latest
docker load cert-manager-webhook.tar
docker tag  quay.io/jetstack/cert-manager-webhook:latest <nexus url>/quay.io/jetstack/cert-manager-webhook:latest
docker push <nexus url>quay.io/jetstack/cert-manager-webhook:latest
docker load cert-manager-cainjector.tar
docker tag  quay.io/jetstack/cert-manager-cainjector:latest <nexus url>/quay.io/jetstack/cert-manager-cainjector:latest
docker push <nexus url>quay.io/jetstack/cert-manager-cainjector:latest
docker load cert-manager-acmesolver.tar
docker tag  quay.io/jetstack/cert-manager-acmesolver:latest <nexus url>/quay.io/jetstack/cert-manager-acmesolver:latest
docker push <nexus url>quay.io/jetstack/cert-manager-acmesolver:latest
docker load cert-manager-ctl.tar
docker tag  quay.io/jetstack/cert-manager-ctl:latest <nexus url>/quay.io/jetstack/cert-manager-ctl:latest
docker push <nexus url>quay.io/jetstack/cert-manager-ctl:latest
# nvidia operator
docker load cuda-12.3.1.tar
docker tag  nvcr.io/nvidia/cuda:12.3.1-base-ubi8 <nexus url>/nvcr.io/nvidia/cuda:12.3.1-base-ubi8
docker push <nexus url>nvcr.io/nvidia/cuda:12.3.1-base-ubi8
docker load driver-535.129.03.tar
docker tag  nvcr.io/nvidia/driver:535.129.03 <nexus url>/nvcr.io/nvidia/driver:535.129.03
docker push <nexus url>nvcr.io/nvidia/driver:535.129.03
docker load gpu-operator-v23.9.1.tar
docker tag  nvcr.io/nvidia/gpu-operator:v23.9.1 <nexus url>/nvcr.io/nvidia/gpu-operator:v23.9.1
docker push <nexus url>nvcr.io/nvidia/gpu-operator:v23.9.1
docker load gpu-feature-discovery-v0.8.2-ubi8.tar
docker tag  nvcr.io/nvidia/gpu-feature-discovery:v0.8.2-ubi8 <nexus url>/nvcr.io/nvidia/gpu-feature-discovery:v0.8.2-ubi8
docker push <nexus url>nvcr.io/nvidia/gpu-feature-discovery:v0.8.2-ubi8
docker load container-toolkit-v1.14.3.tar
docker tag  nvcr.io/nvidia/k8s/container-toolkit:v1.14.3-ubuntu20.04 <nexus url>/nvcr.io/nvidia/k8s/container-toolkit:v1.14.3-ubuntu20.04
docker push <nexus url>nvcr.io/nvidia/k8s/container-toolkit:v1.14.3-ubuntu20.04
docker load dcgm-exporter-3.3.0-3.2.0.tar
docker tag  nvcr.io/nvidia/k8s/dcgm-exporter:3.3.0-3.2.0-ubuntu22.04 <nexus url>/nvcr.io/nvidia/k8s/dcgm-exporter:3.3.0-3.2.0-ubuntu22.04
docker push <nexus url>nvcr.io/nvidia/k8s/dcgm-exporter:3.3.0-3.2.0-ubuntu22.04
docker load k8s-device-plugin-v0.14.3.tar
docker tag  nvcr.io/nvidia/k8s-device-plugin:v0.14.3-ubi8 <nexus url>/nvcr.io/nvidia/k8s-device-plugin:v0.14.3-ubi8
docker push <nexus url>/nvcr.io/nvidia/k8s-device-plugin:v0.14.3-ubi8
docker load kubevirt-gpu-device-plugin-v1.2.4.tar
docker tag  nvcr.io/nvidia/kubevirt-gpu-device-plugin:v1.2.4 <nexus url>/nvcr.io/nvidia/kubevirt-gpu-device-plugin:v1.2.4
docker push <nexus url>/nvcr.io/nvidia/kubevirt-gpu-device-plugin:v1.2.4
docker load dcgm-3.3.0-1.tar
docker tag  nvcr.io/nvidia/cloud-native/dcgm:3.3.0-1-ubuntu22.04 <nexus url>/nvcr.io/nvidia/cloud-native/dcgm:3.3.0-1-ubuntu22.04
docker push <nexus url>/nvcr.io/nvidia/cloud-native/dcgm:3.3.0-1-ubuntu22.04
docker load gpu-operator-validator-v23.9.1.tar
docker tag  nvcr.io/nvidia/cloud-native/gpu-operator-validator:v23.9.1 <nexus url>/nvcr.io/nvidia/cloud-native/gpu-operator-validator:v23.9.1
docker push <nexus url>/nvcr.io/nvidia/cloud-native/gpu-operator-validator:v23.9.1
docker load k8s-mig-manager-v0.5.5.tar
docker tag  nvcr.io/nvidia/cloud-native/k8s-mig-manager:v0.5.5-ubuntu20.04 <nexus url>/nvcr.io/nvidia/cloud-native/k8s-mig-manager:v0.5.5-ubuntu20.04
docker push <nexus url>/nvcr.io/nvidia/cloud-native/k8s-mig-manager:v0.5.5-ubuntu20.04
docker load k8s-driver-manager-v0.6.5.tar
docker tag  nvcr.io/nvidia/cloud-native/k8s-driver-manager:v0.6.5 <nexus url>/nvcr.io/nvidia/cloud-native/k8s-driver-manager:v0.6.5
docker push <nexus url>/nvcr.io/nvidia/cloud-native/k8s-driver-manager:v0.6.5
docker load k8s-driver-manager-v0.6.4.tar
docker tag  nvcr.io/nvidia/cloud-native/k8s-driver-manager:v0.6.4 <nexus url>/nvcr.io/nvidia/cloud-native/k8s-driver-manager:v0.6.4
docker push <nexus url>/nvcr.io/nvidia/cloud-native/k8s-driver-manager:v0.6.4
docker load k8s-driver-manager-v0.6.2.tar
docker tag  nvcr.io/nvidia/cloud-native/k8s-driver-manager:v0.6.2 <nexus url>/nvcr.io/nvidia/cloud-native/k8s-driver-manager:v0.6.2
docker push <nexus url>/nvcr.io/nvidia/cloud-native/k8s-driver-manager:v0.6.2
docker load k8s-kata-manager-v0.1.2.tar
docker tag  nvcr.io/nvidia/cloud-native/k8s-kata-manager:v0.1.2 <nexus url>/nvcr.io/nvidia/cloud-native/k8s-kata-manager:v0.1.2
docker push <nexus url>/nvcr.io/nvidia/cloud-native/k8s-kata-manager:v0.1.2
docker load k8s-cc-manager-v0.1.1.tar
docker tag  nvcr.io/nvidia/cloud-native/k8s-cc-manager:v0.1.1 <nexus url>/nvcr.io/nvidia/cloud-native/k8s-cc-manager:v0.1.1
docker push <nexus url>/nvcr.io/nvidia/cloud-native/k8s-cc-manager:v0.1.1
docker load nvidia-fs-2.17.5.tar
docker tag  nvcr.io/nvidia/cloud-native/nvidia-fs:2.17.5 <nexus url>/nvcr.io/nvidia/cloud-native/nvidia-fs:2.17.5
docker push <nexus url>/nvcr.io/nvidia/cloud-native/nvidia-fs:2.17.5
docker load vgpu-device-manager-v0.2.4.tar
docker tag  nvcr.io/nvidia/cloud-native/vgpu-device-manager:v0.2.4 <nexus url>/nvcr.io/nvidia/cloud-native/vgpu-device-manager:v0.2.4
docker push <nexus url>/nvcr.io/nvidia/cloud-native/vgpu-device-manager:v0.2.4
# nfs server provisioner
docker load nfs-provisioner-v2.3.0.tar
docker tag  quay.io/kubernetes_incubator/nfs-provisioner:v2.3.0 quay.io/kubernetes_incubator/nfs-provisioner:v2.3.0
docker push quay.io/kubernetes_incubator/nfs-provisioner:v2.3.0
# prometheus stack
docker load alertmanager-v0.26.0.tar
docker tag  quay.io/prometheus/alertmanager:v0.26.0 <nexus url>/quay.io/prometheus/alertmanager:v0.26.0
docker push <nexus url>/quay.io/prometheus/alertmanager:v0.26.0
docker load admission-webhook-v0.71.2.tar
docker tag  quay.io/prometheus-operator/admission-webhook:v0.71.2 <nexus url>/quay.io/prometheus-operator/admission-webhook:v0.71.2
docker push <nexus url>/quay.io/prometheus-operator/admission-webhook:v0.71.2
docker load prometheus-operator-v0.71.2.tar
docker tag  quay.io/prometheus-operator/prometheus-operator:v0.71.2 <nexus url>/quay.io/prometheus-operator/prometheus-operator:v0.71.2
docker push <nexus url>/quay.io/prometheus-operator/prometheus-operator:v0.71.2
docker load prometheus-config-reloader-v0.71.2.tar
docker tag  quay.io/prometheus-operator/prometheus-config-reloader:v0.71.2 <nexus url>/quay.io/prometheus-operator/prometheus-config-reloader:v0.71.2
docker push <nexus url>/quay.io/prometheus-operator/prometheus-config-reloader:v0.71.2
docker load prometheus-v2.49.1.tar
docker tag  quay.io/prometheus/prometheus:v2.49.1 <nexus url>/quay.io/prometheus/prometheus:v2.49.1
docker push <nexus url>/quay.io/prometheus/prometheus:v2.49.1
docker load thanos-v0.33.0.tar
docker tag  quay.io/thanos/thanos:v0.33.0 <nexus url>/quay.io/thanos/thanos:v0.33.0
docker push <nexus url>/quay.io/thanos/thanos:v0.33.0
docker load kube-webhook-certgen-v20221220-controller-v1.5.1-58.tar
docker tag  registry.k8s.io/ingress-nginx/kube-webhook-certgen:v20221220-controller-v1.5.1-58-g787ea74b6 <nexus url>/registry.k8s.io/ingress-nginx/kube-webhook-certgen:v20221220-controller-v1.5.1-58-g787ea74b6
docker push <nexus url>/registry.k8s.io/ingress-nginx/kube-webhook-certgen:v20221220-controller-v1.5.1-58-g787ea74b6
```

## 3-4 Upload Helm Charts

> **Environment:** bootstrap

Upload Helm Chart to Repository

```bash
cd ~/bundle/helm
curl -u admin:hpinvent http://<nexus url>/repository/nexus-helm/ --upload-file cert-manager-v1.13.3.tgz
curl -u admin:hpinvent http://<nexus url>/repository/nexus-helm/ --upload-file rancher-2.8.0.tgz
curl -u admin:hpinvent http://<nexus url>/repository/nexus-helm/ --upload-file gpu-operator-v23.9.1.tgz
curl -u admin:hpinvent http://<nexus url>/repository/nexus-helm/ --upload-file nfs-server-provisioner-1.1.3.tgz
curl -u admin:hpinvent http://<nexus url>/repository/nexus-helm/ --upload-file kube-prometheus-stack-56.2.1.tgz
```

## 3-5 Upload Raw Files

> **Environment:** bootstrap

Upload Raw Files to Repository

```bash
cd ~/bundle/helm/
curl -u admin:hpinvent --upload-file helm-v3.14.0-linux-amd64.tar.gz http://<nexus url>/repository/artifacts/helm-v3.14.0-linux-amd64.tar.gz
cd ~/bundle/raw
curl -u admin:hpinvent --upload-file cert-manager.crds.yaml http://<nexus url>/repository/artifacts/cert-manager.crds.yaml
curl -u admin:hpinvent --upload-file kubeflow.tgz http://<nexus url>/repository/artifacts/kubeflow.tgz
curl -u admin:hpinvent --upload-file kustomize_v5.3.0_linux_amd64.tar.gz http://<nexus url>/repository/artifacts/kustomize_v5.3.0_linux_amd64.tar.gz
curl -u admin:hpinvent --upload-file mc http://<nexus url>/repository/artifacts/mc
cd ~/bundle/rancher
curl -u admin:hpinvent --upload-file rancher-images.txt http://<nexus url>/repository/artifacts/rancher/rancher-images.txt
curl -u admin:hpinvent --upload-file rancher-load-images.sh http://<nexus url>/repository/artifacts/rancher/rancher-load-images.sh
curl -u admin:hpinvent --upload-file rancher-save-images.sh http://<nexus url>/repository/artifacts/rancher/rancher-save-images.sh
curl -u admin:hpinvent --upload-file install.sh http://<nexus url>/repository/artifacts/rancher/install.sh
```
