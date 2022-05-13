# Multitenant environment provisioning on Oracle Cloud Infrastructure (OCI)

This terraform module provides a terraform automation for provisioning a multitenant environment on Oracle Cloud Infrastructure.

It supports a highly configurable input set of parameters for provisioning the tenants topology for IAM Compartments, Networking and native Monitoring by leveraging OCI events. 

The input parameters, by using `*.auto.tfvars`, support almost any compartments and networking topology configuration without the need for the user to touch the `*.tf` files.

## Provisioned layers

### IAM Compartments

It supports the provisioning of any hierarchical structure of IAM Compartments. 

* Creating up to 6(OCI limit) hierarchical(one to another) compartments
  * ![\label{mylabel}](images/compartment_levels.PNG) 

***Example:***

Bellow you can see a 6 layers compartments structure:

![\label{mylabel}](images/CompStructure1.jpg) 
![\label{mylabel}](images/CompStructure2.jpg) 

To provision such a topology, the needed input in the ```*.auto.tfvars``` is:

```
opco_compartments_config = {
  default_compartment_id = "ocid1.tenancy.oc1..aaaaaa ..."
  default_defined_tags   = {}
  default_freeform_tags  = null
  compartments = {
    cmp-virginmedia = {
      description    = "Compartment holding resources of OpCo"
      compartment_id = "ocid1.tenancy.oc1..aaaaaaaaxzpx ..."
      defined_tags   = null
      freeform_tags  = null
      enable_delete  = true
      sub_compartments = {
        cmp-vm-shared = {
          description   = "Shared Services for OpCo [optional, can be used if not consumed from cmp-central]"
          defined_tags  = null
          freeform_tags = null
          enable_delete = true
          sub_compartments = {
            cmp-vm-s-security = {
              description      = "Security Services for OpCo [optional, can be used if not consumed from cmp-central"
              defined_tags     = null
              freeform_tags    = null
              enable_delete    = true
              sub_compartments = {}
            }
            cmp-vm-s-networking = {
              description      = "Networking Services for OpCo [optional, can be used if not consumed from cmp-central"
              defined_tags     = null
              freeform_tags    = null
              enable_delete    = true
              sub_compartments = {}
            }
            cmp-vm-s-foundation = {
              description      = "Foundation Services for OpCo [optional, can be used if not consumed from cmp-central"
              defined_tags     = null
              freeform_tags    = null
              enable_delete    = true
              sub_compartments = {}
            }
          }
        }
        cmp-vm-nonprod = {
          description   = "Compartment for Non-Prod resources of OpCo"
          defined_tags  = null
          freeform_tags = null
          enable_delete = true
          sub_compartments = {
            cmp-vm-n-dept1 = {
              description   = "Compartment for Non-Prod resources of OpCo/Department"
              defined_tags  = null
              freeform_tags = null
              enable_delete = true
              sub_compartments = {
                cmp-vm-n-dept1-mobile = {
                  description   = "Compartment for Non-Prod resources of OpCo/Department/Project (for DB admins)"
                  defined_tags  = null
                  freeform_tags = null
                  enable_delete = true
                  sub_compartments = {
                    cmp-vm-n-dept1-mobile-db = {
                      description      = "Compartment for Non-Prod resources of OpCo/Department/Project (for DB admins)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                    cmp-vm-n-dept1-mobile-app = {
                      description      = "Compartment for Non-Prod resources of OpCo/Department/Project (for App admins)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                    cmp-vm-n-dept1-mobile-infra = {
                      description      = "Compartment for Non-Prod resources of OpCo/Department/Project (for Infra admins - optional)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                  }
                }
                cmp-vm-n-dept1-media = {
                  description   = "Compartment for Non-Prod resources of OpCo/Department/Project (for DB admins)"
                  defined_tags  = null
                  freeform_tags = null
                  enable_delete = true
                  sub_compartments = {
                    cmp-vm-n-dept1-media-db = {
                      description      = "Compartment for Non-Prod resources of OpCo/Department/Project (for DB admins)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                    cmp-vm-n-dept1-media-app = {
                      description      = "Compartment for Non-Prod resources of OpCo/Department/Project (for App admins)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                    cmp-vm-n-dept1-media-infra = {
                      description      = "Compartment for Non-Prod resources of OpCo/Department/Project (for Infra admins - optional)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                  }
                }
              }
            }
            cmp-vm-n-dept2 = {
              description      = "Compartment for Non-Prod resources of OpCo/Department"
              defined_tags     = null
              freeform_tags    = null
              enable_delete    = true
              sub_compartments = {}
            }
          }
        }
        cmp-vm-prod = {
          description   = "Compartment for Prod resources of OpCo"
          defined_tags  = null
          freeform_tags = null
          enable_delete = true
          sub_compartments = {
            cmp-vm-p-dept1 = {
              description   = "Compartment for Prod resources of OpCo/Department"
              defined_tags  = null
              freeform_tags = null
              enable_delete = true
              sub_compartments = {
                cmp-vm-p-dept1-mobile = {
                  description   = "Compartment for Prod resources of OpCo/Department/Project (for DB admins)"
                  defined_tags  = null
                  freeform_tags = null
                  enable_delete = true
                  sub_compartments = {
                    cmp-vm-p-dept1-mobile-db = {
                      description      = "Compartment for Prod resources of OpCo/Department/Project (for DB admins)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                    cmp-vm-p-dept1-mobile-app = {
                      description      = "Compartment for Prod resources of OpCo/Department/Project (for App admins)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                    cmp-vm-p-dept1-mobile-infra = {
                      description      = "Compartment for Prod resources of OpCo/Department/Project (for Infra admins - optional)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                  }
                }
                cmp-vm-p-dept1-media = {
                  description   = "Compartment for Prod resources of OpCo/Department/Project (for DB admins)"
                  defined_tags  = null
                  freeform_tags = null
                  enable_delete = true
                  sub_compartments = {
                    cmp-vm-p-dept1-media-db = {
                      description      = "Compartment for Prod resources of OpCo/Department/Project (for DB admins)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                    cmp-vm-p-dept1-media-app = {
                      description      = "Compartment for Prod resources of OpCo/Department/Project (for App admins)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                    cmp-vm-p-dept1-media-infra = {
                      description      = "Compartment for Prod resources of OpCo/Department/Project (for Infra admins - optional)"
                      defined_tags     = null
                      freeform_tags    = null
                      enable_delete    = true
                      sub_compartments = {}
                    }
                  }
                }
              }
            }
            cmp-vm-p-dept2 = {
              description      = "Compartment for Prod resources of OpCo/Department"
              defined_tags     = null
              freeform_tags    = null
              enable_delete    = true
              sub_compartments = {}
            }
          }
        }
      }
      cmp-vm-poc = {
        description      = "Compartment for Poc/Sandbox resources of OpCo"
        defined_tags     = null
        freeform_tags    = null
        enable_delete    = true
        sub_compartments = {}
      }
    }
  }
}
```

As one can notice the only file that needs to be editated in ```*.auto.tfvars``` and not a ```*.tf``` file.

Concerning the ```opco_compartments_config``` variable definition, this is how it looks like:

```
variable "opco_compartments_config" {
  type = object({
    default_compartment_id = string,
    default_defined_tags   = map(string),
    default_freeform_tags  = map(string),
    compartments = map(object({
      description    = string,
      compartment_id = string,
      defined_tags   = map(string),
      freeform_tags  = map(string),
      enable_delete  = bool,
      sub_compartments = map(object({
        description   = string,
        defined_tags  = map(string),
        freeform_tags = map(string),
        enable_delete = bool,
        sub_compartments = map(object({
          description   = string,
          defined_tags  = map(string),
          freeform_tags = map(string),
          enable_delete = bool,
          sub_compartments = map(object({
            description   = string,
            defined_tags  = map(string),
            freeform_tags = map(string),
            enable_delete = bool,
            sub_compartments = map(object({
              description   = string,
              defined_tags  = map(string),
              freeform_tags = map(string),
              enable_delete = bool,
              sub_compartments = map(object({
                description   = string,
                defined_tags  = map(string),
                freeform_tags = map(string),
                enable_delete = bool
              }))
            }))
          }))
        }))
      }))
    }))
  })
  description = "Parameters to provision zero, one or multiple compartments"
}
```

As you can see it supports a maximum of 6 layers of sub-compartments in any topology.


- First 3 atributes: 
   - ```default_compartment_id = string``` - if in the 1st layer of compartments defined in the hierarchy the ```compartment_id``` attribute is missing then ```default_compartment_id``` value will be used

   - ```default_defined_tags = map(string)```  - if any of the compartments in the hierarchy are missing the ```defined_tags``` attribute then the ```default_defined_tags``` value will be used.

   - ```default_freeform_tags = map(string)``` - if any of the compartments in the hierarchy are missing the ```freeform_tags``` attribute then the ```freeform_tags``` value will be used.

- Top hierarchy compartments definition: 

```
compartments = map(object({
      description    = string,
      compartment_id = string,
      defined_tags   = map(string),
      freeform_tags  = map(string),
      enable_delete  = bool,
      sub_compartments = ...
```

You can define here as many top layer compartments as you need having as many subcompartments as you want. The only limitation is that you can only have a max of 6 layers of hierarchical compartments.

The name of the compartment will be the key of the key/value pair entity you're defining.

```
    cmp-virginmedia = {
      description    = "Compartment holding resources of OpCo"
      compartment_id = "ocid1.tenancy.oc1..aaa... "
      defined_tags   = null
      freeform_tags  = null
      enable_delete  = true
      sub_compartments = { ...
```

- Parent compartments:
    - The ```compartment_id``` needs to be provided for the top compartment of your hierarchy.
    - The parent compartment of the lower layers will be the one where you defined the curent compartment under:

```
 compartments = {
    cmp-virginmedia = {
      description    = "Compartment holding resources of OpCo"
      compartment_id = "ocid1.tenancy.oc1..aaa ..."
      defined_tags   = null
      freeform_tags  = null
      enable_delete  = true
      sub_compartments = {
        cmp-vm-shared = {
          description   = "Shared Services for OpCo [optional, can be used if not consumed from cmp-central]"
          defined_tags  = null
          freeform_tags = null
          enable_delete = true
          sub_compartments = {
```

Please note that the values keys are used as resources/object names in OCI.

### Networking

This automation provides the option to create 2 categories of network constructs under a tenant:
- **non-poc networking** - this is will be dedicated for production environments, development environments, test environments and other environmnets that are facilitating the production environment processes.
- **poc networking** - this will be dedicated for everything else that is not tight/related to a production environment. Any environment or PoCs, education processes, evaluations and others will go into this category.

For each category you'll be able to define the follow:
 - any number of VCNs with the following configurations: 
    - compartment_name
    - cidr block
    - dns_label
    - IGW exposure
    - DRG attachment
    - NAT enablement
    - define tags
    - freeform tags
    - any number of subnets in the current VCN with the following configuration:
        - compartment_name
        - cidr
        - dns_label
        - private or public subnet
        - dhcp options
        - freeform tags
        - define tags
        - any number of security lists that will be asociated with this subnet
- All the VCNs defined in one of the 2 categories will also share the following attributes:
    - ```default_network_compartment_name``` - if inside the VCNs definition there is a component missing the compartment attribute then this value will be used.
    - ```service_label``` - this will be the service label used by all the VCNs in this category 
    - ```service_gateway_cidr``` - this will be the service gw cidr used by all the vcns in this category
    - ```drg_id``` - this will be the drg shared by all the vcns in this category.

Concerning the ```networking``` variable definition, this is how it looks like:

```
variable "networking" {
  description = "The VCNs."
  type = object({
    non_poc_networking = object({
      default_network_compartment_name = string,
      service_label                    = string,
      service_gateway_cidr             = string,
      drg_id                           = string,
      vcns = map(object({
        compartment_name  = string,
        cidr              = string,
        dns_label         = string,
        is_create_igw     = bool,
        is_attach_drg     = bool,
        block_nat_traffic = bool,
        defined_tags      = map(string),
        freeform_tags     = map(string),
        subnets = map(object({
          compartment_name = string,
          cidr             = string,
          dns_label        = string,
          private          = bool,
          dhcp_options_id  = string,
          defined_tags     = map(string),
          freeform_tags    = map(string),
          security_lists = map(object({
            is_create      = bool,
            compartment_id = string,
            defined_tags   = map(string),
            freeform_tags  = map(string),
            ingress_rules = list(object({
              is_create    = bool,
              stateless    = bool,
              protocol     = string,
              description  = string,
              src          = string,
              src_type     = string,
              src_port_min = number,
              src_port_max = number,
              dst_port_min = number,
              dst_port_max = number,
              icmp_type    = number,
              icmp_code    = number
            })),
            egress_rules = list(object({
              is_create    = bool,
              stateless    = bool,
              protocol     = string,
              description  = string,
              dst          = string,
              dst_type     = string,
              src_port_min = number,
              src_port_max = number,
              dst_port_min = number,
              dst_port_max = number,
              icmp_type    = number,
              icmp_code    = number
            }))
          }))
        }))
      }))
    })
    poc_networking = object({
      default_network_compartment_name = string,
      service_label                    = string,
      service_gateway_cidr             = string,
      drg_id                           = string,
      vcns = map(object({
        compartment_name  = string,
        cidr              = string,
        dns_label         = string,
        is_create_igw     = bool,
        is_attach_drg     = bool,
        block_nat_traffic = bool,
        defined_tags      = map(string),
        freeform_tags     = map(string),
        subnets = map(object({
          compartment_name = string,
          cidr             = string,
          dns_label        = string,
          private          = bool,
          dhcp_options_id  = string,
          defined_tags     = map(string),
          freeform_tags    = map(string),
          security_lists = map(object({
            is_create      = bool,
            compartment_id = string,
            defined_tags   = map(string),
            freeform_tags  = map(string),
            ingress_rules = list(object({
              is_create    = bool,
              stateless    = bool,
              protocol     = string,
              description  = string,
              src          = string,
              src_type     = string,
              src_port_min = number,
              src_port_max = number,
              dst_port_min = number,
              dst_port_max = number,
              icmp_type    = number,
              icmp_code    = number
            })),
            egress_rules = list(object({
              is_create    = bool,
              stateless    = bool,
              protocol     = string,
              description  = string,
              dst          = string,
              dst_type     = string,
              src_port_min = number,
              src_port_max = number,
              dst_port_min = number,
              dst_port_max = number,
              icmp_type    = number,
              icmp_code    = number
            }))
          }))
        }))
      }))
    })
  })
}
```

***Example***

I'll demonstrate how it can be defined in the ```*.auto.tfvars``` a networking topology like the one presented in the diagram bellow.

![\label{mylabel}](images/networking_tenant.jpg) 

One will just need to edit the ```*.auto.tfvars``` and not a ```*.tf``` file and provide the following configuration in order to obtain the network topology from the above diagram:

```
networking = {

  # NON-POC VCNs
  non_poc_networking = {
    default_network_compartment_name = "cmp-vm-s-networking"
    service_label                    = "<opco_name>"
    service_gateway_cidr             = "all-services-in-oracle-services-network"
    drg_id                           = null
    vcns = {
      # Production VCN
      production_environments = {
        compartment_name  = "cmp-vm-s-networking"
        cidr              = "10.0.0.0/22"
        dns_label         = "vmprod"
        is_create_igw     = false
        is_attach_drg     = false
        block_nat_traffic = false
        defined_tags      = null
        freeform_tags     = null
        subnets = {
          prod_private_infra = {
            compartment_name = "cmp-vm-s-networking"
            defined_tags     = null
            freeform_tags    = null
            cidr             = "10.0.0.0/24"
            dns_label        = "prdprvinfr"
            dhcp_options_id  = null
            security_lists   = {}
            private          = true
          }
          prod_private_app = {
            compartment_name = "cmp-vm-s-networking"
            defined_tags     = null
            freeform_tags    = null
            cidr             = "10.0.1.0/24"
            dns_label        = "prdprvapp"
            dhcp_options_id  = null
            security_lists   = {}
            private          = true
          }
          prod_private_db = {
            compartment_name = "cmp-vm-s-networking"
            defined_tags     = null
            freeform_tags    = null
            cidr             = "10.0.2.0/24"
            dns_label        = "prdprvdb"
            dhcp_options_id  = null
            security_lists   = {}
            private          = true
          }
        }
      }
      # Non-Production VCN
      non_production_environments = {
        compartment_name  = "cmp-vm-s-networking"
        cidr              = "10.0.4.0/22"
        dns_label         = "vmnonprod"
        is_create_igw     = false
        is_attach_drg     = false
        block_nat_traffic = false
        defined_tags      = null
        freeform_tags     = null
        subnets = {
          nonprod_private_infra = {
            compartment_name = "cmp-vm-s-networking"
            defined_tags     = null
            freeform_tags    = null
            cidr             = "10.0.4.0/24"
            dns_label        = "nprdprvinfr"
            dhcp_options_id  = null
            security_lists   = {}
            private          = true
          }
          nonprod_private_app = {
            compartment_name = "cmp-vm-s-networking"
            defined_tags     = null
            freeform_tags    = null
            cidr             = "10.0.5.0/24"
            dns_label        = "nprdprvapp"
            dhcp_options_id  = null
            security_lists   = {}
            private          = true
          }
          nonprod_private_db = {
            compartment_name = "cmp-vm-s-networking"
            defined_tags     = null
            freeform_tags    = null
            cidr             = "10.0.6.0/24"
            dns_label        = "nprdprvdb"
            dhcp_options_id  = null
            security_lists   = {}
            private          = true
          }
        }
      }
      # Shared VCN
      shared = {
        compartment_name  = "cmp-vm-s-networking"
        cidr              = "10.0.8.0/24"
        dns_label         = "vmshared"
        is_create_igw     = true
        is_attach_drg     = false
        block_nat_traffic = false
        defined_tags      = null
        freeform_tags     = null
        subnets = {
          shared = {
            compartment_name = "cmp-vm-s-networking"
            defined_tags     = null
            freeform_tags    = null
            cidr             = "10.0.8.0/24"
            dns_label        = "pubshared"
            dhcp_options_id  = null
            security_lists   = {}
            private          = false
          }
        }
      }
    }
  }

  # POC VCNs
  poc_networking = {
    default_network_compartment_name = "cmp-vm-s-networking"
    service_label                    = "<opco_name>"
    service_gateway_cidr             = "all-services-in-oracle-services-network"
    drg_id                           = null
    vcns = {
      # POC VCNs
      poc_environments = {
        compartment_name  = "cmp-vm-s-networking"
        cidr              = "192.168.0.0/17"
        dns_label         = "vmpoc"
        is_create_igw     = false
        is_attach_drg     = false
        block_nat_traffic = false
        defined_tags      = null
        freeform_tags     = null
        subnets           = {}
      }
      # POC Shared VCN
      poc_shared = {
        compartment_name  = "cmp-vm-s-networking"
        cidr              = "192.168.128.0/24"
        dns_label         = "pocshared"
        is_create_igw     = true
        is_attach_drg     = false
        block_nat_traffic = false
        defined_tags      = null
        freeform_tags     = null
        subnets = {
          public_poc_shared = {
            compartment_name = "cmp-vm-s-networking"
            defined_tags     = null
            freeform_tags    = null
            cidr             = "192.168.128.0/24"
            dns_label        = "pubpocshared"
            dhcp_options_id  = null
            security_lists   = {}
            private          = false
          }
        }
      }
    }
  }
}
```

Please note that the values keys are used as resources/object names in OCI specifically for VCNs, subnets and security lists.

### Monitoring

This automation provides the option to create a configurable number of monitoring events, that based on the defined rules, will push those events to an OCI Streaming or to a OCI Notification topic.

We need to consider the comparment(s) that will containt the OCI Events as:

"***Rules apply to events in the compartment in which you create them and any child compartments. Create a rule in the compartment with the resource you want to monitor and specify where to deliver matching events. For example, in the ABC compartment, you might create a rule that filters for Autonomous Data Warehouse backup events. Since Events has no requirement about the location of action resources, you could specify a topic in the XYZ compartment as the resource to deliver any matching events.***" - https://docs.oracle.com/en-us/iaas/Content/Events/Task/managingrules.htm#Working

As a consequence, for LG usecase, we'll create 4 categories of OCI Events and allocate them to 4 different compartments:

- ```cmp-<opco-acronym>-shared``` - OCI Events to monitor "*shared*" resources across "*prod*", "*non-prod*" and "*poc*"
- ```cmp-<opco-acronym>-nonprod``` - OCI Events to monitor only "*nonprod*" specific resources
- ```cmp-<opco-acronym>-prod``` - OCI Events to monitor only "*prod*" specific resources
- ```cmp-<opco-acronym>-poc``` - OCI Events to monitor only "*poc*" specific resources

Besides the above OPCO specific OCI Events, at the time of project creation, we'll create project specific OCI Events. We are documenting those in the project specific documentation.

To define events you'll need to provide the following, as part of the ```event_rules``` variable:
 - ```default_compartment_name``` - the compartment to be used if when the ```event_rule``` is defined the ```compartment_name``` is missing.
 - A number of event rules where the ```event_rule``` key will be the ```event_rule``` name
    - ```compartment_name``` - name the of the compartment where the ```event_rule``` will be created
    - ```condition```- the condition that will trigger the event
    - ```description``` - event description
    - ```is_enabled``` - enable or disable the event 
    - ```actions``` : a list of actions to be performed when the event is triggered
        - ```action_type``` - the action type
        - ```is_enabled``` - enable or disable the action
        - ```description``` - action description
        - ```function_id``` - if a calling a function is the action then specify the function ocid
        - ```stream_id``` - if sending a message to a stream is the action then specify stream ocid
        - ```topic_id``` : if sending a message to a notification topic is the action then specify OCI Notification ocid

Concerning the ```event_rules``` variable definition, this is how it looks like:

```
variable "event_rules" {
  description = "Event rules definitions"
  type = object({
    default_compartment_name : string,
    event_rules = map(object({
      compartment_name : string,
      condition : string,
      description : string,
      is_enabled : bool,
      actions : list(object({
        action_type : string,
        is_enabled : bool,
        description : string,
        function_id : string,
        stream_id : string,
        topic_id : string
      })),
    }))
  })
}
```

***Example***

I'll demonstrate how it can be defined in the ```*.auto.tfvars``` an OCI Monitoring Event rules configuration:

```
event_rules = {
  default_compartment_name = "cmp-<opco_acronym>-shared"
  event_rules = {
    # Shared Resources Monitoring
    rule_shared_vcn_create = {
      actions = [{
        action_type = "OSS"
        description = "Write event data on Streaming Service"
        function_id = null
        is_enabled  = true
        stream_id   = "<ocid-stream-ocid>"
        topic_id    = null
      }]
      compartment_name = "cmp-<opco_acronym>-shared"
      condition        = "{\"eventType\": \"com.oraclecloud.virtualnetwork.createvcn\"}"
      description      = "Test Event Rule - Shared VCN Create"
      is_enabled       = true
    }
    rule_shared_vcn_update = {
      actions = [{
        action_type = "OSS"
        description = "Write event data on Streaming Service"
        function_id = null
        is_enabled  = true
        stream_id   = "<ocid-stream-ocid>"
        topic_id    = null
      }]
      compartment_name = "cmp-<opco_acronym>-shared"
      condition        = "{\"eventType\": \"com.oraclecloud.virtualnetwork.updatevcn\"}"
      description      = "Test Event Rule - Shared VCN Update"
      is_enabled       = true
    }

    # PoC Resources Monitoring
    rule_poc_subnet_create = {
      actions = [{
        action_type = "OSS"
        description = "Write event data on Streaming Service"
        function_id = null
        is_enabled  = true
        stream_id   = "<ocid-stream-ocid>"
        topic_id    = null
      }]
      compartment_name = "cmp-<opco_acronym>-poc"
      condition        = "{\"eventType\": \"com.oraclecloud.virtualnetwork.createsubnet\"}"
      description      = "Test Event Rule - PoC Subnet Create"
      is_enabled       = true
    }

    # Production Resources Monitoring

    # Non-Production Resources Monitoring
  }
}

```


### Outputs

 - This module is returning both an hierarchical and a flat structure of the:
    - IAM Compartments
    - Network topology
    - OCI Monitoring Event Rules configuration

that has been provisioned.

We're exposing both versions as flat is easy to consume by other automations where hierarchical is easy to read by end user.

## How to use this module

- Under the module tenants folder you'll find 2 sub-folders
    - ```opcos-complex-input```
    - ```opcos-simple-input```

- Each of those 2 folders will contain a single sub-folder called ```opco-template```

- Whenever you need to add a new opco you copy and paste the template under the same parent folder, edit the ```terraform.tfvars``` and ```*.auto.tfvars```, provide tenant specific input parameters and run your automation.

- When to use ```simple-input``` vs ```complex input``` options: 
    - As you've seen the input partameters are allowing you to define a very dynamic topology but it has it's degree of complexity. 
    - Usualy tenants are sharing the same identity and network topology and it makes sense to hardcode the static values and input data structure in the ```*.tf``` files and just expose to the ```*.auto.tfvars``` the parameters that uniquely caracterize a tenant.
    - To cover the above concept, in the ```simple-input``` folder you'll find the topology hardcoded in the ```.tf``` files and just a few values exposed in the ```*.auto.tfvars``` files. 
    - Now, if you have tenants that represent exceptions to the standard tenant topology you'll want to go to the ```complex-input``` folder where you'll find a template that is exposing the entire complex input parameters in the ```*.auto.tfvars``` allowing for covering a large variety of tenat identity and networking topologies and configurations.
    - A hibrid approach is supported, where you'll have tenants created with the simple input metod and exceptional tenants created using the complex input method. Following the same model you can define multiple categories of tenants.

- More information about how to use tenants templates will be found in the specific template folder ```README.md``` files:
  - Simple input template [README.md](tenants/opcos-simple-input/opco-template/README.md).
  - Complex input template [README.md](tenants/opcos-complex-input/opco-template/README.md).

## Terraform modules that are used by this project

* https://github.com/oracle-terraform-modules/terraform-oci-tdf-iam-compartments/tree/v0.2.4

* https://github.com/oracle-quickstart/oci-cis-landingzone-quickstart/tree/stable-2.3.1.0/modules/network/vcn-basic

* https://github.com/oracle-terraform-modules/terraform-oci-tdf-network-security/tree/v0.9.7

* https://github.com/fsana/oci_terraform_events


## Notes/Issues

- Please note that this module contains a deprecated input value: ```projects``` which was used in the past to create sub-structures inside the tenant. For now please just initialize this with an empty map: ``` projects = {}```.
    - We are providing a different approach for sub-structures of a tenant that will be covered later in this document. 

## Versions

This module has been developed and tested by running terraform on macOS Monterey Version 12.2.1 

```
$ terraform --version
Terraform v1.1.3
on darwin_amd64
+ provider registry.terraform.io/hashicorp/oci v4.64.0
+ provider registry.terraform.io/hashicorp/time v0.7.2

Your version of Terraform is out of date! The latest version
is 1.1.7. You can update by downloading from https://www.terraform.io/downloads.html

```

## Contributing

This project is open source. Oracle appreciates any contributions that are made by the open source community.

## License

Copyright (c) 2022, Oracle and/or its affiliates.

Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

See [LICENSE](LICENSE) for more details.