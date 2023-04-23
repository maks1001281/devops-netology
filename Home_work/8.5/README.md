## Molecule

#### Idempotent

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/8.5/idempotent.PNG?raw=true "Optional Title")

#### Verifier

![Alt text](https://github.com/maks1001281/devops-netology/blob/main/Home_work/8.5/verifier.PNG?raw=true "Optional Title")

<details>
<summary>В виде кода</summary>

```
WARNING  No schema found in docker driver.
INFO     default scenario test matrix: dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b0d51c/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b0d51c/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b0d51c/roles:/etc/ansible/roles
INFO     Using /root/.cache/ansible-compat/b0d51c/roles/maks.vector symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=Centos7)
changed: [localhost] => (item=Centos8)
changed: [localhost] => (item=Ubuntu23.04)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=Centos7)
ok: [localhost] => (item=Centos8)
ok: [localhost] => (item=Ubuntu23.04)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /etc/ansible/roles/vector/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ******************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost] => (item=None)
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:centos7.9.2009', 'name': 'Centos7', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'quay.io/centos/centos:centos8', 'name': 'Centos8', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/library/ubuntu:python', 'name': 'Ubuntu23.04', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'quay.io/centos/centos:centos7.9.2009', 'name': 'Centos7', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'quay.io/centos/centos:centos8', 'name': 'Centos8', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'docker.io/library/ubuntu:python', 'name': 'Ubuntu23.04', 'pre_build_image': True})
skipping: [localhost]

TASK [Synchronization the context] *********************************************
skipping: [localhost] => (item={'image': 'quay.io/centos/centos:centos7.9.2009', 'name': 'Centos7', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'quay.io/centos/centos:centos8', 'name': 'Centos8', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'docker.io/library/ubuntu:python', 'name': 'Ubuntu23.04', 'pre_build_image': True})
skipping: [localhost]

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'quay.io/centos/centos:centos7.9.2009', 'name': 'Centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'quay.io/centos/centos:centos8', 'name': 'Centos8', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/library/ubuntu:python', 'name': 'Ubuntu23.04', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 2, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/quay.io/centos/centos:centos7.9.2009)
skipping: [localhost] => (item=molecule_local/quay.io/centos/centos:centos8)
skipping: [localhost] => (item=molecule_local/docker.io/library/ubuntu:python)
skipping: [localhost]

TASK [Create docker network(s)] ************************************************
skipping: [localhost]

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:centos7.9.2009', 'name': 'Centos7', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'quay.io/centos/centos:centos8', 'name': 'Centos8', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/library/ubuntu:python', 'name': 'Ubuntu23.04', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=Centos7)
changed: [localhost] => (item=Centos8)
changed: [localhost] => (item=Ubuntu23.04)

TASK [Wait for instance(s) creation to complete] *******************************
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '410068594230.27193', 'results_file': '/root/.ansible_async/410068594230.27193', 'changed': True, 'item': {'image': 'quay.io/centos/centos:centos7.9.2009', 'name': 'Centos7', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '238139704251.27224', 'results_file': '/root/.ansible_async/238139704251.27224', 'changed': True, 'item': {'image': 'quay.io/centos/centos:centos8', 'name': 'Centos8', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '340039870123.27300', 'results_file': '/root/.ansible_async/340039870123.27300', 'changed': True, 'item': {'image': 'docker.io/library/ubuntu:python', 'name': 'Ubuntu23.04', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=6    changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [Centos8]
ok: [Ubuntu23.04]
ok: [Centos7]

TASK [Include vector] **********************************************************

TASK [vector : Download] *******************************************************
changed: [Ubuntu23.04]
changed: [Centos7]
changed: [Centos8]

TASK [vector : Unarchive] ******************************************************
changed: [Ubuntu23.04]
changed: [Centos8]
changed: [Centos7]

TASK [vector : pause] **********************************************************
Pausing for 3 seconds
(ctrl+C then 'C' = continue early, ctrl+C then 'A' = abort)
ok: [Centos7]

TASK [vector : Cp bin] *********************************************************
changed: [Centos8]
changed: [Ubuntu23.04]
changed: [Centos7]

TASK [vector : cp config] ******************************************************
changed: [Ubuntu23.04]
changed: [Centos7]
changed: [Centos8]

PLAY RECAP *********************************************************************
Centos7                    : ok=6    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
Centos8                    : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
Ubuntu23.04                : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running default > idempotence

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [Ubuntu23.04]
ok: [Centos8]
ok: [Centos7]

TASK [Include vector] **********************************************************

TASK [vector : Download] *******************************************************
ok: [Ubuntu23.04]
ok: [Centos8]
ok: [Centos7]

TASK [vector : Unarchive] ******************************************************
ok: [Centos8]
ok: [Ubuntu23.04]
ok: [Centos7]

TASK [vector : pause] **********************************************************
Pausing for 3 seconds
(ctrl+C then 'C' = continue early, ctrl+C then 'A' = abort)
ok: [Centos7]

TASK [vector : Cp bin] *********************************************************
ok: [Centos7]
ok: [Centos8]
ok: [Ubuntu23.04]

TASK [vector : cp config] ******************************************************
ok: [Centos7]
ok: [Ubuntu23.04]
ok: [Centos8]

PLAY RECAP *********************************************************************
Centos7                    : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
Centos8                    : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
Ubuntu23.04                : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier

PLAY [Verify] ******************************************************************

TASK [Example assertion] *******************************************************
ok: [Centos7] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [Centos8] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [Ubuntu23.04] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *********************************************************************
Centos7                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
Centos8                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
Ubuntu23.04                : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=Centos7)
changed: [localhost] => (item=Centos8)
changed: [localhost] => (item=Ubuntu23.04)

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item=Centos7)
changed: [localhost] => (item=Centos8)
changed: [localhost] => (item=Ubuntu23.04)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```

<details>

## Tox

[Vector-role](https://github.com/maks1001281/vector-role/tree/master/vector)
