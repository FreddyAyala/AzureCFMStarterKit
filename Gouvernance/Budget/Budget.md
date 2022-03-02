# FinOps Budgets and alerts

You can use terraform to automate the deployment uf Azure Consumption Budgets and alerts

### Terraform Budget Creation at Resource group Level
```javascript
resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "eastus"
}

resource "azurerm_monitor_action_group" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "example"
}

resource "azurerm_consumption_budget_resource_group" "example" {
  name              = "example"
  resource_group_id = azurerm_resource_group.example.id

  amount     = 1000
  time_grain = "Monthly"

  time_period {
    start_date = "2022-06-01T00:00:00Z"
    end_date   = "2022-07-01T00:00:00Z"
  }

  filter {
    dimension {
      name = "ResourceId"
      values = [
        azurerm_monitor_action_group.example.id,
      ]
    }

    tag {
      name = "foo"
      values = [
        "bar",
        "baz",
      ]
    }
  }

  notification {
    enabled        = true
    threshold      = 90.0
    operator       = "EqualTo"
    threshold_type = "Forecasted"

    contact_emails = [
      "foo@example.com",
      "bar@example.com",
    ]

    contact_groups = [
      azurerm_monitor_action_group.example.id,
    ]

    contact_roles = [
      "Owner",
    ]
  }

  notification {
    enabled   = false
    threshold = 100.0
    operator  = "GreaterThan"

    contact_emails = [
      "foo@example.com",
      "bar@example.com",
    ]
  }
}
```

### Terraform Budget Creation at Subscription Level

```javascript
data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "eastus"
}

resource "azurerm_monitor_action_group" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  short_name          = "example"
}

resource "azurerm_consumption_budget_subscription" "example" {
  name            = "example"
  subscription_id = data.azurerm_subscription.current.id

  amount     = 1000
  time_grain = "Monthly"

  time_period {
    start_date = "2022-06-01T00:00:00Z"
    end_date   = "2022-07-01T00:00:00Z"
  }

  filter {
    dimension {
      name = "ResourceGroupName"
      values = [
        azurerm_resource_group.example.name,
      ]
    }

    tag {
      name = "foo"
      values = [
        "bar",
        "baz",
      ]
    }
  }

  notification {
    enabled   = true
    threshold = 90.0
    operator  = "EqualTo"

    contact_emails = [
      "foo@example.com",
      "bar@example.com",
    ]

    contact_groups = [
      azurerm_monitor_action_group.example.id,
    ]

    contact_roles = [
      "Owner",
    ]
  }

  notification {
    enabled        = false
    threshold      = 100.0
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = [
      "foo@example.com",
      "bar@example.com",
    ]
  }
}
```


### Terraform Budget Creation at Management Group Level

```javascript
resource "azurerm_management_group" "example" {
  display_name = "example"
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "eastus"
}

resource "azurerm_consumption_budget_management_group" "example" {
  name                = "example"
  management_group_id = azurerm_management_group.example.id

  amount     = 1000
  time_grain = "Monthly"

  time_period {
    start_date = "2022-06-01T00:00:00Z"
    end_date   = "2022-07-01T00:00:00Z"
  }

  filter {
    dimension {
      name = "ResourceGroupName"
      values = [
        azurerm_resource_group.example.name,
      ]
    }

    tag {
      name = "foo"
      values = [
        "bar",
        "baz",
      ]
    }
  }

  notification {
    enabled   = true
    threshold = 90.0
    operator  = "EqualTo"

    contact_emails = [
      "foo@example.com",
      "bar@example.com",
    ]
  }

  notification {
    enabled        = false
    threshold      = 100.0
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = [
      "foo@example.com",
      "bar@example.com",
    ]
  }
}
```
