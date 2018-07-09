FLAVOR="m1.medium"
MASTER_FLAVOR=$FLAVOR
DOCKER_VOLUME_SIZE_GB=10
IMAGE=Fedora-Atomic-28-20180625-private

openstack coe cluster template create --coe kubernetes \
    --image $IMAGE \
    --keypair default-keypair \
    --external-network public --fixed-network ${OS_USERNAME}-k8s-network --fixed-subnet ${OS_USERNAME}-k8s-subnet1 --network-driver flannel \
    --flavor $FLAVOR --master-flavor $MASTER_FLAVOR \
    --docker-volume-size $DOCKER_VOLUME_SIZE_GB --docker-storage-driver devicemapper \
    --floating-ip-enabled \
    k8s_cluster_template
