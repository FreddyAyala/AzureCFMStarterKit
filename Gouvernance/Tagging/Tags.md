
# FinOps Azure Tags

## Inherit a tag from the resource group

This policy adds or replaces the specified tag and value from the parent resource group when any resource is created or updated. Existing resources can be remediated by triggering a remediation task.

### Policy Definition
```json
{
"mode": "All",
"policyRule": {
      "if": {
        "allOf": [
          {
            "field": "[concat('tags[', parameters('tagName'), ']')]",
            "notEquals": "[resourceGroup().tags[parameters('tagName')]]"
          },
          {
            "value": "[resourceGroup().tags[parameters('tagName')]]",
            "notEquals": ""
          }
        ]
      },
      "then": {
        "effect": "modify",
        "details": {
          "roleDefinitionIds": [
            "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
          ],
          "operations": [
            {
              "operation": "addOrReplace",
              "field": "[concat('tags[', parameters('tagName'), ']')]",
              "value": "[resourceGroup().tags[parameters('tagName')]]"
            }
          ]
        }
      }
    }
```

### Terraform Policy Assignment

Assign this policy at the subscription level

```javascript
data "azurerm_subscription" "current" {
}

resource "azurerm_policy_assignment" "finops-inherit-tag" {
  name                 = "finops-inherit-tag"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cd3aa116-8754-49c9-a813-ad46512ece54"
  description          = "This policy adds or replaces the specified tag and value from the parent resource group when any resource is created or updated. Existing resources can be remediated by triggering a remediation task."
  display_name         = "FinOpsInheritTag"

}
```

Furthermore you should repeat this code for each subscription, otherwise you can do the Azure Policy assignment at the managent group level using:

```javascript
resource "azurerm_management_group_policy_assignment" "finops-inherit-tag" {
  name                 = "example-policy"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cd3aa116-8754-49c9-a813-ad46512ece54"
  management_group_id  = azurerm_management_group.example.id
}
```


## Require a tag on resource groups

Enforces existence of a tag on resource groups. Can be used to enforce tags such as CostCenter at the resource group level. 

### Policy Definition
```json
{
  "mode": "All",
  "policyRule":
{
      "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Resources/subscriptions/resourceGroups"
          },
          {
            "field": "[concat('tags[', parameters('tagName'), ']')]",
            "exists": "false"
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
}
```

### Terraform Policy Assignment

Assign this policy at the subscription level. 

```javascript
data "azurerm_subscription" "current" {
}

resource "azurerm_policy_assignment" "finops-cost-center-tag" {
  name                 = "finops-cost-center-tag"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8ce3da23-7156-49e4-b145-24f95f9dcb46"
  description          = "Enforces existence of a cost center tag on resource groups."
  display_name         = "FinOpsEnforceCostCenterTag"

  parameters = <<PARAMETERS
{
  "tagName": {
    "value": [ "CostCenter" ]
  }
}
PARAMETERS

}
```

To enforce several tags assignment needs to be repeated for each tag.

```javascript
data "azurerm_subscription" "current" {
}

resource "azurerm_policy_assignment" "finops-cost-center-tag" {
  name                 = "finops-cost-center-tag"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8ce3da23-7156-49e4-b145-24f95f9dcb46"
  description          = "Enforces existence of a cost center tag on resource groups."
  display_name         = "FinOpsEnforceCostCenterTag"

  parameters = <<PARAMETERS
{
  "tagName": {
    "value": [ "CostCenter" ]
  }
}
PARAMETERS

}

resource "azurerm_policy_assignment" "finops-cost-center-tag" {
  name                 = "finops-owner-tag"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8ce3da23-7156-49e4-b145-24f95f9dcb46"
  description          = "Enforces existence of a cost center tag on resource groups."
  display_name         = "FinOpsEnforceOwnerTag"

  parameters = <<PARAMETERS
{
  "tagName": {
    "value": [ "Owner" ]
  }
}
PARAMETERS

}
```

Furthermore you should repeat this code for each subscription, otherwise you can do the Azure Policy assignment at the management group level using:

```javascript
resource "azurerm_management_group_policy_assignment" "finops-inherit-tag" {
  name                 =  "finops-owner-tag"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/8ce3da23-7156-49e4-b145-24f95f9dcb46"
  management_group_id  = azurerm_management_group.example.id

  parameters = <<PARAMETERS
{
  "tagName": {
    "value": [ "Owner" ]
  }
}
PARAMETERS
  
}
```

## Enforce Multiple Tags on resource groups

This is the best way to enforce multiples tags at resource level group. Combine this with the inherit tags policy and you can make sure that all your resources are tagged.

You have to add as many of te following block as Tags you want to enforce:
```json
{
            "not": {
              "field": "tags['Owner']",
              "exists": "true"
            }
}
```

There doesn't seem to be a way to just pass an array with the tags to be enforced, this is a limitation of the the Azure Policies domain specific language (https://docs.microsoft.com/en-us/azure/governance/policy/how-to/author-policies-for-arrays)


### Policy Definition
```json
{
  "mode": "All",
  "policyRule": {
    "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.Resources/subscriptions/resourceGroups"
        },
        {
          "not": {
            "field": "tags['CostCenter']",
            "exists": "true"
          }
        },
        {
          "not": {
            "field": "tags['Owner']",
            "exists": "true"
          }
        }
      ]
    },
    "then": {
      "effect": "deny"
    }
  },
  "parameters": {}
}
```


### Terraform Policy Creation

```javascript
resource "azurerm_policy_definition" "enforce-tags-policy" {
  name                = "policy-finops-enforce-tags"
  policy_type         = "Custom"
  mode                = "All"
  management_group_id = azurerm_management_group.example.group_id

  policy_rule = <<POLICY_RULE
    {
      "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Resources/subscriptions/resourceGroups"
          },
          {
            "not": {
              "field": "tags['CostCenter']",
              "exists": "true"
            }
          },
          {
            "not": {
              "field": "tags['Owner']",
              "exists": "true"
            }
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
  }
POLICY_RULE


}
```
### Terraform Policy Assignment

```javascript
resource "azurerm_management_group_policy_assignment" "example" {
  name                 = "example-policy"
  policy_definition_id = azurerm_policy_definition.enforce-tags-policy.id
  management_group_id  = azurerm_management_group.example.id
}
```

## Tag Resources Using Terraform

Most resources can be tagged in the following way using terraform:

```javascript
resource "azurerm_log_analytics_workspace" "TF" {
  name                = "loga-01"
  location            = azurerm_resource_group.TF.location
  resource_group_name = azurerm_resource_group.TF.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    env = "prod"
    costcentre = "corp"
  }
   
}
```
