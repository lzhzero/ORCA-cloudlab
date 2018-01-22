ceph-deploy new orca-1
echo "public network = 192.168.0.0/24" >>ceph.conf
ceph-deploy install --release luminous orca-{1,2,3}
ceph-deploy mon create-initial
ceph-deploy admin orca-{1,2,3}
ceph-deploy mgr create orca-1
ceph-deploy osd create --filestore orca-2:sdb orca-2:sdc orca-3:sdb orca-3:sdc
sudo ceph mgr module enable dashboard
