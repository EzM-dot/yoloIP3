#!/usr/bin/env python3

import json
import subprocess
import sys
import os

def get_tf_output():
    try:
        tf_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'terraform')
        result = subprocess.run(
            ['terraform', 'output', '-json'],
            cwd=tf_dir,
            capture_output=True,
            text=True,
            check=True
        )
        return json.loads(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error getting Terraform output: {e}", file=sys.stderr)
        return {}

def main():
    if len(sys.argv) == 2 and sys.argv[1] == '--list':
        tf_output = get_tf_output()
        
        inventory = {
            '_meta': {
                'hostvars': {}
            },
            'all': {
                'hosts': [],
                'vars': {}
            },
            'app_servers': {
                'hosts': [],
                'vars': {}
            }
        }

        if 'instance_ips' in tf_output:
            instance_ips = tf_output['instance_ips']['value']
            for i, ip in enumerate(instance_ips, 1):
                hostname = f'app-server-{i}'
                inventory['all']['hosts'].append(hostname)
                inventory['app_servers']['hosts'].append(hostname)
                inventory['_meta']['hostvars'][hostname] = {
                    'ansible_host': ip,
                    'ansible_user': 'ubuntu',
                    'ansible_ssh_private_key_file': '~/.ssh/id_ed25519'
                }

        print(json.dumps(inventory, indent=2))
    else:
        print("Usage: {} --list".format(sys.argv[0]))
        sys.exit(1)

if __name__ == '__main__':
    main()
