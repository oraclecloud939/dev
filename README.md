Ecco una possibile struttura di cartelle e file Terraform per deployare macchine virtuali su un server KVM/QEMU Debian partendo da un template Windows 10:

terraform-kvm-windows/
├── modules/
│   └── vm/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── templates/
│   └── cloud-init/
│       └── user-data.tpl
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
└── README.md


# Terraform KVM Windows Deployment

Questa configurazione Terraform permette di deployare macchine virtuali Windows su un server KVM/QEMU Debian a partire da un template QCOW2 preesistente.

## Prerequisiti

* Un server Debian con KVM e QEMU installati e configurati.
* `libvirt` installato e il servizio in esecuzione.
* Un template QCOW2 di Windows 10 disponibile sul server.
* Terraform installato sulla macchina da cui si esegue la configurazione.
* (Opzionale) Configurazione SSH o WinRM sulla macchina virtuale template per il provisioning post-creazione.

## Configurazione

1.  **Clonare questo repository (o creare la struttura di cartelle).**
2.  **Modificare il file `terraform.tfvars`** per specificare i percorsi corretti e altre variabili globali.
3.  **Verificare il percorso del template Windows 10** in `terraform.tfvars`.
4.  **Personalizzare le istanze delle macchine virtuali** nel file `main.tf` (nome, memoria, CPU, ecc.).
5.  **(Opzionale) Creare file di user-data** nella cartella `templates/cloud-init/` e configurarli nel modulo della VM in `main.tf`.

## Utilizzo

1.  **Inizializzare Terraform:**
    ```bash
    terraform init
    ```
2.  **Pianificare la creazione delle risorse:**
    ```bash
    terraform plan
    ```
3.  **Applicare la configurazione per creare le macchine virtuali:**
    ```bash
    terraform apply
    ```
4.  **Visualizzare gli output (come gli indirizzi IP):**
    ```bash
    terraform output
    ```
5.  **Per distruggere le risorse create:**
    ```bash
    terraform destroy
    ```

## Personalizzazione

* **Aggiungere altre macchine virtuali** duplicando il blocco `module` in `main.tf` e modificando i parametri.
* **Modificare le risorse della macchina virtuale** nel file `modules/vm/main.tf` (aggiungere dischi, interfacce di rete, ecc.).
* **Implementare il provisioning post-creazione** utilizzando il provisioner `remote-exec` (richiede SSH o WinRM configurato nel template Windows).
* **Esplorare l'utilizzo di `cloud-init`** per la personalizzazione iniziale di Windows (potrebbe richiedere software di terze parti).