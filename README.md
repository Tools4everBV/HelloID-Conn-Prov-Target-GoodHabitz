
# HelloID-Conn-Prov-Target-GoodHabitz

> [!IMPORTANT]
> This repository contains the connector and configuration code only. The implementer is responsible to acquire the connection details such as username, password, certificate, etc. You might even need to sign a contract or agreement with the supplier before implementing this connector. Please contact the client's application manager to coordinate the connector requirements.

<p align="center">
  <img src="">
</p>

## Table of contents

- [HelloID-Conn-Prov-Target-GoodHabitz](#helloid-conn-prov-target-goodhabitz)
  - [Table of contents](#table-of-contents)
  - [Introduction](#introduction)
    - [Connection settings](#connection-settings)
    - [Remarks](#remarks)
      - [Correlation not being used](#correlation-not-being-used)
      - [Delete only](#delete-only)
  - [Getting help](#getting-help)
  - [HelloID docs](#helloid-docs)

## Introduction

_HelloID-Conn-Prov-Target-GoodHabitz_ is a _target_ connector. _GoodHabitz_ The purpose of this connector is to only delete a person from GoodHabitz using the persons Active Directory email address.

| Endpoint | Description |
| -------- | ----------- |
| /person/forget | Endpoint for removing accounts from GoodHabitz.  |

The following lifecycle actions are available:

| Action                 | Description                                      |
| ---------------------- | ------------------------------------------------ |
| create.ps1             | PowerShell _create_ lifecycle action             |
| delete.ps1             | PowerShell _delete_ lifecycle action             |
| configuration.json     | Default _configuration.json_ |
| fieldMapping.json      | Default _fieldMapping.json_   |

The field mapping can be imported by using the _fieldMapping.json_ file.

### Connection settings

The following settings are required to connect to the API.

| Setting  | Description                        | Mandatory |
| -------- | ---------------------------------- | --------- |
| ApiKey | The ApiKey to connect to the API | Yes       |
| BaseUrl  | The URL to the API                 | Yes       |

### Remarks

#### Correlation not being used

Within the _create_ lifecycle action, the `$outputContext.AccountReference` is set to: `$actionContext.Data.EmailAddress`. However, the account reference is not being used within the _delete_ lifecycle action since the account reference is not being updated.

#### Delete only

The purpose of this connector is to __only__ remove an account from GoodHabitz.

## Getting help

> [!TIP]
> _For more information on how to configure a HelloID PowerShell connector, please refer to our [documentation](https://docs.helloid.com/en/provisioning/target-systems/powershell-v2-target-systems.html) pages_.

> [!TIP]
>  _If you need help, feel free to ask questions on our [forum](https://forum.helloid.com)_.

## HelloID docs

The official HelloID documentation can be found at: https://docs.helloid.com/
