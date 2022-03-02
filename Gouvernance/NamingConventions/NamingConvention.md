
# FinOps Naming Conventions

## Enforce RG Naming Convention

This policy enforces naming convention for resources group. For the moment there is no support for regular expressions in Azure Policies.

### Policy Definition
```json
 {
                    "if": {
                        "allOf": [
                            {
                                "field": "type",
                                "equals": "Microsoft.Resources/subscriptions/resourceGroups"
                            },
                            // 2 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-............................."
                                }
                            },
                            // 3 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-............................."
                                }
                            },
                            // 4 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-............................."
                                }
                            },
                            // 5 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-............................."
                                }
                            },
                            // 6 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-............................."
                                }
                            },
                            // 7 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-............................."
                                }
                            },
                            // 8 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-............................."
                                }
                            },
                            // 9 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-............................."
                                }
                            },
                            // 10 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-............................."
                                }
                            },
                            // 11 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-............................."
                                }
                            },
                            // 12 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-............................."
                                }
                            }
                        ]
                    },
                    "then": {
                        "effect": "deny"
                    }
                }
        
    
```

### Terraform Policy Creation

```javascript
resource "azurerm_policy_definition" "enforce_name_convention_resource_group" {
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
                            // 2 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..-rg-............................."
                                }
                            },
                            // 3 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...-rg-............................."
                                }
                            },
                            // 4 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "....-rg-............................."
                                }
                            },
                            // 5 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".....-rg-............................."
                                }
                            },
                            // 6 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "......-rg-............................."
                                }
                            },
                            // 7 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".......-rg-............................."
                                }
                            },
                            // 8 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "........-rg-............................."
                                }
                            },
                            // 9 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": ".........-rg-............................."
                                }
                            },
                            // 10 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "..........-rg-............................."
                                }
                            },
                            // 11 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "...........-rg-............................."
                                }
                            },
                            // 12 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-.."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-..."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-...."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-....."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-............."
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "............-rg-............................."
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
  policy_definition_id = azurerm_policy_definition.enforce_name_convention_resource_group.id
  management_group_id  = azurerm_management_group.example.id
}
```




## Enforce Resource Naming Convention

This policy enforces naming convention for specfic resources

### Policy Definition
```json
 {
                    "if": {
                        "allOf": [
                            {
                                "field": "type",
                                "equals": "[[parameters('resourceType')]" //Use an additional left bracket here, so the function is not invoked in the ARM template itself: https://docs.microsoft.com/en-us/azure/azure-resource-manager/template-expressions#escape-characters 
                            },
                            // 2 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 3 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 4 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 5 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 6 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 7 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 8 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 9 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 10 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 11 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 12 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            }
                        ]
                    },
                    "then": {
                        "effect": "deny"
                    }
                }
        
```
### Terraform Policy Creation

```javascript
resource "azurerm_policy_definition" "enforce_name_convention_resource" {
  name                = "policy-naming-convention"
  policy_type         = "Custom"
  mode                = "All"
  management_group_id = azurerm_management_group.example.group_id

  policy_rule = <<POLICY_RULE
   {
                    "if": {
                        "allOf": [
                            {
                                "field": "type",
                                "equals": "[[parameters('resourceType')]" //Use an additional left bracket here, so the function is not invoked in the ARM template itself: https://docs.microsoft.com/en-us/azure/azure-resource-manager/template-expressions#escape-characters 
                            },
                            // 2 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 3 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 4 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('....-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 5 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.....-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 6 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('......-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 7 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.......-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 8 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('........-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 9 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('.........-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 10 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('..........-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 11 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('...........-', parameters('resourceAbbreviation'), '-.............................')]"
                                }
                            },
                            // 12 symbol prefix
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'))]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-.')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-..')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-...')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-.....')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-.............')]"
                                }
                            },
                            {
                                "not": {
                                    "field": "name",
                                    "match": "[[concat('............-', parameters('resourceAbbreviation'), '-.............................')]"
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
  policy_definition_id = azurerm_policy_definition.policy_naming_convention.id
  management_group_id  = azurerm_management_group.example.id
}
```


