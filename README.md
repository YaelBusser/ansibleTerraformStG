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

---

## 🧪 Comment tester ce POC (Sans infrastructure réelle)

Dans le cadre d'une démonstration ou d'une évaluation où les 48 machines Windows de production ne sont pas disponibles, il est possible de valider le fonctionnement de ce code en toute sécurité.

### 1. Vérification syntaxique (Syntax Check)
Permet de s'assurer que le code Ansible et Terraform est valide et bien structuré.

**Ansible :**
```bash
ansible-playbook ansible/playbooks/update_nvidia.yml --syntax-check
```

**Terraform :**
```bash
cd terraform
terraform init
terraform validate
```

### 2. Simulation d'exécution (Dry Run)
C'est la méthode idéale pour une démonstration. Les outils simulent l'exécution et affichent les changements qu'ils feraient, **sans modifier le moindre paramètre réel**.

**Ansible (Nécessite une connexion WinRM vers au moins une machine cible joignable) :**
```bash
# Le paramètre -C (ou --check) active le mode simulation
ansible-playbook ansible/playbooks/update_nvidia.yml -C --limit plateforme1
```

**Terraform :**
```bash
cd terraform
terraform plan
```
