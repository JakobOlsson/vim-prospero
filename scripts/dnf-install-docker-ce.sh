#!/usr/bin/env bash

# will install docker-ce version which is never than then one in fedora repo
# then add current user to docker group
if [[ $EUID -ne 0 ]]; then
  echo "You have to be root"
  exit 1
fi
sudo dnf -y install dnf-plugins-core
sudo cat >/etc/yum.repos.d/docker-ce.repo<<EOF
[docker-ce-stable]
name=Docker CE Stable
baseurl=https://download.docker.com/linux/fedora/28/x86_64/stable
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/fedora/gpg
EOF

sudo dnf install -y docker-ce docker-ce-cli containerd.io
DOCKERGROUP="sudo usermod -a -G docker ${USER}"
eval $DOCKERGROUP

sudo systemctl enable docker
sudo systemctl start docker
# lets test things are working
echo "Running docker hello-world to test it is working..."
sudo docker run hello-world


echo "For SELinux and Docker volumes to work outside /var/.."
echo "Remeber to run: chcon -Rt svirt_sandbox_file_t /home/${USER}/whateverfolder"
echo "On any folder in your home directy you will be running docker inside and will mount volumes localy"
