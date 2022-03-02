# FinOps Restrict VM Sizes

## Only Allow specific VM SKU's

This Azure Policy will not allow the deployment of other VM's SKU that are not Standard_A0,Standard_A1 or Standard_D1
### Policy Definition
```json
{
"mode": "All",
"policyRule": {
    "policyRule": {
        "if": {
            "allOf": [
                { 
                "field": "type",
                "equals": "Microsoft.Compute/virtualMachines"
                },
                {
                "not": {
                    "field": "Microsoft.Compute/virtualMachines/sku.name",
                    "in": ["Standard_A0", "Standard_A1","Standard_D1"]
                    }
                }
            ]
        },
        "then": {
            "effect": "deny"
        }
    }
}
```

### Terraform Policy Creation

```javascript
resource "azurerm_policy_definition" "enforce-vm-size-policy" {
  name                = "enforce-vm-size-policy"
  policy_type         = "Custom"
  mode                = "All"
  management_group_id = azurerm_management_group.example.group_id

  policy_rule = <<POLICY_RULE
    {
        "if": {
            "allOf": [
                { 
                "field": "type",
                "equals": "Microsoft.Compute/virtualMachines"
                },
                {
                "not": {
                    "field": "Microsoft.Compute/virtualMachines/sku.name",
                    "in": ["Standard_A0", "Standard_A1","Standard_D1"]
                    }
                }
            ]
        },
        "then": {
            "effect": "deny"
        }
    }
POLICY_RULE


}
```
### Terraform Policy Assignment

```javascript
resource "azurerm_management_group_policy_assignment" "example" {
  name                 = "example-policy"
  policy_definition_id = azurerm_policy_definition.enforce-vm-size-policy.id
  management_group_id  = azurerm_management_group.example.id
}
```

