### Main uses of Ansible:
- Configuring VM
- Infrastructure Provisioning using YAML configuration
- Security compliance

### To configure a system, Ansible needs several main artifacts:
- **Hosts**: Target system that Ansible will configure
- **Inventory**: This is a file in INI or YAML format that contains the list of target hosts; this can also be a script
- **Playbook**: This is a script that will be executed to configure hosts.

By default, the Ansible configuration file is located at: `/etc/ansible/ansible.cfg`

### Running Ansible Playbooks:

To execute:
```bash
ansible-playbook -i inventory playbook.yml

### Running in Preview mode:
ansible-playbook -i inventory playbook.yml --check

### Running with verbosity
ansible-playbook -i inventory playbook.yml -v


### Explanation:
- Headings (`###`) are used to categorize different sections.
- Code blocks (denoted by triple backticks \`\`\`) are used for command examples.
- Bulleted lists (`-`) are used to list different options and explanations.
- The command examples (`ansible-playbook ...`) are formatted as code blocks to distinguish them from the explanatory text.

This format ensures clarity and readability, especially for technical instructions and commands.


