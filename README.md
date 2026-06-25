# POC: Automatisation Infrastructure StG

Ce dépôt contient le code de preuve de concept (POC) pour l'automatisation du déploiement et des mises à jour des 48 machines du simulateur StG (4 plateformes de 12 machines).

## Ansible (Gestion de Configuration)
Les playbooks Ansible orchestrent les mises à jour logicielles (Windows, NVIDIA, composants du simulateur).
- Exécution depuis le nœud central AlmaLinux.
- Les installeurs sont stockés localement sur le nœud de contrôle dans `/opt/stg/depot/`.
- Connexion Agentless via WinRM vers les hôtes Windows.

### Exemples d'utilisation

```bash
# Mettre à jour les drivers NVIDIA sur la plateforme 1
ansible-playbook ansible/playbooks/update_nvidia.yml --limit plateforme1

# Déployer une nouvelle version du simulateur (ex: 2.4.1) sur la plateforme 2
ansible-playbook ansible/playbooks/update_stg.yml --limit plateforme2 --extra-vars "stg_version=2.4.1"
```

## Terraform (Provisioning)
Définition déclarative de l'infrastructure virtuelle sous-jacente des plateformes StG (exemple via VMware vSphere).


