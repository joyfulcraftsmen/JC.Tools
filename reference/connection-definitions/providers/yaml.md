# YAML Connection Definition Provider

When using YAML [Connection Definition Provider](../connection-definition-providers), you store your connection definitiions in a YAML file:

![YAML connection definition provider](../../../Images/media/yaml-connection-definition-provider.jpg)

The [Connection Definitions](../what-is-connection-definition) are defined between lines 1 and 11 in the above example. For each Connection Definition, you need to provide ConnectionName, ConnectionType and ConnectionString properties. All of them are mandatory.

Notice you can (but you don't have to) store both your Connection Definitions and Test Definitions in the very same file. This is very convenient for development of tests.