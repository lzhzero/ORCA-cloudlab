ssh orca-2 'sudo -s; mount -t tmpfs -o size=40g tmpfs /var/lib/ceph/osd/ceph-4'
ssh orca-2 'sudo ceph-osd -i 4 --mkfs --mkkey'

ssh orca-3 'sudo -s;  mount -t tmpfs -o size=40g tmpfs /var/lib/ceph/osd/ceph-5'
ssh orca-3 'sudo ceph-osd -i 5 --mkfs --mkkey'

sudo ceph auth add osd.4 osd 'allow *' mon 'allow rwx' -i /var/lib/ceph/osd/ceph-{osd-num}/keyring
sudo ceph auth add osd.5 osd 'allow *' mon 'allow rwx' -i /var/lib/ceph/osd/ceph-{osd-num}/keyring

sudo ceph osd crush add osd.4 root=default host=orca-2
sudo ceph osd crush add osd.5 root=default host=orca-3
