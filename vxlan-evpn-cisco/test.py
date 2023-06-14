# use netmiko to login to cisco nexus and extract interface config
# use a function to get the interface config

from netmiko import ConnectHandler

"""_summary_ : use netmiko to login to cisco nexus and extract interface config
_param_ : device - dictionary of device details
"""


def get_interface_config(device, interface):
    net_connect = ConnectHandler(**device)
    output = net_connect.send_command("show run interface {}".format(interface))
    # format the output into a list then output as json
    json_output = {"interface": interface, "config": output}

    # pretty print the json output
    import json

    print(json.dumps(json_output, indent=4, sort_keys=True))


if __name__ == "__main__":
    device = {"device_type": "cisco_nxos", "host": "10.100.105.3", "username": "admin", "password": "cisco"}
    get_interface_config(device, "Ethernet1/1")
