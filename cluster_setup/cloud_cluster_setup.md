## Generate _ubuntu_ user SSH keys

```
ssh-keygen -t rsa -N "" -f $HOME/.ssh/id_rsa
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
```

## Install NFS

### Master

```
sudo apt-get update
sudo apt-get install nfs-kernel-server
sudo cat '/home	10.0.0.0/24(rw,sync,no_root_squash,no_subtree_check)' >> /etc/exports
sudo service nfs-kernel-server start
```

### Node

```
sudo apt-get update
sudo apt-get install nfs-common
sudo cat '10.0.0.8:/home    /home   nfs auto,noatime,nolock,bg,nfsvers=4,intr,tcp,actimeo=1800 0 0' >> /etc/fstab
```


## Install SLURM

### Master

```
sudo apt-get install slurm-wlm
sudo bash -c 'echo CgroupAutomount=yes >> /etc/slurm-llnl/cgroup.conf'
sudo chown slurm:slurm /etc/slurm-llnl/cgroup.conf
sudo cp /etc/munge/munge.key $HOME/
```

### Node

```
sudo apt-get install slurmd
sudo bash -c 'echo CgroupAutomount=yes >> /etc/slurm-llnl/cgroup.conf'
sudo chown slurm:slurm /etc/slurm-llnl/cgroup.conf
sudo cp /home/ubuntu/munge.key /etc/munge/munge.key
sudo service munge restart
```
