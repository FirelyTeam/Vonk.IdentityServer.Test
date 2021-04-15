# Identity Provider for testing Vonk access control

[Firely Server](https://server.fire.ly) provides access control features based on SMART on FHIR scopes and launch context. Because online available Open ID Connect providers do not provide these claims, we provide you with a simple in-memory Identity Provider that **can** provide these claims.

For instructions on how to use this and the access control features to use it for, see the Vonk documentation:

- [Vonk FHIR Server Access Control](https://docs.fire.ly/firelyserver/security/accesscontrol.html)
- [Usage of this Identity Provider](http://docs.fire.ly/firelyserver/deployment/identityprovider.html)

|Master|
|---|
[![Build Status](https://firely.visualstudio.com/Vonk.IdentityServer.Test/_apis/build/status/FirelyTeam.Vonk.IdentityServer.Test?repoName=FirelyTeam%2FVonk.IdentityServer.Test&branchName=main)](https://firely.visualstudio.com/Vonk.IdentityServer.Test/_build/latest?definitionId=27&repoName=FirelyTeam%2FVonk.IdentityServer.Test&branchName=main)

## Dependencies

- Microsoft .NET Core 3.1
- Microsoft Windows (to run Powershell script to generate SSL certs)
- Microsoft Visual Studio
- [.NET FHIR API](https://github.com/FirelyTeam/firely-net-sdk)

The Identity Provider runs with preconfigured values in memory, so it has no database dependencies.

## Thank you

This Identity Provider is built on top [IdentityServer4](https://github.com/IdentityServer/IdentityServer4), an excellent project to get started with Open ID Connect.
